package adm.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.PblServiceImple;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;

// 공연정보와 페이징 처리하는 서블릿
@WebServlet("/selectPbl.do")
public class selectPblServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IPblService service = null;
	// DB에서 가져온 공연날짜 date타입으로 변환
	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// 현재시간
	Date now = new Date();
	
    public selectPblServlet() {
    	service = PblServiceImple.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String team = request.getParameter("team");
		int pageNum = 0;
		
		String page = request.getParameter("page");
		
		if(page == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		// 한 페이지에 출력할 글 갯수
		int perList = 3;
		// 한 화면에 출력할 페이지 수
		int perPage = 10;
		
		// vo객체 list에 공연정보 담기
		List<PblprfrVO> list = null;
		// 공연 예정 연주목록
		List<PblprfrVO> listBefore = new ArrayList<PblprfrVO>();
		// 지난 공연 목록
		List<PblprfrVO> listAfter = new ArrayList<PblprfrVO>();
		
		
		
		if(team == null) {
			list = service.selectPerf();
			for(int i = 0; i < list.size(); i++) {
				PblprfrVO pvo = new PblprfrVO();
				pvo = list.get(i);
				String date = list.get(i).getPbl_date();
				Date to = null;
				try {
					to = fm.parse(date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
				// 예정공연
				if(now.before(to)) {
					listBefore.add(pvo);
				}else {	// 지난공연
					listAfter.add(pvo);
				}
			}
			
		}else {
			list = service.selectPerfTeam(team);
			for(int i = 0; i < list.size(); i++) {
				PblprfrVO pvo = new PblprfrVO();
				pvo = list.get(i);
				String date = list.get(i).getPbl_date();
				Date to = null;
				try {
					to = fm.parse(date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
				// 예정공연
				if(now.before(to)) {
					listBefore.add(pvo);
				}else {
					listAfter.add(pvo);
				}
			}
		}

		int countList = listAfter.size();
		
		// 전체 페이지 수
		int totalPage = (int)Math.ceil((double)countList/ perList);
		
		// 화면에 보여지는 페이지 번호
		int startPage = ((pageNum - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		// 페이지에 따라서 start, end - 보여지는 게시글
		int start = (pageNum - 1) * perList + 1;
		int end = start + perList - 1;
				
		if(end > countList) {
			end = countList;
		}
		
		request.setAttribute("listBefore", listBefore);
		request.setAttribute("listAfter", listAfter);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		request.setAttribute("pageNum", pageNum);
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("detailvo");
		
		RequestDispatcher rd = request.getRequestDispatcher("/performance/performList.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
