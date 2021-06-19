package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IMemberDao;
import adm.vo.MemberVO;
import amd.config.BuildedSqlMapClient;

public class MemberDaoImpl implements IMemberDao {
	private static MemberDaoImpl dao;
	private SqlMapClient smc;

	private MemberDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}

	public static MemberDaoImpl getInstance() {
		if (dao == null)
			dao = new MemberDaoImpl();

		return dao;
	}

	// 회원 추가
	@Override
	public String insertMember(MemberVO memVO) throws SQLException {
		String count = null;
		Object obj = smc.insert("member.insertMember",memVO);
		if(obj==null) {count = memVO.getMem_name();}
		System.out.println(obj);
		return count;
		
		//return (String) smc.insert("member.insertMember", memVO);
	}
	
	// 중복 체크
	@Override
	public String idCheck(String memId) throws SQLException {
		return (String) smc.queryForObject("member.idCheck", memId);
	}
	
	//로그인
	@Override
	public MemberVO login(Map<String, String> map) throws SQLException {
		return (MemberVO) smc.queryForObject("member.login", map);
	}
	
	//아이디 찾기
	@Override
	public String findId(Map<String, String> map) throws SQLException {
		return (String) smc.queryForObject("member.findId", map);
	}
	
	//비밀번호 찾기update
	@Override
	public int findPass(Map<String, String> map) throws SQLException {
		return (Integer) smc.update("member.findPass",map);
	}

	//비밀번호 찾기select
	@Override
	public String findPassword(Map<String, String> map) throws SQLException {
		return (String) smc.queryForObject("member.findPassword", map);
	}

	@Override
	public int memberUpdate(MemberVO memVO) throws SQLException {
		return smc.update("member.memberUpdate",memVO);
	}

	@Override
	public int memberDelete(String id) throws SQLException {
		return smc.delete("member.memberDelete", id);
	}






}
