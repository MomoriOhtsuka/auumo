package account;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class AccountKanriSearchAction extends Action {

   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String login_id = request.getParameter("login_id");
		String nick_name= request.getParameter("nick_name");

		AccountDAO ac=new AccountDAO();
    	ArrayList<UserMstBean> list=ac.getAccountKanriSearch(login_id,nick_name);

    	if(list.size()>0) {
    		session.setAttribute("usermstlist",list);
    		session.setAttribute("search_input_login_id",login_id);
    		session.setAttribute("search_input_nick_name",nick_name);
            return "ac_kanri_search.jsp";
    	}

    	//0件だった場合
		session.setAttribute("usermstlist",list);
		session.setAttribute("search_input_login_id",login_id);
		session.setAttribute("search_input_nick_name",nick_name);
        return "ac_kanri_search_retry.jsp";
    }

}
