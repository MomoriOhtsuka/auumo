package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class AccountInsertAction extends Action{

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();

		UserMstBean newUser=(UserMstBean)session.getAttribute("reg_usermstbean");//Beanに詰め替え

		AccountDAO acdao=new AccountDAO();
		int line=acdao.AccountInsert(newUser);
		if (line==1) {
			//正常にデータが登録できたら、ログインさせてトップページへ遷移させる
			session.removeAttribute("reg_usermstbean");//入力情報をクリア
			session.removeAttribute("ippan_reg_error_message");//入力チェックエラーメッセージ
			return "../login/Login.action?login_id="+newUser.getLogin_id()+"&password="+newUser.getPassword()+"&role_id="+newUser.getRole_id();
	}
			return "../sysmte_error/sysmte_error.jsp";

	}
}
