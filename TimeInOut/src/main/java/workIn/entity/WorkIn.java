package workIn.entity;

import user.entity.User;

public class WorkIn{
	private Long id;
	private String workIn;
	private String workOut;
	private String today;
	private String status;
	private User user;
	
	public String getWorkIn() {
		return workIn;
	}
	public void setWorkIn(String workIn) {
		this.workIn = workIn;
	}
	public String getWorkOut() {
		return workOut;
	}
	public void setWorkOut(String workOut) {
		this.workOut = workOut;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}