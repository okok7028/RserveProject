package vo;

public class MainBoardVO {

	private int mb_num;
	private String writer;
	private String title;
	private String content;
	private String write_date;
	private int mb_ref;
	private int mb_seq;
	private int mb_level;
	private int readcount;
	private int recommend;
	private int opposite;
	
	public MainBoardVO() { }
	
	public MainBoardVO(int mb_num, String writer, String title, String content, String write_date, int mb_ref,
			int mb_seq, int mb_level, int readcount, int recommend, int opposite) {
		this.mb_num = mb_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.mb_ref = mb_ref;
		this.mb_seq = mb_seq;
		this.mb_level = mb_level;
		this.readcount = readcount;
		this.recommend = recommend;
		this.opposite = opposite;
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

	public int getMb_ref() {
		return mb_ref;
	}

	public void setMb_ref(int mb_ref) {
		this.mb_ref = mb_ref;
	}

	public int getMb_seq() {
		return mb_seq;
	}

	public void setMb_seq(int mb_seq) {
		this.mb_seq = mb_seq;
	}

	public int getMb_level() {
		return mb_level;
	}

	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getOpposite() {
		return opposite;
	}

	public void setOpposite(int opposite) {
		this.opposite = opposite;
	}

	
	
	
}
