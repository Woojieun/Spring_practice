package cosmetic_color;

import java.io.IOException;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import cosmetic.Cosmetic;
import loginAndjoin.LoginAndJoinDAO;

@WebServlet("/cosmetic_color.nhn")
public class Cosmetic_Color_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private Cosmetic_Color_DAO dao;

	private ServletContext ctx;

	private final String START_PAGE = "allPro.jsp";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new Cosmetic_Color_DAO();
		ctx = getServletContext();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String action1 = request.getParameter("action1");

		dao = new Cosmetic_Color_DAO();

		Method m;
		String view = null;
		
		Method m1;
		String view1 = null;

		if (action == null && action1 == null) {
			action = "getCosmetic_color";
			action1 = "listCosmetic_color";
		}

		try {
			m = this.getClass().getMethod(action, HttpServletRequest.class);
			view = (String) m.invoke(this, request);
			
			m1 = this.getClass().getMethod(action1, HttpServletRequest.class);
			view1 = (String) m1.invoke(this, request);
			
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			ctx.log("요청 action 없음!!");
			request.setAttribute("error", "action 파라미터가 잘못 되었습니다!!");
			view = START_PAGE;
			view1 = START_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (view.startsWith("redirect:/") && view1.startsWith("redirect:/")) {
			String rview = view.substring("redirect:/".length());
			String rview1 = view1.substring("redirect:/".length());
			response.sendRedirect(rview1);
			response.sendRedirect(rview);
			
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		
	}
	
	public String listCosmetic_color(HttpServletRequest request) {
    	List<Cosmetic_color> Cosmetic_color;
		try {
			Cosmetic_color = dao.getAll_color();
	    	request.setAttribute("cosmeticlist_color", Cosmetic_color);
	    	
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("화장품 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "화장품 목록이 정상적으로 처리되지 않았습니다!!");
		}
    	return "cosmetic/Cosmetic_color.jsp";
    }
		

}