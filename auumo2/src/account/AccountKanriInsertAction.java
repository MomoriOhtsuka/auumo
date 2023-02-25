package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class AccountKanriInsertAction extends Action {

   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		UserMstBean us=(UserMstBean)session.getAttribute("kanri_reg_usermstbean");

		//正常に登録されたかどうかのフラグ(0件は異常、1件ならOK)
		int flg=0;
		AccountDAO ac=new AccountDAO();
		flg=ac.AccountInsert(us);

    	if(flg==1) {
    		session.removeAttribute("kanri_reg_usermstbean");
    		session.removeAttribute("kanri_reg_error_message");
    		return "ac_kanri_insert_success.jsp";
    	}
        return "../system_error/system_error.jsp";
    }

}
