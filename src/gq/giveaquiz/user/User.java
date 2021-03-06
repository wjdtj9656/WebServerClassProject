package gq.giveaquiz.user;
 
import java.sql.SQLException;

public class User {
    private String userId;
    private String password;
    private String name;

    
    public User(String userId, String password, String name) {
        super();
        this.userId = userId;
        this.password = password;
        this.name = name;

    }
        
    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }
    
    public String getName() {
        return name;
    }
 
    public boolean matchPassword(String newPassword) { 
        return this.password.equals(newPassword);
    }
    public static boolean login(String userId, String password) 
            throws UserNotFoundException, PasswordMismatchException {
            UserDAO userDAO = new UserDAO();
            User user = null;
            try {
                user = userDAO.findByUserId(userId);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            if(user == null){
                throw new UserNotFoundException();
            }
            
            if(!user.matchPassword(password)){
                throw new PasswordMismatchException();
            }
            
            return true;
        }

    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((userId == null) ? 0 : userId.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((password == null) ? 0 : password.hashCode());
        return result;
    }
 
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (password == null) {
            if (other.password != null)
                return false;
        } else if (!password.equals(other.password))
            return false;
        if (userId == null) {
            if (other.userId != null)
                return false;
        } else if (!userId.equals(other.userId))
            return false;
        return true;
    }
    
    @Override
    public String toString() {
        return "User [userId=" + userId + ", password=" + password + ", name=" + name + "]";
    }
 
 
}
 