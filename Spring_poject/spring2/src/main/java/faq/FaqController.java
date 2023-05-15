package faq;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmetic.Cosmetic;
import cosmetic.CosmeticDAO;

@WebServlet("/FAQ.nhn")
public class FaqController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		private faqDAO dao;
		private ServletContext ctx;
		
		private final String START_PAGE = "FAQ/FAQList.jsp";
		
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			dao = new faqDAO();
			ctx = getServletContext();		
		}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String action = request.getParameter("action");
			
			dao = new faqDAO();
			
			Method m;
			String view = null;
			
			if (action == null) {
				action = "listFAQ";
			}
			
			try {
				m = this.getClass().getMethod(action, HttpServletRequest.class);
				view = (String)m.invoke(this, request);
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
				ctx.log("요청 action 없음!!");
				request.setAttribute("error", "action 파라미터가 잘못 되었습니다!!");
				view = START_PAGE;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(view.startsWith("redirect:/")) {
				String rview = view.substring("redirect:/".length());
				response.sendRedirect(rview);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);	
			}
		}

		public String listFAQ(HttpServletRequest request) {
	    	List<faq> faq;
			try {
				faq = dao.getAll();
		    	request.setAttribute("faqlist", faq);
			} catch (Exception e) {
				e.printStackTrace();
				ctx.log("화장품 목록 생성 과정에서 문제 발생!!");
				request.setAttribute("error", "화장품 목록이 정상적으로 처리되지 않았습니다!!");
			}
	    	return "FAQ/FAQList.jsp";
	    }
	    
	    public String getFAQ(HttpServletRequest request) {
	        int faq_id = Integer.parseInt(request.getParameter("faq_id"));
	        try {
				faq n = dao.getFAQ(faq_id);
				request.setAttribute("faq", n);
			} catch (SQLException e) {
				e.printStackTrace();
				ctx.log("화장품 정보를 가져오는 과정에서 문제 발생!!");
				request.setAttribute("error", "화장품 정보를 정상적으로 가져오지 못했습니다!!");
			}

	    	return "FAQ/FAQView.jsp";
	    }
}
