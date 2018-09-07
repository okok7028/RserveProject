package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import repository.MainBoardDAO;
import repository.RequestBoardDAO;
import vo.MainBoardPageVO;
import vo.MainBoardVO;
import vo.RequestBoardPageVO;
import vo.RequestBoardVO;
import vo.UpdownflagVO;

@Component
public class BoardService {

	private static final int PAGE_PER_COUNT = 5; 
	private static final int PAGE_BLOCK_COUNT = 5;
	
	@Autowired
	private RequestBoardDAO rbdao;
	
	@Autowired
	private MainBoardDAO mbdao;
	
	public RequestBoardPageVO makeRequestBoardPage(int currentPage) {
	
		int totalBoardCount = rbdao.selectRequestBoardCount();
		int totalPageCount = totalBoardCount/PAGE_PER_COUNT;
		if(totalBoardCount%PAGE_PER_COUNT != 0) totalPageCount++;

		int number = totalBoardCount-(currentPage-1)*PAGE_PER_COUNT;
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT+1;
		int endRow = currentPage*PAGE_PER_COUNT;
		List<RequestBoardVO> boardList = rbdao.selectRequestBoardList(startRow, endRow);

		int startPage = (currentPage-1)/PAGE_BLOCK_COUNT*PAGE_BLOCK_COUNT+1;
		
		int endPage = startPage+PAGE_BLOCK_COUNT-1;
		if(endPage>totalPageCount) endPage = totalPageCount;
		
		return new RequestBoardPageVO(boardList, startPage, endPage, totalPageCount, currentPage, number);
	}
	
	public MainBoardPageVO makeMainBoardPage(int currentPage) {

		int totalBoardCount = mbdao.selectMainBoardCount();
		int totalPageCount = totalBoardCount/PAGE_PER_COUNT;
		if(totalBoardCount%PAGE_PER_COUNT != 0) totalPageCount++;

		int number = totalBoardCount-(currentPage-1)*PAGE_PER_COUNT;
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT+1;
		int endRow = currentPage*PAGE_PER_COUNT;
		List<MainBoardVO> boardList = mbdao.selectMainBoardList(startRow, endRow);

		int startPage = (currentPage-1)/PAGE_BLOCK_COUNT*PAGE_BLOCK_COUNT+1;
		
		int endPage = startPage+PAGE_BLOCK_COUNT-1;
		if(endPage>totalPageCount) endPage = totalPageCount;
		
		return new MainBoardPageVO(boardList, startPage, endPage, totalPageCount, currentPage, number);
	}
	
	public RequestBoardVO readRB(int rb_num) {
		if(rbdao.updateRequestReadCount(rb_num) > 0) {
			return rbdao.selectRequestBoard(rb_num);
		}else {
			return null;
		}
	}
	
	public MainBoardVO readMB(int mb_num) {
		if(mbdao.updateMainReadCount(mb_num) > 0) {
			return mbdao.selectMainBoard(mb_num);
		}else {
			return null;
		}
	}
	
	public RequestBoardVO readRBWithoutCount(int rb_num) {
		return rbdao.selectRequestBoard(rb_num);
	}
	
	public MainBoardVO readMBWithoutCount(int mb_num) {
		return mbdao.selectMainBoard(mb_num);
	}
	
	public int writeRB(RequestBoardVO rb, int num) {
		int number = 1;
		String content="";
		if((Integer)rbdao.selectRequestMaxNum() != 0) {
			number = rbdao.selectRequestMaxNum()+1;
		}
		
		int rb_ref = rb.getRb_ref();
		int rb_seq = rb.getRb_seq();
		int rb_level = rb.getRb_level();
		if(num != 0) { // 답글
			rbdao.updateRequestReply(rb_ref, rb_seq);
			rb_seq++; rb_level++;
		}else { //새글
			rb_ref=number;
			rb_seq=0;
			rb_level=0;
		}
		content=rb.getContent().replace("\r\n", "<br>");
		rb.setContent(content);
		rb.setRb_ref(rb_ref);
		rb.setRb_seq(rb_seq);
		rb.setRb_level(rb_level);
		rbdao.insertRequesstBoard(rb);
		return rb.getRb_num();
	}
	
	public int writeMB(MainBoardVO mb, int num) {
		int number = 1;
		String content="";
		if((Integer)mbdao.selectMainMaxNum() != 0) {
			number = mbdao.selectMainMaxNum()+1;
		}
		
		int mb_ref = mb.getMb_ref();
		System.out.println(mb_ref);
		int mb_seq = mb.getMb_seq();
		int mb_level = mb.getMb_level();
		if(num != 0) { // 답글
			mbdao.updateMainReply(mb_ref, mb_seq);
			mb_seq++; mb_level++;
		}else { //새글
			mb_ref=number;
			mb_seq=0;
			mb_level=0;
		}
		content=mb.getContent().replace("\r\n", "<br>");
		mb.setContent(content);
		mb.setMb_ref(mb_ref);
		mb.setMb_seq(mb_seq);
		mb.setMb_level(mb_level);
		mbdao.insertMainBoard(mb);
		return mb.getMb_num();
	}
	
	public MainBoardVO processUpDown(String code, int mb_num, String updown_id){
		UpdownflagVO udf = null; 
		udf =	mbdao.selectUpdownflag(mb_num, updown_id);
		int up = 0;
		int down = 0;
		if(udf!=null){
			up = udf.getFlag_up();
			down = udf.getFlag_down();
		}else{
			udf = new UpdownflagVO();
			udf.setUpdown_id(updown_id);
			udf.setMb_num(mb_num);
		}
		if(code.equals("check")){
			
		}else if(code.equals("up")){
			if(up==0 && down==0){
				udf.setFlag_up(1);
				udf.setFlag_down(0);
				mbdao.insertUpdownflag(udf);
				mbdao.upRecommend(mb_num);
			}else if(up==1 && down==0){
				return null;
			}else if(up==0 && down==1){
				udf.setFlag_up(1);
				udf.setFlag_down(0);
				mbdao.updateUpdownflag(udf);
				mbdao.upRecommend(mb_num);
				mbdao.reOpposite(mb_num);
			}
		}else if(code.equals("down")){
			if(up==0 && down==0){
				udf.setFlag_up(0);
				udf.setFlag_down(1);
				mbdao.insertUpdownflag(udf);
				mbdao.downOpposite(mb_num);
			}else if(up==1 && down==0){
				udf.setFlag_up(0);
				udf.setFlag_down(1);
				mbdao.updateUpdownflag(udf);
				mbdao.downOpposite(mb_num);
				mbdao.reRecommend(mb_num);
			}else if(up==0 && down==1){
				return null;
			}
		}
		return mbdao.selectUpDown(mb_num);
	}
	
	//	@Scheduled(cron="0 * * * * *") // 테스트를위한 1분마다 초기화
	@Scheduled(cron="0 0 0 * * *")//매일 24시 초기화
		public void deleteUpdownFlag(){
			mbdao.deleteUpdownflag();
			System.out.println("추천반대 리셋");
		}
}
