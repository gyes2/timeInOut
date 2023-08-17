package user.dto;

public class MyPageDto {
    private String userId;
    private String userPassword;
    private String companyName;
    private String companyIn;
    private String companyOut;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyIn() {
        return companyIn;
    }

    public void setCompanyIn(String companyIn) {
        this.companyIn = companyIn;
    }

    public String getCompanyOut() {
        return companyOut;
    }

    public void setCompanyOut(String companyOut) {
        this.companyOut = companyOut;
    }
}
