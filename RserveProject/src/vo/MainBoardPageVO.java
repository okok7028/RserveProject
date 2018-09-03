package vo;

import java.util.List;

public class MainBoardPageVO {

	private List<MainBoardVO> mainboardList;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int currentPage;
	private int number;
	
	public MainBoardPageVO() { }
	
	public MainBoardPageVO(List<MainBoardVO> mainboardList, int startPage, int endPage, int totalPage, int currentPage,
			int number) {
		this.mainboardList = mainboardList;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.number = number;
	}

	public List<MainBoardVO> getMainboardList() {
		return mainboardList;
	}

	public void setMainboardList(List<MainBoardVO> mainboardList) {
		this.mainboardList = mainboardList;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
	
}
