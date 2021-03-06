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
import adm.vo.AvdSeatVO;


@WebServlet("/selectSeat.do")
public class selectSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private ITicketingService service = null;
	
    public selectSeatServlet() {
    	service = TicketingServiceImpl.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		List<AvdSeatVO> list = service.selectSeat(code);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPblcode() == 0) {
				list.get(i).setPblcode(code);
			}
		}
	
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/ticketing/performReserv.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




