package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.FboardServiceImpl;
import adm.service.impl.NoticeServiceImpl;
import adm.service.inter.IFboardService;
import adm.service.inter.INoticeService;
import adm.vo.FansVO;
import adm.vo.FboardVO;
import adm.vo.NoticeVO;

@WebServlet("/FboardDetail.do")
public class FboardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//자유 게시판 상세페이지
		request.setCharacterEncoding("utf-8");
		
		/*
		 * response.setCharacterEncoding("utf-8");
		 * response.setContentType("application/json; charset=utf-8");
		 */
		
		int code = Integer.parseInt(request.getParameter("fboard_code"));
		IFboardService service = FboardServiceImpl.getService();
		
		int cnt2 = service.fboCnt(code); 
		int cnt = service.deleteReply(code);
		FboardVO vo = service.selectDetail(code);
		List<FansVO> list = service.replyList(code);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("fboardDetail", vo);
		
		request.setAttribute("detail", vo);
		request.setAttribute("list", list);

		
		request.getRequestDispatcher("/fboard/fboard_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
