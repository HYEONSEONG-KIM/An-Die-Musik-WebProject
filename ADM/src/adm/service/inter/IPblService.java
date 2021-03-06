package adm.service.inter;

import java.sql.SQLException;
import java.util.List;

import adm.vo.PblprfrVO;
import adm.vo.PrfplcVO;
import adm.vo.SeriesVO;
import adm.vo.TeamVO;

// 공연 정보 데이터 조작 Service 인터페이스
public interface IPblService {
	/**
	 * 공연장 정보 얻어오는 메서드
	 * @return 공연장 정보 VO List
	 */
	public List<PrfplcVO> prfList();
	
public List<TeamVO> teamList();
	
	/**
	 * 리스트 정보를 얻어오는 메서드
	 * @return 리스트 정보VO list
	 * @throws SQLException
	 */
	public List<SeriesVO> seriesList();
	
	/**
	 * 공연 정보 insert하는 메서드
	 * @throws SQLException
	 */
	public void insertPerf(PblprfrVO vo);
	
	
	/**
	 * 공연정보 list select메서드
	 * @return
	 * @throws SQLException
	 */
	public List<PblprfrVO> selectPerf();
	
	/**
	 * 공연팀 별로 list select메서드
	 * @param team
	 * @return
	 */
	public List<PblprfrVO> selectPerfTeam(String team);
	
	/**
	 * 선택한 공연의 상세정보 select 메서드
	 * @param pbl_code
	 * @return
	 * @throws SQLException
	 */
	public PblprfrVO selectPerfDetail(int pbl_code);
	
	/**
	 * 공연 정보 수정 메서드
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public int updatePerf(PblprfrVO vo);
	
	/**
	 * 공연 정보 삭제 메서드
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public int deletePerf(int code);
	
}
