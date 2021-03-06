package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;

@WebServlet("/InsertMember.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memVO = new MemberVO();
		try {
			BeanUtils.populate(memVO, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		memVO.setAdmin_check("N");
		
		//서비스 객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//서비스 메서드 호출
		String memId = service.insertMember(memVO);
		
		//결과값 request에 저장
		request.setAttribute("insert", memId);
		
		//jsp포워딩
		request.getRequestDispatcher("member/insert.jsp").forward(request, response);
		
		doGet(request, response);
	}

}
