package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;
import adm.vo.FboardVO;

@WebServlet("/FreeboardDetail.do")
public class FreeboardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IFboardService service = null;
	
	public FreeboardDetailServlet() {
		service = FboardServiceImpl.getService();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		
		FboardVO vo = service.selectDetail(code);
		
		request.setAttribute("detail", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/mypage/freeboarddetail.jsp");
		
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
