package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapException;

import adm.vo.FansVO;
import adm.vo.FboardVO;

public interface IFboardDao {
	
	//자유게시판 글 쓰기
	public void insertFboard(FboardVO vo) throws SQLException;
	
	//전체 게시글출력
	public List<FboardVO> fboardAllList (Map<String, Integer> map) throws SQLException; 
	
	//my페이지 리스트 출력
	public List<FboardVO> fboardAllList2 (Map<String, Object> map) throws SQLException; 
	
	//리스트 가져오기 2
	public List<FboardVO> fboardList2 (String id) throws SQLException;
	
	//글 개수 가져오기
	public int fboardList() throws SQLException;
	
	//상세내용
	public FboardVO selectDetail(int fcode) throws SQLException;
	
	//수정1
	public int updateFboard(FboardVO vo) throws SQLException;
	
	//수정2
	public int updateFboard2(Map<String, Integer> map) throws SQLException;
	
	//삭제
	public int deleteFboard(int code) throws SQLException;
	
	//조회수 증가
	public int fboCnt(int code) throws SQLException; 
	
	
	
	
	
	
	
	//댓글 저장
	public void insertReply(FansVO vo) throws SQLException;
	
	//댓글리스트
	public List<FansVO> replyList(int bo) throws SQLException;
	
	//댓글 삭제
	public int deleteReply(int code) throws SQLException;
	
	//댓글 수정
	public int updateReply(FansVO vo) throws SQLException;

	
}
