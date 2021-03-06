package adm.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;
import adm.vo.FboardVO;

@WebServlet("/FboardWrite.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 50)
public class FboardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글쓰기
		//인코딩
		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
		
		String uploadPath = "C:\\ddit\\MiddelProject\\workspace\\ADM\\WebContent\\images\\fboard";
		
		File fileUploadDir = new File(uploadPath);
		
		//저장될 폴더가 없으면 생성
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}

		//파라미터값 가져오기
		String fileName = null;
		FboardVO vo = new FboardVO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
	
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			// 파일명이 공백이면 파일이 아닌 일반 파라미터
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}

		

		vo.setMem_id(id);	//세션넣어야함

		System.out.println(fileName);
		vo.setFile_name(fileName);
		
		IFboardService service = FboardServiceImpl.getService();
		
		service.insertFboard(vo);
		
		request.getRequestDispatcher("/fboard/fboard_index.jsp").forward(request, response);
	}
	
	
		private String extractFileName(Part part) {
			String fileName="";
			String disposition = part.getHeader("Content-Disposition");
			
			String[] items = disposition.split(";");
			
			for(String item : items) {
				if(item.trim().startsWith("filename")) {
					fileName = item.substring(item.indexOf("=") + 2, item.length() -1);
				}
			}
			return fileName;
			
		}
		

	

}
