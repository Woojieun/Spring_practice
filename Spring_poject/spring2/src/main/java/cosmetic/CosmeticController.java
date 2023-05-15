package cosmetic;

import java.io.IOException;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import cosmetic_color.Cosmetic_Color_DAO;
import cosmetic_color.Cosmetic_color;
import loginAndjoin.LoginAndJoinDAO;
import Shopping_basket.Shopping_basket_DAO;

@WebServlet("/cosmetic.nhn")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2, location = "C:/")
public class CosmeticController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private CosmeticDAO dao;
	@Autowired
	private Cosmetic_Color_DAO dao1;
	@Autowired
	private Shopping_basket_DAO dao2;
	private ServletContext ctx;

	private final String START_PAGE = "allPro.jsp";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new CosmeticDAO();
		dao1 = new Cosmetic_Color_DAO();
		ctx = getServletContext();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Method m1;
		String view1 = null;

		String action1 = request.getParameter("action");

		if (action1 == null) {
			action1 = "listCosmetic";
		}

		try {
			m1 = this.getClass().getMethod(action1, HttpServletRequest.class);
			view1 = (String) m1.invoke(this, request);

		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			ctx.log("요청 action 없음!!");
			request.setAttribute("error", "action 파라미터가 잘못 되었습니다!!"); // 키 이름에 저장된 값 유지
			view1 = START_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (view1.startsWith("redirect:/")) {
			String rview1 = view1.substring("redirect:/".length());
			response.sendRedirect(rview1);
			// sendRedirect의 인자값으로 들어가는 내용은 URL 매핑 주소, URL 주소가 된다.
			// 브라우저에서 A->B로 페이지를 전환하는 방식은 sendRedirect와 RequestDispatcher 두가지 방식이다
			// sendRedirect를 사용할 경우 하나의 요청 내에서 처리하는 것이 아니라 브라우저로 response를 한 후에
			// 브라우저 측에서 새로 B로 재요청을 하는 방식

		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view1);
			dispatcher.forward(request, response); // 해당 주소에 대해 요청하고 응답하라
			// RequestDispatcher의 경우 하나의 요청 범위 내에서 처리되어 최초에 생성된 request 객체를 B까지 가져갈수 있다.
		}

	}

	public String listCosmetic(HttpServletRequest request) {
		List<Cosmetic> cosmetic11;
		try {
			cosmetic11 = dao.getAll();
			request.setAttribute("cosmeticlist", cosmetic11);

		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("화장품 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "화장품 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "allPro.jsp";
	}

	public String getCosmetic(HttpServletRequest request) {
		int cosmetic_id = Integer.parseInt(request.getParameter("cosmetic_id"));

		List<Cosmetic_color> cosmetic33;
		
		// insert를 위한 변수들
		 String sessionId = request.getParameter("user_id"); 
		 String cosmetc_id = request.getParameter("cosmetic_id");
		 String cosmetic_color_id = request.getParameter("xcgdfgd");
		 String cosmetic_num = request.getParameter("pop_out");
		 
		// insert를 위한 변수 여기까지
		 
		try {
			Cosmetic n = dao.getCosmetic(cosmetic_id);
			request.setAttribute("cosmetic", n);

			cosmetic33 = dao1.getCosmetic_color(cosmetic_id);
			
			if(sessionId != null && cosmetc_id != null && cosmetic_color_id != null &&
					cosmetic_num != null && sessionId != "" && cosmetc_id != "" && cosmetic_color_id != "" &&
					cosmetic_num != "") { // insert 성공이면
				 new Shopping_basket_DAO().getCosmetic_cosmetic_insert(sessionId, cosmetc_id, cosmetic_color_id, cosmetic_num);
				 System.out.print(cosmetic_color_id);
		 
		 } 
		 else {
			 
		  }

			request.setAttribute("cosmetic_color_data", cosmetic33);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("화장품 정보를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "화장품 정보를 정상적으로 가져오지 못했습니다!!");
		}

		return "cosmetic/CosmeticView.jsp";
	}
	

}