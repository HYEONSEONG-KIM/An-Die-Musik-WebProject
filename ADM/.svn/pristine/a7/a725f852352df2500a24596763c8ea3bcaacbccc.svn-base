package adm.service.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.controller.insertFormServlet;
import adm.vo.FansVO;
import adm.vo.FboardVO;

public interface IFboardService {
	
	//자유게시판 글 쓰기
	public void insertFboard(FboardVO vo);		
	
	//전체 글 가져오기
	public List<FboardVO> fboardAllList (Map<String, Integer> map);
	
	//마이게시판
	public List<FboardVO> fboardAllList2 (Map<String, Object> map);
	
	//글 개수 가져오기
	public int fboardList();
	
	//상세내용
	public FboardVO selectDetail(int fcode);
	
	//수정1
	public int updateFboard(FboardVO vo);
	
	//수정2
	public int updateFboard2(Map<String, Integer> map);
	
	//삭제
	public int deleteFboard(int code);
	
	//리스트 가져오기 2
	public List<FboardVO> fboardList2 (String id); 
	
	//댓글 저장
	public void insertReply(FansVO vo);

	//전체 출력
	public List<FansVO> replyList(int bo);
	
	//댓글 삭제
	public int deleteReply(int code);
	
	//댓글 수정
	public int updateReply(FansVO vo);
	
	//조회수 증가
	public int fboCnt(int code); 
	
}
