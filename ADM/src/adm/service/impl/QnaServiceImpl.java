package adm.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.impl.QnaDaoImpl;
import adm.dao.inter.IQnaDao;
import adm.service.inter.IQnaService;
import adm.vo.QnaVO;
import adm.vo.QnasVO;

public class QnaServiceImpl implements IQnaService {
	private IQnaDao dao;
	private static IQnaService service;
	
	private QnaServiceImpl() {
		dao = QnaDaoImpl.getDao();
	}
	
	public static IQnaService getService() {
		if(service == null) service = new QnaServiceImpl();
		
		return service;
	}

	//공지사항 리스트
	@Override
	public List<QnaVO> qnaList(Map<String, Integer> map) {
		List<QnaVO> qnaVo = null;
		
		try {
			qnaVo = dao.qnaList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnaVo;
	}

	//공지사항 글개수
	@Override
	public int qnaCount() {
		int cnt = 0;
		
		try {
			cnt = dao.qnaCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	//공지사항 상세보기
	@Override
	public QnaVO qnaDetail(int code) {
		QnaVO vo = null;
		
		try {
			vo = dao.qnaDetail(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public void qnaInsert(QnaVO vo) {
		try {
			dao.qnaInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		int code = 0;
		
		try {
			code = dao.qnaUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return code;
	}

//	@Override
//	public int qnaUpdate2(Map<String, Integer> map) {
//		int cnt = 0;
//		
//		try {
//			cnt = dao.qnaUpdate2(map);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return cnt;
//	}

	@Override
	public int qnaDelete(int code) {
		int cnt = 0;
		
		try {
			cnt = dao.qnaDelete(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int qnaCnt(int code) {
		int cnt = 0;
		
		try {
			cnt = dao.qnaCnt(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int qnaReplyInsert(QnasVO vo) {
		int seq = 0;
		
		try {
			seq = dao.qnaReplyInsert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}

	@Override
	public List<QnasVO> qnaReplyList(int code) {
		List<QnasVO> reList = null;
		
		try {
			reList = dao.qnaReplyList(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reList;
	}

	@Override
	public int qnaReplyUpdate(QnasVO vo) {
		int upd = 0;
		
		try {
			upd = dao.qnaReplyUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return upd;
	}

	@Override
	public int qnaReplyDelete(int code) {
		int del = 0;
		
		try {
			del = dao.qnaReplyDelete(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(del);
		return del;
	}

	@Override
	public int qnasCount() {
		int cnt = 0;
		
		try {
			cnt = dao.qnasCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<QnaVO> qnaAllList(String id) {
		List<QnaVO> list = null;
		try {
			list = dao.qnaAllList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<QnaVO> qnaList2(Map<String, Object> map) {
		List<QnaVO> qnaVo = null;
		
		try {
			qnaVo = dao.qnaList2(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnaVo;
	}

}








