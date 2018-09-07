package vo;

public class UpdownflagVO {

	private int updown_num;
	private int flag_up;
	private int flag_down;
	private String updown_id;
	private int mb_num;
	
	public UpdownflagVO() { }
	
	public UpdownflagVO(int updown_num, int flag_up, int flag_down, String updown_id, int mb_num) {
		this.updown_num = updown_num;
		this.flag_up = flag_up;
		this.flag_down = flag_down;
		this.updown_id = updown_id;
		this.mb_num = mb_num;
	}

	public int getUpdown_num() {
		return updown_num;
	}

	public void setUpdown_num(int updown_num) {
		this.updown_num = updown_num;
	}

	public int getFlag_up() {
		return flag_up;
	}

	public void setFlag_up(int flag_up) {
		this.flag_up = flag_up;
	}

	public int getFlag_down() {
		return flag_down;
	}

	public void setFlag_down(int flag_down) {
		this.flag_down = flag_down;
	}

	public String getUpdown_id() {
		return updown_id;
	}

	public void setUpdown_id(String updown_id) {
		this.updown_id = updown_id;
	}

	public int getMb_num() {
		return mb_num;
	}

	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}
	
	
}
