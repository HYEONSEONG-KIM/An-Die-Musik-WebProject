package adm.service.inter;

import java.util.List;
import java.util.Map;

import adm.vo.NoticeVO;

public interface INoticeService {
	
	public void insertNotice (NoticeVO vo);
	
	public List<NoticeVO> noticeList(Map<String, Integer> map);
	
	public int countList();
	
	public NoticeVO selectDetail(int code);
	
	public int updateNotice(NoticeVO vo);
	
	public int updateNotice2(Map<String, Integer>map );
	
	public int deleteNotice(int code);
}
