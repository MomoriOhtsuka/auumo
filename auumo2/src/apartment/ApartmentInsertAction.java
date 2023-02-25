package apartment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import dao.ApertmentDAO;
import tool.Action;
@SuppressWarnings("unchecked")
public class ApartmentInsertAction extends Action{

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		ApertmentMstBean ap=(ApertmentMstBean) session.getAttribute("apbean");

		ApertmentDAO apdao=new ApertmentDAO();
		int line=apdao.ApartmentInsert(ap);
		if (line==1) {
			session.removeAttribute("apbean");//物件情報の入力情報をクリア
			session.removeAttribute("ap_reg_error_message");	//物件情報の登録時の入力チェックのエラーメッセージをクリア
			return "ap_in_success.jsp";
		}
		return "ap_in_feiled.jsp";

	}
}
