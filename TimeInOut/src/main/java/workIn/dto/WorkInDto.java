package workIn.dto;

public class WorkInDto{
	private String userId;
	private String workIn;
	private String workOut;
	//'Y': 출석, 'N':결석, 'L':지각, 'E':조퇴
	private String status;
	
	public WorkInDto(String userId,String workIn,String workOut,String status) {
		this.setUserId(userId);
		this.setWorkIn(workIn);
		this.setWorkOut(workOut);
		this.setStatus(status);
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}