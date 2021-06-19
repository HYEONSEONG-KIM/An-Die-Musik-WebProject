package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IFboardDao;
import adm.service.inter.IFboardService;
import adm.vo.FansVO;
import adm.vo.FboardVO;
import adm.vo.MemberVO;
import amd.config.BuildedSqlMapClient;

public class FboardDaoImpl implements IFboardDao {

	private SqlMapClient smc;
	private static FboardDaoImpl dao = null;

	private FboardDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}

	public static FboardDaoImpl getDao() {
		if (dao == null)
			dao = new FboardDaoImpl();
		
		return dao; 
				
	}

	@Override
	public void insertFboard(FboardVO vo) throws SQLException {
		smc.insert("fboard.insertFboard", vo);
	}

	@Override
	public int fboardList() throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.queryForObject("fboard.fboardList");
	}

	@Override
	public FboardVO selectDetail(int fcode) throws SQLException {
		
		return (FboardVO)smc.queryForObject("fboard.selectDetail", fcode);
	}

	@Override
	public List<FboardVO> fboardAllList2(Map<String, Object> map) throws SQLException {
		return smc.queryForList("fboard.fboardAllList2", map);
	}


	
	@Override
	public int updateFboard(FboardVO vo) throws SQLException {
		return smc.update("fboard.updateFboard", vo);
	}

	@Override
	public int updateFboard2(Map<String, Integer> map) throws SQLException {
		return smc.update("fboard.updateFboard2", map);
	}

	@Override
	public int deleteFboard(int code) throws SQLException {
	
		return smc.delete("fboard.deleteFboard", code);
	}

	@Override
	public void insertReply(FansVO vo) throws SQLException {
		
	
		smc.insert("fboard.insertReply",vo);
	}


	@Override
	public List<FansVO> replyList(int bo) throws SQLException {
		
		return smc.queryForList("fboard.replyList", bo);
	}

	@Override
	public int deleteReply(int code) throws SQLException {
		
		return smc.delete("fboard.deleteReply", code);
	}

	@Override
	public int updateReply(FansVO vo) throws SQLException {

		return smc.update("fboard.updateReply", vo);
	}

	@Override
	public List<FboardVO> fboardList2(String id) throws SQLException{
		return smc.queryForList("fboard.fboardList2", id);
	}

	@Override
	public List<FboardVO> fboardAllList(Map<String, Integer> map) throws SQLException {
	
		return smc.queryForList("fboard.fboardAllList", map);
	}

	@Override
	public int fboCnt(int code) throws SQLException {
		
		return smc.update("fboard.fboCnt", code);
	}

	
}
