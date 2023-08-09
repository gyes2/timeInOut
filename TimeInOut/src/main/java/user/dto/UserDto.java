package user.dto;

public class UserDto{
	private String userName;
	private String password;
	
	public UserDto(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	public String getUserName() {
		return this.userName;
	}
}