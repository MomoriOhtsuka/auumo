package apartment;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ApertmentMstBean;
import dao.ApertmentDAO;
import tool.Action;

public class ApartmentSearchAction extends Action {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String apartment_address1 = request.getParameter("apartment_address1");
		String apartment_address2 = request.getParameter("apartment_address2");
		String pf[]=request.getParameterValues("pet_friendly");
		String pet_friendly="";
		if (pf==null||pf.length!=1) {}
		else {
			pet_friendly=pf[0];
		}

		String floor_plan=request.getParameter("floor_plan");
		String priceL=request.getParameter("priceL");
		String priceH=request.getParameter("priceH");


		HashMap<String,String> searchMap=new HashMap<>();
		searchMap.put("apartment_address1",apartment_address1);
		searchMap.put("apartment_address2",apartment_address2);
		searchMap.put("pet_friendly",pet_friendly);
		searchMap.put("floor_plan",floor_plan);
		searchMap.put("priceL",priceL);
		searchMap.put("priceH",priceH);

		ApertmentDAO ap=new ApertmentDAO();
		ArrayList<ApertmentMstBean> list=ap.searchApartment(apartment_address1, apartment_address2,floor_plan,pet_friendly,priceH,priceL);

		session.setAttribute("search_result_message","検索結果は"+list.size()+"件です");

		session.setAttribute("searchMap", searchMap);
		session.setAttribute("aplist_search",list);
		session.setAttribute("search_input_apartment_address1", apartment_address1);
		session.setAttribute("search_input_apartment_address2", apartment_address2);
	    return "ap_search.jsp";
	}

}
