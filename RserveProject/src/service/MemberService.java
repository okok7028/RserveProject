package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDAO;
import vo.MemberVO;

@Component
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	//	회원가입
	public boolean memberValidator(MemberVO member) {
		if( member.getId()==null || member.getId()=="" ||
			member.getPassword()==null || member.getPassword()=="" ||
			member.getName()==null || member.getName()=="" ||
			member.getPhone() == null || member.getPhone()=="" ||
			member.getEmail()==null || member.getEmail()==""){
			return false;
		}else {
			dao.insertMem(member);
			return true;
		}
	}
	
//	업데이트
	public boolean updateValidator(MemberVO member) {
		member.setPassword(dao.getPassbyId(member.getId()));
		if( member.getId()==null || member.getId()=="" ||
			member.getPassword()==null || member.getPassword()=="" ||
			member.getName()==null || member.getName()=="" ||
			member.getPhone() == null || member.getPhone()=="" ||
			member.getEmail()==null || member.getEmail()==""){
			return false;
		}else {
			dao.updateMem(member);
			return true;
		}
	}	
	
	//비밀번호 가져오기 // 아이디 중복체크
	public String getPassword(String id){
		return dao.getPassbyId(id);
	}
	
	// 로그인 ID PW 확인
	public boolean loginCheck(String userId, String userPw) {
		String passwd = dao.getPassbyId(userId);
		if(passwd != null && userPw.equals(passwd) ) {
			return true;
		}else {
			return false;
		}
	}	
	
	// 회원정보 가져오기
	public MemberVO getMember(String id) {
		return dao.selectMem(id);
	}
	
	// 비밀번호 변경
	public int updatePassword(String id, String password){
		return dao.updatePassword(id, password);
	}
	
	//회원 탈퇴
	public int deleteMember(String id){
		int x = dao.deleteMem(id);
		return x;
	}
	
	//회원등급 확인
	public boolean isAdmin(String id){
		if(dao.getFlag(id).equals("radmin")){
			return true;
		}else{
			return false;
		}
	}	
}
