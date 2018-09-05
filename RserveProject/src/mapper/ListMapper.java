package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.RequestListVO;

public interface ListMapper {
	//요청리스트
	public int insertRequestList(@Param("request_id")String request_id, @Param("request_code")String request_code);
	public List<RequestListVO> selectWaitListfromCode(String request_code);//관리자가 작업할 리스트 가져올때
	public List<RequestListVO> selectWaitListfromId(String request_id);//유저에게 요청 리스트 보여줄때
	public List<RequestListVO> selectCompleteList(String request_id);//완료된 리스트
	public int updateDoneList(int request_num); //완료작업 플래그 업데이트
	public int selectRquestCheck(int request_num); //작업완료유무 확인
}
