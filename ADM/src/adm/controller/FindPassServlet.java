package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;

@WebServlet("/FindPass.do")
public class FindPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("application/json; charset=utf-8");
		String id = request.getParameter("id");
		String mail = request.getParameter("email");
		System.out.println(mail);
		IMemberService service = MemberServiceImpl.getInstance();
		String memid = service.idCheck(id);
		String result = null;
		if(memid == null) {
			result = "no";
		}else {
			String host = "smtp.gmail.com";
			final String user ="lcw1523@gmail.com";
			final String password ="!speed1523";

			String to = mail;

			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.starttls.enable", "true");

			char pwCollection[] = new char[] {
					'1','2','3','4','5','6','7','8','9','0',
					'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
					'!','@','#','$','%','^','&','*','(',')'
			};//????????? ??????

			String ranPw = "";

			for (int i = 0; i < 10; i++) {
				int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()??? 0.0?????? 1.0????????? ????????? ????????? ??????.
				ranPw += pwCollection[selectRandomPw];
			}

			String AuthenticationKey = pwCollection.toString();
			System.out.println(AuthenticationKey);


			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

				message.setSubject("?????? ??????");

				message.setText("??????????????? : " + ranPw);

				Transport.send(message);
				System.out.println("message sent successfully...");
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_pass", ranPw);
		map.put("mem_id", id);
		map.put("mem_mail", mail);
		
		int results = service.findPass(map);
		
		result = "ok";
		}
		Gson gson = new Gson();
		String jsonData = gson.toJson(result);
		
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
	}

}
