package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.ReviewServiceImpl;
import adm.service.inter.IReviewService;
import adm.vo.ReviewVO;

@WebServlet("/ReviewWrite.do")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		ReviewVO vo = new ReviewVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IReviewService service = ReviewServiceImpl.getInstance();
		String id =(String)session.getAttribute("id");
		vo.setMem_id(id);
		service.insertReview(vo);
		
		
		response.sendRedirect(request.getContextPath() + "/review/review_start.jsp");
		//request.getRequestDispatcher("/review/review_start.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
