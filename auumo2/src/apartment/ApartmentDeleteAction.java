package apartment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApertmentDAO;
import tool.Action;

public class ApartmentDeleteAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		StringBuffer message=new StringBuffer();

		int apartment_cord=Integer.parseInt(request.getParameter("apartment_cord"));

		message.append(request.getParameter("apartment_name"));
		message.append("を");

		ApertmentDAO apdao = new ApertmentDAO();
		int line = apdao.ApartmentDelete(apartment_cord);
		if (line == 1) {
			message.append("削除しました。");
			//再度検索、削除後の検索結果を表示
//			String apartment_address1 = request.getParameter("apartment_address1");
//			String apartment_address2 = request.getParameter("apartment_address2");
//			ArrayList<ApertmentMstBean> aplist=apdao.searchApartment(apartment_address1, apartment_address2);
//			session.setAttribute("aplist",aplist);
			session.setAttribute("ap_del_comp_message", message);
		} else {
			message.append("削除できませんでした。");
			session.setAttribute("ap_del_comp_message", message);
		}
		return "ap_search.jsp";
	}

}
