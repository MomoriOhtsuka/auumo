package tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//						formやlinkで指定するときは〇〇.action
//						プログラム自体は〇〇Action.java
@WebServlet(urlPatterns={"*.action"})
@MultipartConfig(location="")
public class FrontController extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		try {
			//セッション関係の初期処理
			init(session);

			//パスの取得、先頭一文字目(/)の除去
			String path=request.getServletPath().substring(1);

			//.aをAに、/を.に置き換え
			String name=path.replace(".a", "A").replace('/', '.');

			//Action action = (Action) new chapter23.SearchAction();を行っている
			Action action = (Action)Class.forName(name).getDeclaredConstructor().newInstance();

			//検索処理等をexecute（実行）する フォワード先の"〇〇.jsp"の文字列を受け取る
			String url=action.execute(request, response);

			//フォワード処理 文字列urlのページへフォワードする
			request.getRequestDispatcher(url).
				forward(request, response);
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//<a>タグでActionが呼ばれるとGetで来るので、この対応はダメだった、、、。2023/2/7でaリンクタグを直すのは工数足らないのでいったん直接打ち込みの対応は
		//諦めます。
		//URLを直接打つのはmethodがGetで来るので、Getで来たものはURL直打ちとみなし、トップ画面に遷移させる
		//request.getRequestDispatcher("../toppage/index.jsp").forward(request, response);
		doPost(request, response);

	}

	private void init(HttpSession session) {
		//セッション情報をクリアする

		//物件検索画面の物件検索結果
		session.removeAttribute("aplist_search");

		//アカウント検索画面の検索結果
		session.removeAttribute("usermstlist");

		//口コミ情報の入力時のエラーメッセージ
		session.removeAttribute("review_check_message");

		//物件情報の登録時の入力チェックのエラーメッセージ
		session.removeAttribute("ap_reg_error_message");

		//一般のアカウント登録時の入力チェックのエラーメッセージ
		session.removeAttribute("ippan_reg_error_message");

		//管理者のアカウント登録時の入力チェックのエラーメッセージ
		session.removeAttribute("kanri_reg_error_message");

		//物件削除の時の完了メッセージ
		session.removeAttribute("ap_del_comp_message");

		//検索結果の件数メッセージ
		session.removeAttribute("search_result_message");
	}
}
