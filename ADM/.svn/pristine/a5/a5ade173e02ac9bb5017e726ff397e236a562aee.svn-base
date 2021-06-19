package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;


@WebServlet("/MemberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IMemberService service = null;
	
    public MemberDeleteServlet() {
    	service = MemberServiceImpl.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int result = service.memberDelete(id);
		
		session.invalidate();
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
