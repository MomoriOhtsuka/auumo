package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.ReviewDAO;
import tool.Action;

public class WithdrawalAction extends Action {

   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	   int account_code = Integer.parseInt(request.getParameter("account_code"));

		AccountDAO ac=new AccountDAO();
		ReviewDAO rv=new ReviewDAO();
    	int result_ac=ac.accountDelete(account_code);
    	int result_rv=rv.deleteReviewOnAccountCode(account_code);

    	if(result_ac==1 & result_rv >= 0) {
    		//正常に削除されたため、セッション情報の破棄
    		return "../logout/Logout.action";
    	}
        return "../system_error/system_error.jsp";
    }

}
