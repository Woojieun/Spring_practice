package tint;

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


@WebServlet("/tint.nhn")
@MultipartConfig(maxFileSize=1024*1024*2, location="C:/")
public class TintController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private TintDAO dao;
	private ServletContext ctx;
	
	private final String START_PAGE = "Tint/TintList.jsp";
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new TintDAO();
		ctx = getServletContext();		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		
		dao = new TintDAO();
		
		Method m;
		String view = null;
		
		if (action == null) {
			action = "listTint";
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
	
	public String listTint(HttpServletRequest request) {
    	List<Tint> tint;
		try {
			tint = dao.getAll();
	    	request.setAttribute("cosmeticlist", tint);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("화장품 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "화장품 목록이 정상적으로 처리되지 않았습니다!!");
		}
    	return "Tint/TintList.jsp";
    }
    
    
    public String getTint(HttpServletRequest request) {
        int cosmetic_id = Integer.parseInt(request.getParameter("cosmetic_id"));
        try {
			Tint n = dao.getTint(cosmetic_id);
			request.setAttribute("tint", n);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("틴트 정보를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "화장품 정보를 정상적으로 가져오지 못했습니다!!");
		}

    	return "Tint/TintView.jsp";
    } 
}