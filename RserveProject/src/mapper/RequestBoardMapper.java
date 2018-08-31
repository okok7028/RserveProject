package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.RequestBoardVO;

public interface RequestBoardMapper {

	//요청 게시판
		public int insertRequesstBoard(RequestBoardVO vo); // 글작성
		public int selectRequestMaxNum(); // 제일 윗 글번호
		public List<RequestBoardVO> selectRequestBoardList(@Param("startRow") int startRow, @Param("endRow") int endRow);
		public RequestBoardVO selectRequestBoard(int rb_num);//세부글정보
		public int selectRequestBoardCount(); // 총 게시글 수
		public int updateRequestReply(@Param("rb_ref")int rb_ref, @Param("rb_seq")int rb_seq);
		public int updateRequestReadCount(int rb_num); // 조회수 증가
		public int updateRequestBoard(RequestBoardVO vo); // 글수정
		public int deleteRequestBoard(int boardNum); // 글삭제
		
		public int updateFlagRC(int rb_num); // 요청완료 표시
}
