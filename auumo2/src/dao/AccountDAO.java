package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.UserMstBean;


public class AccountDAO extends DAO{

	//IDとパスワードで管理者をUserMSTから検索するSQL
	private String searchKanri_sql = "select * from usermst where login_id=? and password=? and role_id='1'; ";

	//IDとパスワードで一般の利用者をUserMSTから検索するSQL
	private String searchAccount_sql = "select * from usermst where login_id=? and password=? and role_id=?; ";

	//IDの重複がないかUserMSTから検索するSQL;
	private String checkAccount_sql = "select count(login_id) as count from  usermst where login_id=?;";

	//管理者が利用できるアカウント管理画面の検索で利用するSQL
	private String accountKanriSearch_sql = "select * from usermst where login_id like ? and nick_name like ? order by login_id ; ";

	//管理者のアカウント登録するSQL
	private String	accountKanriInsert_sql="insert into usermst (login_id,nick_name,email_address,password,role_id,insert_date,update_date) values (?,?,?,?,?,current_timestamp(),current_timestamp()); ";

	private String accountInsert_sql="insert into usermst (login_id,nick_name,email_address,password,role_id,insert_date,update_date) values (?,?,?,?,?,current_timestamp(),current_timestamp()); ";

	private String accountDelete_sql="delete from  usermst where account_code=?; ";

	private UserMstBean newUser;

