package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;
import adm.vo.ReserveVO;


@WebServlet("/ReservDetail.do")
public class ReservDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ITicketingService service = null;
    
    public ReservDetailServlet() {
    	service = TicketingServiceImpl.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		ReserveVO vo = service.ReservDetail(code);
		
		request.setAttribute("detail", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/mypage/ticketingDetail.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
