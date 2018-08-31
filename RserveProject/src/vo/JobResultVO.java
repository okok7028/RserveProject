package vo;

public class JobResultVO {

	private int file_num;
	private String original_name;
	private String saved_path;
	private int job_num;
	
	public JobResultVO() { }
	
	public JobResultVO(int file_num, String original_name, String saved_path, int job_num) {
		this.file_num = file_num;
		this.original_name = original_name;
		this.saved_path = saved_path;
		this.job_num = job_num;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getOriginal_name() {
		return original_name;
	}

	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}

	public String getSaved_path() {
		return saved_path;
	}

	public void setSaved_path(String saved_path) {
		this.saved_path = saved_path;
	}

	public int getJob_num() {
		return job_num;
	}

	public void setJob_num(int job_num) {
		this.job_num = job_num;
	}
	
	
}
