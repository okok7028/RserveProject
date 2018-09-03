package vo;

public class JobListVO {

	private int job_num;
	private String title;
	private String content;
	private String write_date;
	
	public JobListVO() { }
	
	public JobListVO(int job_num, String title, String content, String write_date) {
		this.job_num = job_num;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
	}

	public int getJob_num() {
		return job_num;
	}

	public void setJob_num(int job_num) {
		this.job_num = job_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	
}
