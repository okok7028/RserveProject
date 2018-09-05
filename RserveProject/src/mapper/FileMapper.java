package mapper;

import java.util.List;

import vo.RequestFileVO;
import vo.ResultFileVO;

public interface FileMapper {
	// 요청 파일
	public int insertRequestFile(RequestFileVO vo);
	public RequestFileVO selectRequestFile(int request_num);
	public RequestFileVO selectRequestFilebyRb(int rb_num);
	// 요청 작업완료 파일
	public int insertResultFile(ResultFileVO vo);
	public List<ResultFileVO> selectResultFiles(int request_num);
	public ResultFileVO selectResultFile(int request_num);
	public int checkDoneRequest(int request_num); // 작업완료 확인

}
