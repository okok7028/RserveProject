package service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import repository.FileDAO;
import repository.ListDAO;
import vo.RequestBoardVO;
import vo.RequestFileVO;
import vo.RequestListVO;
import vo.ResultFileVO;

@Component
public class FileService {

	@Autowired
	private FileDAO dao;
	@Autowired
	private ListDAO ldao;
	
	//결과파일 정보 가져오기
	public ResultFileVO getFile(int request_num){
		return dao.selectResultFile(request_num);
	}
	
	//유저 간편요청 완료 리스트
	public List<RequestListVO> getSimpleCompleteList(String request_id){
		return ldao.selectCompleteList(request_id);
	}
	
	public List<ResultFileVO> SimpleResultList(String request_id){
		List<RequestListVO> resultList = getSimpleCompleteList(request_id);
		List<ResultFileVO> resultFile = new ArrayList<ResultFileVO>();
		for(int i=0; i<resultList.size(); i++){
			ResultFileVO vo=getFile(resultList.get(i).getRequest_num());
			resultFile.add(vo);
		}
		return resultFile;
	}
	
	public RequestFileVO getRBfile(int rb_num){
		return dao.selectRequestFilebyRb(rb_num);
	}
	
	public void fileRBUpload(HttpServletRequest request, MultipartFile[] files, RequestBoardVO vo, 
			int rb_num){
		
				String dirPath = request.getServletContext().getRealPath("/resource/img/");

				File dir = new File(dirPath);

				if(dir.exists() == false) {
					dir.mkdir();
				}

				for (MultipartFile f : files) {
					String savedName = new Random().nextInt(1000000) + "";
					String originalName = f.getOriginalFilename();
					String savedPath = dirPath + savedName;

					RequestFileVO myFile = new RequestFileVO();

					myFile.setRb_num(rb_num);
					myFile.setOriginal_name(originalName);
					myFile.setSaved_path(savedPath);
					myFile.setRequest_num(0);
					File savedFile = new File(savedPath);

					try {
						f.transferTo(savedFile);
						dao.insertRequestFile(myFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}

				}
				
	}
}

