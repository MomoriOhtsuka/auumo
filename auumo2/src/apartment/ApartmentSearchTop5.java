package apartment;
//消すかも

import java.util.ArrayList;

import bean.ApertmentMstBean;
import dao.ApertmentDAO;

public class ApartmentSearchTop5/* extends HttpServlet*/{

	public static ArrayList<ApertmentMstBean> showTop5() throws Exception {

		ApertmentDAO apdao=new ApertmentDAO();
		ArrayList<ApertmentMstBean> aplist=apdao.searchTop5();

		return 	aplist;
	}




}
