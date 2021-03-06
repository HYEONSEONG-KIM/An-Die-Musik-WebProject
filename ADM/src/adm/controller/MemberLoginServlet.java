package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;

@WebServlet("/MemberLogin.do")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", id);
		map.put("mem_pass", pass);
		
	
		 IMemberService service = MemberServiceImpl.getInstance();
		
		 MemberVO vo = service.login(map);
		
		 String result = null;
		 
		 if(vo == null) {
			 result = "no";
		 }else {
			 result = "ok";
			 
			 session.setAttribute("id",id);
			 session.setAttribute("pass", pass);
			 session.setAttribute("memberInfo", vo);
			 session.setAttribute("admin", vo.getAdmin_check());
			 
			 System.out.println(vo.toString());
		 }
		 
		 Gson gson = new Gson();
		 String jsonData = gson.toJson(result);
		  
		 PrintWriter out = response.getWriter();
			
			out.write(jsonData);
			
			out.flush();
			out.close();

	}

}
