package apartment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import bean.ReviewAndUserBean;
import dao.ApertmentDAO;
import dao.ReviewDAO;
import tool.Action;

public class ApartmentDetailAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));

		ApertmentDAO ap=new ApertmentDAO();
		ReviewDAO rv=new ReviewDAO();
		ArrayList<ApertmentMstBean> aplist=ap.searchApartmentDetail(apartment_cord);
		ArrayList<ReviewAndUserBean> rvuslist=rv.getSearchReview(apartment_cord);


		if(aplist.size()==1 & !(rv==null) ) {
			session.setAttribute("aplist_dtail",aplist);
			session.setAttribute("rvuslist",rvuslist);
			return "ap_detail.jsp";

		}else {
			System.out.println("１件以外がヒット");
		}

	    return "ap_search.jsp";


	}

}
