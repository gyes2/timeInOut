package user.dto;

public class MyPageDto {
    private String userId;
    private String userPassword;
    private String companyName;
    private String companyInHour;
	private String companyInMinute;
	private String companyOutHour;
	private String companyOutMinute;

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

	public String getCompanyInHour() {
		return companyInHour;
	}

	public void setCompanyInHour(String companyInHour) {
		this.companyInHour = companyInHour;
	}

	public String getCompanyInMinute() {
		return companyInMinute;
	}

	public void setCompanyInMinute(String companyInMinute) {
		this.companyInMinute = companyInMinute;
	}

	public String getCompanyOutHour() {
		return companyOutHour;
	}

	public void setCompanyOutHour(String companyOutHour) {
		this.companyOutHour = companyOutHour;
	}

	public String getCompanyOutMinute() {
		return companyOutMinute;
	}

	public void setCompanyOutMinute(String companyOutMinute) {
		this.companyOutMinute = companyOutMinute;
	}

    
}
