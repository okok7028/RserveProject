package vo;

public class MainCommentVO {

	private int comment_num;
	private int mb_num;
	private String writer;
	private String comment_pw;
	private String content;
	private int comment_origin_num;
	private String write_date;
	private int c_level;
	private int flag_lock;
	
	public MainCommentVO() { }
	
	public MainCommentVO(int comment_num, int mb_num, String writer, String comment_pw, String content,
			int comment_origin_num, String write_date, int c_level, int flag_lock) {
		this.comment_num = comment_num;
		this.mb_num = mb_num;
		this.writer = writer;
		this.comment_pw = comment_pw;
		this.content = content;
		this.comment_origin_num = comment_origin_num;
		this.write_date = write_date;
		this.c_level = c_level;
		this.flag_lock = flag_lock;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getMb_num() {
		return mb_num;
	}

	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getComment_pw() {
		return comment_pw;
	}

	public void setComment_pw(String comment_pw) {
		this.comment_pw = comment_pw;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getComment_origin_num() {
		return comment_origin_num;
	}

	public void setComment_origin_num(int comment_origin_num) {
		this.comment_origin_num = comment_origin_num;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public int getFlag_lock() {
		return flag_lock;
	}

	public void setFlag_lock(int flag_lock) {
		this.flag_lock = flag_lock;
	}
	
	
}
