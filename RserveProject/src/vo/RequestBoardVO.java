package vo;

public class RequestBoardVO {

	private int rb_num;
	private String writer;
	private String title;
	private String content;
	private String write_date;
	private int rb_ref;
	private int rb_seq;
	private int rb_level;
	private int readcount;
	private int flag_rc;
	
	public RequestBoardVO() { }

	public RequestBoardVO(int rb_num, String writer, String title, String content, String write_date, int rb_ref,
			int rb_seq, int rb_level, int readcount, int flag_rc) {
		this.rb_num = rb_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.rb_ref = rb_ref;
		this.rb_seq = rb_seq;
		this.rb_level = rb_level;
		this.readcount = readcount;
		this.flag_rc = flag_rc;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getRb_num() {
		return rb_num;
	}

	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getRb_ref() {
		return rb_ref;
	}

	public void setRb_ref(int rb_ref) {
		this.rb_ref = rb_ref;
	}

	public int getRb_seq() {
		return rb_seq;
	}

	public void setRb_seq(int rb_seq) {
		this.rb_seq = rb_seq;
	}

	public int getRb_level() {
		return rb_level;
	}

	public void setRb_level(int rb_level) {
		this.rb_level = rb_level;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getFlag_rc() {
		return flag_rc;
	}

	public void setFlag_rc(int flag_rc) {
		this.flag_rc = flag_rc;
	}
	
	
}
