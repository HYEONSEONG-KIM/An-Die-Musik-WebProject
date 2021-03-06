package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.ITicketingDao;
import adm.vo.AdvantkVO;
import adm.vo.AvdSeatVO;
import adm.vo.PblprfrVO;
import adm.vo.ReserveVO;
import amd.config.BuildedSqlMapClient;

public class TicketingDaoimple implements ITicketingDao{
	
	private SqlMapClient smc = null;
	private static TicketingDaoimple dao = null;

	private TicketingDaoimple() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static TicketingDaoimple getInstance() {
		if(dao == null) {
			dao = new TicketingDaoimple();
		}
		return dao;
	}

	@Override
	public List<PblprfrVO> selectPblNm(String pblDate) throws SQLException {
		return smc.queryForList("ticketing.selectPblNm", pblDate);
	}

	@Override
	public PblprfrVO selectPbl(int code) throws SQLException {
		return (PblprfrVO) smc.queryForObject("pblprfr.selectPerfDetail",code);
	}

	@Override
	public List<AvdSeatVO> selectSeat(int code) throws SQLException {
		return smc.queryForList("ticketing.selectSeat", code);
	}

	@Override
	public void insertAdv(AdvantkVO vo) throws SQLException {
		smc.insert("ticketing.insertAdv",vo);
	}

	@Override
	public List<ReserveVO> selectReserv(String id) throws SQLException {
		return smc.queryForList("ticketing.selectReserv",id);
	}

	@Override
	public ReserveVO ReservDetail(int code) throws SQLException {
		return (ReserveVO) smc.queryForObject("ticketing.ReservDetail",code);
	}

	@Override
	public int deleteReserv(int code) throws SQLException {
		return smc.delete("ticketing.deleteReserv",code);
	}
	
	
}
