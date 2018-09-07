package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.MainBoardVO;
import vo.UpdownflagVO;

public interface MainBoardMapper {
	//메인 게시판
	public int insertMainBoard(MainBoardVO vo); // 글작성
	public int selectMainMaxNum(); // 제일 윗 글번호
	public List<MainBoardVO> selectMainBoardList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	public MainBoardVO selectMainBoard(int mb_num);//세부글정보
	public int selectMainBoardCount(); // 총 게시글 수
	public int updateMainReply(@Param("mb_ref")int mb_ref, @Param("mb_seq")int mb_seq);
	public int updateMainReadCount(int mb_num); // 조회수 증가
	public int updateMainBoard(MainBoardVO vo); // 글수정
	public int deleteMainBoard(int mb_num); // 글삭제
	
	//메인게시판 추천반대
	public MainBoardVO selectUpDown(int mb_num);
	public int upRecommend(int mb_num);
	public int downOpposite(int mb_num);
	
	public int reRecommend(int mb_num);
	public int reOpposite(int mb_num);
	
	public int insertUpdownflag(UpdownflagVO updown);
	public UpdownflagVO selectUpdownflag(@Param("mb_num")int mb_num, @Param("updown_id")String updown_id);
	public int updateUpdownflag(UpdownflagVO updown);
	public int deleteUpdownflag();

}