		//IDの重複確認
		public int Accountcheck(String login_id) throws Exception {
		int count=0;
		Connection con=null;//初期値設定

		try {

		con = getConnection();

		PreparedStatement st = con.prepareStatement(checkAccount_sql);
		st.setString(1,login_id);//1

		//SQLを実行
		ResultSet rs=st.executeQuery();

		while(rs.next()) {
			count=rs.getInt("count");
		}
    	st.close();
    	return count;
		} catch (Exception e) {
			throw e;
		}finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println("MySQLのクローズに失敗しました。");
				}
			}
		}
	}

	    //UserMSTの情報を格納するBean
		public int AccountInsert(UserMstBean newUser) throws Exception {
			int line=0;
			Connection con=null;//初期値設定

			try {

			con = getConnection();
			this.newUser=newUser;
			//Connection con=null;

			PreparedStatement st= con.prepareStatement(accountInsert_sql);

			//InsertActionで定義したBeanを呼び出し、それぞれの「?」にセット
			st.setString(1, newUser.getLogin_id());//1
			st.setString(2, newUser.getNick_name());//2
        	st.setString(3, newUser.getEmail_address());//3
        	st.setString(4,newUser.getPassword());//4
        	st.setString(5,newUser.getRole_id());//5

        	line=st.executeUpdate();
        	st.close();
			} catch (Exception e) {
//				e1.printStackTrace();// フロントコントローラが処理するので投げるだけでよい
				throw e;
			}finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						System.out.println("MySQLのクローズに失敗しました。");
					}
				}
			}
			return line;
		}

		/*
		 * insertAccountKanri(String login_id,String nick_name,String password,String email_address) メソッド
		 *
		 * 処理内容：管理者のアカウントを登録するメソッド
		 * 引数：ニックネーム,ログインID,パスワード,メールアドレス
		 * 戻り値：int(0か1)
		 */

	    public int insertAccountKanri(String login_id,String nick_name,String password,String email_address) throws Exception {

	    	//DBへのコネクションを接続(auumoにつなぐ)
	    	Connection con = getConnection();
	    	int result=0;

	    	try {
				PreparedStatement ps = con.prepareStatement(accountKanriInsert_sql);

		        ps.setString(1,login_id);
		        ps.setString(2,nick_name);
		        ps.setString(3,password);
		        ps.setString(4,email_address);
		        result = ps.executeUpdate();

		        ps.close();

		        } catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				} finally {
		            if (con != null) {
		                try {
		                	con.setAutoCommit(true);
		                    con.close();
		                } catch (SQLException e) {
		                    System.out.println("MySQLのクローズに失敗しました。");
		                }
		            }
				}
			return result;
	    }

		/*
		 * getSearchAccount(String login_id,String password,String role_id) メソッド
		 *
		 * 処理内容：利用者の情報をUserMSTから検索する処理(画面遷移もとに権限を渡してます）
		 * 引数：ログインID,パスワード,権限
		 * 戻り値：ArrayList<UserMstBean>
		 */
	    public ArrayList<UserMstBean> getSearchAccount(String login_id,String password,String role_id) throws Exception {

	    	//DBへのコネクションを接続(auumoにつなぐ)
	    	Connection con = getConnection();

	    	//UserMSTの情報を格納するBean
	    	ArrayList<UserMstBean> list=new ArrayList<UserMstBean>();

	    	try {
	    		//SQLをセット
				PreparedStatement ps = con.prepareStatement(searchAccount_sql);

				ps.setString(1,login_id);// 1個目の?にログインIDを設定
		        ps.setString(2,password);// 2個目の?にパスワードを設定
		        ps.setString(3,role_id);// 3個目の?に権限を設定

		        //SQLを実行
		        ResultSet rs = ps.executeQuery();

		        //取得されたデータの分だけUserMstBeanにいれて、リストにデータを格納していく。
		        while (rs.next()) {
		        	UserMstBean us=new UserMstBean();
		        	us.setAccount_code(rs.getInt("account_code"));
		        	us.setLogin_id(rs.getString("login_id"));
		        	us.setNick_name(rs.getString("nick_name"));
		        	us.setEmail_address(rs.getString("email_address"));
		        	us.setPassword(rs.getString("password"));
		        	us.setRole_id(rs.getString("role_id"));
		        	us.setInsert_date(rs.getDate("insert_date"));
		        	us.setUpdate_date(rs.getDate("update_date"));
		        	list.add(us);
		            }
		        ps.close();
		        } catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				} finally {
		            if (con != null) {
		                try {
		                    con.close();
		                } catch (SQLException e) {
		                    System.out.println("MySQLのクローズに失敗しました。");
		                }
		            }
				}
			return list;
	    }

		/*
		 * getAccountKanriSearch(String login_id,String nick_name) メソッド
		 *
		 * 処理内容：管理者が利用できる利用者アカウント管理画面で利用します。ユーザのログインIDやニックネームをLike（部分一致）で
		 * UserMSTから検索する処理
		 * 引数：ログインID,ニックネーム
		 * 戻り値：ArrayList<UserMstBean>
		 */

	    public ArrayList<UserMstBean> getAccountKanriSearch(String login_id,String nick_name) throws Exception {

	    	//DBへのコネクションを接続(auumoにつなぐ)
	    	Connection con = getConnection();

	    	//UserMSTの情報を格納するBean
	    	ArrayList<UserMstBean> list=new ArrayList<UserMstBean>();

	    	try {
				PreparedStatement ps = con.prepareStatement(accountKanriSearch_sql);

		        ps.setString(1,"%"+login_id+"%");
		        ps.setString(2,"%"+nick_name+"%");
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		        	UserMstBean us=new UserMstBean();
		        	us.setAccount_code(rs.getInt("account_code"));
		        	us.setLogin_id(rs.getString("login_id"));
		        	us.setNick_name(rs.getString("nick_name"));
		        	us.setEmail_address(rs.getString("email_address"));
		        	us.setPassword(rs.getString("password"));
		        	us.setRole_id(rs.getString("role_id"));

		        	list.add(us);
		            }
		        } catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				} finally {
		            if (con != null) {
		                try {
		                    con.close();
		                } catch (SQLException e) {
		                    System.out.println("MySQLのクローズに失敗しました。");
		                }
		            }
				}
			return list;
	    }

	    //アカウントを削除する処理
		public int accountDelete(int account_code) throws Exception {
			int line=0;
			Connection con=null;//初期値設定

			try {
			con = getConnection();

			PreparedStatement st= con.prepareStatement(accountDelete_sql);
			st.setInt(1,account_code);
        	line=st.executeUpdate();

        	st.close();
			} catch (Exception e) {
//				e1.printStackTrace();// フロントコントローラが処理するので投げるだけでよい
				throw e;
			}finally {
				if (con != null) {
					try {
						con.setAutoCommit(true);
						con.close();
					} catch (SQLException e) {
						System.out.println("MySQLのクローズに失敗しました。");
					}
				}
			}
			return line;
		}
	}

