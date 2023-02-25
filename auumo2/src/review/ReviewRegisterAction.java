package review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import bean.ReviewAndUserBean;
import bean.UserMstBean;
import dao.ApertmentDAO;
import dao.ReviewDAO;
import tool.Action;

public class ReviewRegisterAction extends Action {

	 public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 HttpSession session = request.getSession();

		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));

		UserMstBean us=(UserMstBean) session.getAttribute("login_usermstbean");
		int account_code=us.getAccount_code();
		String review = request.getParameter("review");

		StringBuffer check_error=inputMessageCheck(review);

		if(check_error.length()>0) {
			session.setAttribute("review_check_message",check_error.toString());
			return "../apartment/ap_detail.jsp";
		}

		ReviewDAO rv=new ReviewDAO();
		int result=rv.insertReview(apartment_cord,account_code,review);

		if(result==1) {
			ApertmentDAO ap=new ApertmentDAO();
			ArrayList<ApertmentMstBean> aplist=ap.searchApartmentDetail(apartment_cord);
			ArrayList<ReviewAndUserBean> rvuslist=rv.getSearchReview(apartment_cord);

			if(aplist.size()==1 & !(rv==null) ) {
				session.setAttribute("aplist_dtail",aplist);
				session.setAttribute("rvuslist",rvuslist);
				session.removeAttribute("review_check_message");//エラーメッセージを削除
				return "../apartment/ap_detail.jsp";
			}else {
				return "../system_error/system_error.jsp";
			}
		}
		return "../system_error/system_error.jsp";
	    }

	 //口コミメッセージの入力チェック処理
	 private StringBuffer inputMessageCheck(String review) {
		 String check_review=review;
		 StringBuffer  error_message_bf=new StringBuffer();

		 //空白またはnullチェック
		 if(check_review.isEmpty()||check_review.equals("")) {
			 error_message_bf.append("※口コミ情報に何も入力されていません。");
		 }
		 return error_message_bf;
	 }


	}

