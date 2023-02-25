package login;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class LoginAction extends Action {

   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();


		String login_id = request.getParameter("login_id");
		String password= request.getParameter("password");
		String role_id= request.getParameter("role_id");

    	AccountDAO a=new AccountDAO();
    	ArrayList<UserMstBean> list=a.getSearchAccount(login_id,password,role_id);

    	if(list.size()==1) {
    		session.setAttribute("login_usermstbean",list.get(0));
    		return "../toppage/index.jsp";
    	}
        return "loginfeild.jsp";
    }

}
