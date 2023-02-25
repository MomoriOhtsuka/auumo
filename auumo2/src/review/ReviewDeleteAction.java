package review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import bean.ReviewAndUserBean;
import dao.ApertmentDAO;
import dao.ReviewDAO;
import tool.Action;

public class ReviewDeleteAction extends Action {

	 public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 HttpSession session = request.getSession();

		int review_id=Integer.parseInt(request.getParameter("review_id"));
		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));

		ReviewDAO rv=new ReviewDAO();
		int result=rv.deleteReview(review_id);

		if(result==1) {
			ApertmentDAO ap=new ApertmentDAO();
			ArrayList<ApertmentMstBean> aplist=ap.searchApartmentDetail(apartment_cord);
			ArrayList<ReviewAndUserBean> rvuslist=rv.getSearchReview(apartment_cord);

			if(aplist.size()==1) {
				session.setAttribute("aplist_dtail",aplist);
				session.setAttribute("rvuslist",rvuslist);
				return "../apartment/ap_detail.jsp";
			}else {
				return "../system_error/system_error.jsp";
			}
		}
		    return "../system_error/system_error.jsp";
	    }
	}

