package logout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LogoutAction extends Action {

	public String execute (HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("login_usermstbean") != null) {
			session.removeAttribute("login_usermstbean");
			return "../toppage/index.jsp";
		}
		return "../system_error/system_error.jsp";
	}
}
