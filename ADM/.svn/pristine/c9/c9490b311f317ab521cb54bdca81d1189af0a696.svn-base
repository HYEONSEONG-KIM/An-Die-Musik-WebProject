package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;


@WebServlet("/DeleteReserv.do")
public class DeleteReservServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ITicketingService service = null;
   
	public DeleteReservServlet() {
		service = TicketingServiceImpl.getInstance();
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("vidx"));
		System.out.println("code:" + code);
		int result = service.deleteReserv(code);
		System.out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("SelectReserve.do");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
