package account;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class AccountDeleteAction extends Action {

   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		int account_code = Integer.parseInt(request.getParameter("account_code"));
		String login_id=request.getParameter("login_id");

		AccountDAO ac=new AccountDAO();
    	int result=ac.accountDelete(account_code);

    	//検索条件から検索結果をセット
    	String search_input_login_id=session.getAttribute("search_input_login_id").toString();
    	String search_input_nick_name=session.getAttribute("search_input_nick_name").toString();

		AccountDAO ac_search=new AccountDAO();
    	ArrayList<UserMstBean> list=ac_search.getAccountKanriSearch(search_input_login_id,search_input_nick_name);


    	if(result==1) {
    		session.setAttribute("del_account_code",account_code);
    		session.setAttribute("del_login_id",login_id);
    		session.setAttribute("usermstlist", list);
    		return "ac_kanri_search.jsp";
    	}
        return "../system_error/system_error.jsp";
    }

}
