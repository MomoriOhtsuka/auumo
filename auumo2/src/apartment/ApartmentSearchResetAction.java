package apartment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class ApartmentSearchResetAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		session.removeAttribute("searchMap");
		session.removeAttribute("search_input_apartment_address1");
		session.removeAttribute("search_input_apartment_address2");
	    return "ap_search.jsp";
	}

}
