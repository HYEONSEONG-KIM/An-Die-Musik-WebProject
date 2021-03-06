package adm.service.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.MemberVO;

public interface IMemberService {
	
	    //회원 정보를 insert하는 메서드
		public String insertMember(MemberVO memVO);
		
		//아이디 중복체크
		public String idCheck(String memId);
		
		//로그인  
		public MemberVO login(Map<String, String> map); 
		
		//아이디 찾기
		public String findId(Map<String, String> map);
		
		//비밀번호 찾기 select
		public String findPassword(Map<String, String> map);
		
		//비밀번호 찾기 update
		public int findPass (Map<String, String> map);
		
		//회원 정보 변경
		public int memberUpdate(MemberVO memVO);
		
		//회원탈퇴
		public int memberDelete(String id);

}
