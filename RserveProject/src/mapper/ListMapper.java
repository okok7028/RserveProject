package mapper;

import java.util.List;

import vo.JobListVO;
import vo.RequestListVO;

public interface ListMapper {
	//요청리스트
	public int insertRequestList(RequestListVO vo);
	public List<RequestListVO> selectWaitList(String request_code);//작업해야할 리스트
	public int updateDoneList(int request_num); //완료작업 플래그 업데이트
	public int selectRquestCheck(int request_num); //작업완료유무 확인
	//관리자 작업 리스트
	public int insertJobList(JobListVO vo);
}
