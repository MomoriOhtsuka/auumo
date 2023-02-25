package tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//Webアプリケーション以下、全部フィルタを適応
@WebFilter(urlPatterns= {"/*"})

public class EncodingFilter implements Filter{

	//サーブレットとかJSPとかが呼ばれたときに実行する
	public void doFilter(
		ServletRequest request,ServletResponse response,
		FilterChain chain
		)throws IOException,ServletException{

		request.setCharacterEncoding("UTF-8");

		//総合製作の時にコメントアウト setCharacterEncondigを有効化
		//response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

/*		//JSPのURL直接入力の対応　開始
		HttpServletRequest req=(HttpServletRequest)request;
		//HttpSession session=req.getSession();

		String url=req.getHeader("REFERER");
		System.out.println("URLパス"+url);

		String[] a=null;
		String filename=null;

		if(!(url==null)) {
			a=url.split("/");
			for (String element : a) {
				filename=element;
			}
		}
		boolean flg=true;

		System.out.println("ファイル名"+filename);
		if(!(filename==null))
			switch(filename) {
			case "auumo":break;
			case "index.jsp":break;
			case "login.jsp":break;
			case "kanri_login.jsp":break;
			case "ap_search.jsp":break;
			case "ac_ippan_reg.jsp":break;
			case "*.action":break;
			default:
				flg=false;
			break;
		}else {
			flg=false;
		}
		System.out.println("ここまではきてる");
		if(!flg) {
			req.getRequestDispatcher("../system_error/system_error.jsp").forward(request, response);
		}
		//JSPのURL直接入力の対応　終了
*/

		chain.doFilter(request,response);
	}

	public void init(FilterConfig filterconfig) {}	//サーバ起動した初回

	public void destroy() {}	//サーバ停止時

}
