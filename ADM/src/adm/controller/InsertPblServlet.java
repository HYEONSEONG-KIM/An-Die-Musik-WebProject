package adm.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.PblServiceImple;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;

// 공연 정보 insert 서블릿
@WebServlet("/InsertPbl.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 50)
public class InsertPblServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private IPblService service = null; 
    
    public InsertPblServlet() {
    	service = PblServiceImple.getInstance();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		
		// 업로드한 사진을 저장한 경로
		String uploadPath = "C:\\ddit\\MiddelProject\\workspace\\ADM\\WebContent\\images\\perform";
		
		File fileUploadDir = new File(uploadPath);
		
		// 저장될 폴더가 없으면 생성
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		String fileName = null;
		PblprfrVO vo = new PblprfrVO();
		
		// form에 담긴 정보 vo객체에 담기
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
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
				
			}
		}
		vo.setFile_name(fileName);
		
		service.insertPerf(vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/selectPbl.do");
		rd.forward(request, response);
		
		
	}
	
	
	
	private String extractFileName(Part part) {
		String fileName = "";
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

















