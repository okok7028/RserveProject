package mapper;

import java.util.List;

import vo.JobResultVO;
import vo.RequestFileVO;
import vo.ResultFileVO;

public interface FileMapper {
	// 요청 파일
	public int insertRequestFile(RequestFileVO vo);
	public List<RequestFileVO> selectRequestFiles(int request_num);
	// 요청 작업완료 파일
	public int insertResultFile(ResultFileVO vo);
	public List<ResultFileVO> selectResultFiles(int request_num);
	public int checkDoneRequest(int request_num); // 작업완료 확인
	// 관리자 작업 파일
	public int insertJobResultFile(JobResultVO vo);
	public List<JobResultVO> selectJobResultFiles(int job_num);
}
