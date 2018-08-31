package vo;

import java.util.List;

public class RequestBoardPageVO {

	private List<RequestBoardVO> requestboardList;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int currentPage;
	private int number;
	
	public RequestBoardPageVO() { }
	
	public RequestBoardPageVO(List<RequestBoardVO> requestboardList, int startPage, int endPage, int totalPage,
			int currentPage, int number) {
		this.requestboardList = requestboardList;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.number = number;
	}

	public List<RequestBoardVO> getRequestboardList() {
		return requestboardList;
	}

	public void setRequestboardList(List<RequestBoardVO> requestboardList) {
		this.requestboardList = requestboardList;
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
