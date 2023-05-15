package loginAndjoin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userLoginServlet
 */
@WebServlet("/userlogin")
public class userLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				HttpSession session = request.getSession();
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				
				 
				if(id == null || id.equals("") || password == null || password.equals("")) {
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "아이디 또는 비밀번호를 입력해주세요.");
					response.sendRedirect("login.jsp");
					return;
				}
				
				int result = new LoginAndJoinDAO().login(id, password);
				
				if(result == 1) {
					session.setAttribute("sessionId", id); // 세션으로 아이디 값 보내기
					response.sendRedirect("mainHome_login.jsp");
					return;
				} else if(result == 2){
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "아이디를 다시 확인하세요.");
					response.sendRedirect("login.jsp");
					return;
				}
				else if(result == 0){
					request.getSession().setAttribute("messageType", "오류 메시지");
					request.getSession().setAttribute("messageContent", "비밀번호를 다시 확인하세요.");
					response.sendRedirect("login.jsp");
					return;
				}
				
				if(result == 1) {
					session.setAttribute("sessionId", id); // 세션으로 아이디 값 보내기
					response.sendRedirect("allPro.jsp");
					return;
				}
				
				if(result == 1) {
					session.setAttribute("sessionId", id); // 세션으로 아이디 값 보내기
					response.sendRedirect("cosmetic/CosmeticView.jsp");
					return;
				}
				
			}
	}

