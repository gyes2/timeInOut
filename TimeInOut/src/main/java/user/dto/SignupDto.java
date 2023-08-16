package user.dto;

public class SignupDto {
    private String userId;
    private String password;
    private String userName;
    private String email;

    public SignupDto(String userId, String password, String userName, String email) {
        this.userId = userId;
        this.password = password;
        this.userName = userName;
        this.email = email;
    }

    public String getUserId() {
        return userId;
    }

    public String getPassword() {
        return password;
    }
    
    public String getUserName() {
        return userName;
    }

    public String getEmail() {
        return email;
    }
}
