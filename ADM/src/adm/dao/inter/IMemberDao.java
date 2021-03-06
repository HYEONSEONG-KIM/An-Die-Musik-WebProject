package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.MemberVO;

public interface IMemberDao {
	
	//회원 정보를 insert하는 메서드
	public String insertMember(MemberVO memVO) throws SQLException;
	
	//아이디 중복 체크
	public String idCheck(String memId) throws SQLException;
	
	//로그인  
	public MemberVO login(Map<String, String> map) throws SQLException; 
	
	//아이디 찾기
	public String findId(Map<String, String> map) throws SQLException;
	
	//비밀번호 select
	public String findPassword(Map<String, String> map) throws SQLException;
	
	//비밀번호 찾기update
	public int findPass (Map<String, String> map) throws SQLException;
	
	//회원 정보 변경
	public int memberUpdate(MemberVO memVO) throws SQLException;
	
	//회원탈퇴
	public int memberDelete(String id) throws SQLException;
}
