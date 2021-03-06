package adm.service.impl;

import java.sql.SQLException;
import java.util.List;

import adm.dao.impl.PblDaoImpl;
import adm.dao.inter.IPblDao;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;
import adm.vo.PrfplcVO;
import adm.vo.SeriesVO;
import adm.vo.TeamVO;

// 공연 정보 데이터 조작 service class
public class PblServiceImple implements IPblService {

	private IPblDao dao = null;
	private static PblServiceImple service = null;
	
	public PblServiceImple() {
		dao = PblDaoImpl.getInstance();
	}
	
	public static PblServiceImple getInstance(){
		if(service == null) service = new PblServiceImple();
		return service;
	}
	
	@Override
	public List<PrfplcVO> prfList() {
		List<PrfplcVO> list = null;
		
		try {
			list = dao.prfList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TeamVO> teamList() {
		List<TeamVO> list = null;
		
		try {
			list = dao.teamList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<SeriesVO> seriesList() {
		List<SeriesVO> list = null;
		
		try {
			list = dao.seriesList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertPerf(PblprfrVO vo) {
		try {
			dao.insertPerf(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<PblprfrVO> selectPerf() {
		List<PblprfrVO> list = null;
		
		try {
			list = dao.selectPerf();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<PblprfrVO> selectPerfTeam(String team) {
		
		List<PblprfrVO> list = null;
		
		try {
			list = dao.selectPerfTeam(team);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public PblprfrVO selectPerfDetail(int pbl_code) {
		PblprfrVO vo = null;
		
		try {
			vo = dao.selectPerfDetail(pbl_code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int updatePerf(PblprfrVO vo) {
		int result = 0;
		
		try {
			result = dao.updatePerf(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deletePerf(int code) {
		int result = 0;
		try {
			result = dao.deletePerf(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
