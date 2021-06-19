package adm.service.impl;

import java.sql.SQLException;
import java.util.List;

import adm.dao.impl.TicketingDaoimple;
import adm.dao.inter.ITicketingDao;
import adm.service.inter.ITicketingService;
import adm.vo.AdvantkVO;
import adm.vo.AvdSeatVO;
import adm.vo.PblprfrVO;
import adm.vo.ReserveVO;

public class TicketingServiceImpl implements ITicketingService {
	
	private ITicketingDao dao = null;
	private static TicketingServiceImpl service = null;
	
	private TicketingServiceImpl() {
		dao = TicketingDaoimple.getInstance();
	}
	
	public static TicketingServiceImpl getInstance() {
		if(service == null) {
			service = new TicketingServiceImpl();
		}
		return service;
	}

	@Override
	public List<PblprfrVO> selectPblNm(String pblDate) {
		List<PblprfrVO> vo = null;
		
		try {
			vo = dao.selectPblNm(pblDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}


	@Override
	public PblprfrVO selectPbl(int code) {
		PblprfrVO vo = null;
		try {
			vo = dao.selectPbl(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public List<AvdSeatVO> selectSeat(int code) {
		List<AvdSeatVO> vo = null;
		
		try {
			vo = dao.selectSeat(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void insertAdv(AdvantkVO vo) {
		try {
			dao.insertAdv(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<ReserveVO> selectReserv(String id) {
		List<ReserveVO> list = null;
		
		try {
			list = dao.selectReserv(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ReserveVO ReservDetail(int code) {
		ReserveVO vo = null;
		
		try {
			vo = dao.ReservDetail(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int deleteReserv(int code) {
		int result = 0;

		try {
			result = dao.deleteReserv(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
