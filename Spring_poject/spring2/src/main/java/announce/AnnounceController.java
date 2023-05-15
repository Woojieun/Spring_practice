package announce;

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


@WebServlet("/announce.nhn")
@MultipartConfig(maxFileSize=1024*1024*2, location="C:/")
public class AnnounceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AnnounceDAO dao;
	private ServletContext ctx;
	
	private final String START_PAGE = "announce/AnnounceList.jsp";
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new AnnounceDAO();
		ctx = getServletContext();		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		
		dao = new AnnounceDAO();
		
		Method m;
		String view = null;
		
		if (action == null) {
			action = "listAnnounce";
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
    

	public String listAnnounce(HttpServletRequest request) {
    	List<Announce> announce;
		try {
			announce = dao.getAll();
	    	request.setAttribute("announcelist", announce);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("공지사항 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "공지사항 목록이 정상적으로 처리되지 않았습니다!!");
		}
    	return "announce/AnnounceList.jsp";
    }
    
    public String getAnnounce(HttpServletRequest request) {
        int announce_id = Integer.parseInt(request.getParameter("announce_id"));
        try {
			Announce n = dao.getAnnounce(announce_id);
			request.setAttribute("announce", n);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("공지사항 정보를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "공지사항 정보를 정상적으로 가져오지 못했습니다!!");
		}

    	return "announce/AnnounceView.jsp";
    }
        
}