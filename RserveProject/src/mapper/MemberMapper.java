package mapper;

import org.apache.ibatis.annotations.Param;

import vo.MemberVO;

public interface MemberMapper {

	public int insertMem(MemberVO member); // 회원정보 입력
	public int updateMem(MemberVO member); // 회원정보 수정
	public MemberVO selectMem(String id); // 회원정보 조회
	
	public String getPassbyId(String id); // 비밀번호 가져오기
	
	public int updatePassword(@Param("id")String id, @Param("password")String password); // 비밀번호만 변경
	public int deleteMem(String id); // 회원 탈퇴
	public String getFlag(String id); // 회원 등급 확인 
	
}
