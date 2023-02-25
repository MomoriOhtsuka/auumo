package apartment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import dao.ApertmentDAO;
import tool.Action;

public class ApartmentBeforeUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));

		ApertmentDAO apdao=new ApertmentDAO();
		ArrayList<ApertmentMstBean> aplist=apdao.searchApartmentDetail(apartment_cord);

		if(aplist.size()==1) {
			request.setAttribute("apupdate",aplist.get(0));
			return "ap_update.jsp";
		}else {
			System.out.println("１件以外がヒット");
		}

		return "../system_error/system_error.jsp";

	}
}
