package vo;

public class RequestListVO {

	private int request_num;
	private String request_id;
	private String request_code;
	private int request_rc;
	
	public RequestListVO() { }
	
	public RequestListVO(int request_num, String request_id, String request_code, int request_rc) {
		this.request_num = request_num;
		this.request_id = request_id;
		this.request_code = request_code;
		this.request_rc = request_rc;
	}

	public int getRequest_num() {
		return request_num;
	}

	public void setRequest_num(int request_num) {
		this.request_num = request_num;
	}

	public String getRequest_id() {
		return request_id;
	}

	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}

	public String getRequest_code() {
		return request_code;
	}

	public void setRequest_code(String request_code) {
		this.request_code = request_code;
	}

	public int getRequest_rc() {
		return request_rc;
	}

	public void setRequest_rc(int request_rc) {
		this.request_rc = request_rc;
	}
	
	
}
