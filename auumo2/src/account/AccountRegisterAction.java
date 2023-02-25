package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserMstBean;
import dao.AccountDAO;
import tool.Action;

public class AccountRegisterAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		StringBuffer error_message=new StringBuffer();

		String nick_name = request.getParameter("nick_name");
		String login_id = request.getParameter("login_id");
		String password = request.getParameter("password");
		String email_address = request.getParameter("email_address");
		String role_id = request.getParameter("role_id");

		UserMstBean us=new UserMstBean();

		us.setNick_name(nick_name);
		us.setLogin_id(login_id);
		us.setPassword(password);
		us.setEmail_address(email_address);
		us.setRole_id(role_id);

		//入力チェックする
		error_message.append(loginIdCheck(login_id));
		error_message.append(nickNameCheck(nick_name));
		error_message.append(passwordCheck(password));
		error_message.append(accountCheck(login_id));

		//入力チェックした結果、エラーメッセージがなかったらの画面遷移
    	if(error_message.length()==0) {
    		//チェックエラーなし
    		session.setAttribute("reg_usermstbean", us);
    		return "ac_ippan_insert_confirm.jsp";
    	} else {
    		//チェックエラーあり
   		error_message.append("</br>");
    		session.setAttribute("reg_usermstbean", us);
    		session.setAttribute("ippan_reg_error_message",error_message );
    		return "ac_ippan_reg.jsp";
    	}
	}

	 private StringBuffer passwordCheck(String password) {
		    StringBuffer bf=new StringBuffer();

		   //サイズチェック

		   //ログインIDは５文字以上、10文字以内
		   if(password.length()>=5 &password.length()<=10) {
			   //チェックエラーなし
		   } else {
			   bf.append("パスワードは5文字以上、10文字以内で指定してください。</br>");
		   }
		   return bf;
	   }

	 private StringBuffer loginIdCheck(String login_id) {
		    StringBuffer bf=new StringBuffer();

		   //サイズチェック

		   //ログインIDは５文字以上、10文字以内
		   if(login_id.length()>=5 &login_id.length()<=10) {
			   //チェックエラーなし
		   } else {
			   bf.append("ログインIDは5文字以上、10文字以内で指定してください。</br>");
		   }
		   return bf;

	   }

	   private StringBuffer nickNameCheck(String nick_name) {
		    StringBuffer bf=new StringBuffer();

		   //サイズチェック
		   //ニックネームは１文字以上10バイトいない
		   if(!nick_name.isEmpty() & nick_name.length()<=10) {
			   //チェックエラーなし
		   } else {
			   bf.append("ニックネームが長すぎます。</br>");
		   }
		   return bf;
	  }

	   private StringBuffer accountCheck(String login_id) throws Exception{
		    StringBuffer bf=new StringBuffer();

		   AccountDAO acdao=new AccountDAO();
			int count=acdao.Accountcheck(login_id);
			if(count==0) {

			} else {
			bf.append("既にそのログインIDは存在しています。</br>");
			}
			return bf;

	  }
}