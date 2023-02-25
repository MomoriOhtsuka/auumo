package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.ReviewAndUserBean;
import bean.ReviewBean;

public class ReviewDAO extends DAO{

	//private String searchReview_sql="select * from review where apartment_cord=? order by insert_date DESC;";
	private String searchReview_sql="select rv.review_id as review_id,rv.apartment_cord as apartment_cord,rv.account as account_code,rv.message as message ,us.nick_name as nick_name,us.insert_date as insert_date from auumo.review rv left outer join auumo.usermst us  on rv.account=us.account_code where rv.apartment_cord=? order by rv.insert_date DESC;";


	private String insertReveiw_sql="insert into review (apartment_cord,account,message,insert_date,update_date) values (?,?,?,current_timestamp(),current_timestamp());";
	private String deleteReveiw_sql="delete from review where review_id=?;";
	private String deleteReveiwOnAccountCode_sql="delete from review where account=?;";

	/*
	 * getSearchIppan(String login_id,String password) メソッド
	 *
	 * 処理内容：一般の利用者の情報をUserMSTから検索する処理（今後の汎用性も込めて、getSearchIpaanとしています。
	 * 引数：ログインID,パスワード
	 * 戻り値：ArrayList<UserMstBean>
	 */
    public ArrayList<ReviewAndUserBean> getSearchReview(int apartment_cord) throws Exception {

    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	//UserMSTの情報を格納するBean
    	ArrayList<ReviewAndUserBean> list=new ArrayList<ReviewAndUserBean>();

    	try {
    		//SQLをセット
			PreparedStatement ps = con.prepareStatement(searchReview_sql);

			ps.setInt(1,apartment_cord);// 1個目の?にログインIDを設定


	        //SQLを実行
	        ResultSet rs = ps.executeQuery();

	        //取得されたデータの分だけUserMstBeanにいれて、リストにデータを格納していく。
	        while (rs.next()) {
	        	ReviewAndUserBean rvus=new ReviewAndUserBean();
	        	rvus.setApartment_cord(rs.getInt("apartment_cord"));
	        	rvus.setReview_id(rs.getInt("review_id"));
	        	rvus.setAccount_code(rs.getInt("account_code"));
	        	rvus.setMessage(rs.getString("message"));
	        	rvus.setNick_name(rs.getString("nick_name"));
	        	rvus.setReview_insert_date(rs.getTimestamp("insert_date"));
	        	list.add(rvus);
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

    public int insertReview(int apartment_cord,int account_code,String message) throws Exception {

    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	//UserMSTの情報を格納するBean
    	ArrayList<ReviewBean> list=new ArrayList<ReviewBean>();

    	int result=0;

    	try {
    		//SQLをセット
			PreparedStatement ps = con.prepareStatement(insertReveiw_sql);

			ps.setInt(1,apartment_cord);// 1個目の?に物件コードを設定
			ps.setInt(2,account_code);// 2個目の?にアカウントコードを設定
			ps.setString(3,message); // 3個目の?にメッセージ内容を設定

	        //SQLを実行
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
    public int deleteReview(int review_id) throws Exception {

    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	int result=0;

    	try {
    		//SQLをセット
			PreparedStatement ps = con.prepareStatement(deleteReveiw_sql);

			ps.setInt(1,review_id);// 1個目の?に口コミIDをセット

	        //SQLを実行
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

    public int deleteReviewOnAccountCode(int account_code) throws Exception {

    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	int result=0;

    	try {
    		//SQLをセット
			PreparedStatement ps = con.prepareStatement(deleteReveiwOnAccountCode_sql);

			ps.setInt(1,account_code);// 1個目の?にアカウントコードをセットをセット

	        //SQLを実行
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

}
