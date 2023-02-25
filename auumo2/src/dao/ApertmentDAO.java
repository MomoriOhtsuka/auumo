package dao;

import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import bean.ApertmentMstBean;

public class ApertmentDAO extends DAO {
	@SuppressWarnings("unused")
	private ApertmentMstBean updateAp;
	private String insert_sql="insert into auumo.apartmentmst ("
			+ "apartment_name,apartment_address1,apartment_address2,"
			+ "contact_telnumber,apartment_explanation,floor_plan,"
			+ "floor_plan_image,depsit_reward,rent,pet_friendly,"
			+ "apartment_image,insert_date,update_date)"
			+ "values(?,?,?,?,?,?,?,?,?,?,?,current_timestamp(),current_timestamp())";
	//物件検索で都道府県と市区町村で検索するSQL
//	private String searchApartment_sql = "select * from ApartmentMst where apartment_address1=? and apartment_address2 like ?; ";

	//物件の詳細画面で物件の情報を取得するSQL
	private String searchApartmentDetail_sql = "select * from ApartmentMst where apartment_cord=?; ";

	//物件消去のSQL
	private String delete_sql="delete from auumo.apartmentmst where apartment_cord = ?; ";

	//新規物件Top５を検索するSQL
	private String 	searchTop5_sql="select * from ApartmentMst order by insert_date desc limit 5;";

	//物件検索するSQL
	private StringBuffer initial_sql = new StringBuffer();

	@SuppressWarnings("unused")
	private String update_sql="update apartmentmst set "
									+ "apartment_name=?,"
									+ "apartment_address1=?,"
									+ "apartment_address2=?,"
									+ "contact_telnumber=?,"
									+ "apartment_explanation=?,"
									+ "floor_plan=?,"
									+ "floor_plan_image=?,"
									+ "depsit_reward=?,"
									+ "rent=?,"
									+ "pet_friendly=?,"
									+ "apartment_image=?,"
									+ "update_date=current_timestamp() where apartment_cord=?;";

	public int ApartmentUpdate(ApertmentMstBean updateAp) throws Exception {
		Connection con=null;//初期値設定

		int line=0;
		try {
			con = getConnection();

			PreparedStatement st= con.prepareStatement(update_sql);

			//InsertActionで定義したBeanを呼び出し、それぞれの「?」にセット
			st.setString(1, updateAp.getApartment_name());
			st.setString(2, updateAp.getApartment_address1());
			st.setString(3, updateAp.getApartment_address2());
			st.setString(4, updateAp.getContact_telnumber());
			st.setString(5, updateAp.getApartment_explanation());
			st.setString(6, updateAp.getFloor_plan());
			st.setBinaryStream(7, new ByteArrayInputStream(updateAp.getFloor_plan_image()));
			st.setInt(8, updateAp.getDepsit_reward());
			st.setInt(9, updateAp.getRent());
			st.setString(10, updateAp.getPet_friendly());
			st.setBinaryStream(11, new ByteArrayInputStream(updateAp.getApartment_image()));
			st.setInt(12,updateAp.getApartment_cord());

			line=st.executeUpdate();
			st.close();

		} catch (Exception e) {
//			e1.printStackTrace();// フロントコントローラが処理するので投げるだけでよい
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


	public int ApartmentInsert(ApertmentMstBean newAp) throws Exception {
		Connection con=null;//初期値設定

		int line=0;
		try {
			con = getConnection();

			PreparedStatement st= con.prepareStatement(insert_sql);

			//InsertActionで定義したBeanを呼び出し、それぞれの「?」にセット
			st.setString(1, newAp.getApartment_name());//1
			st.setString(2, newAp.getApartment_address1());//2
			st.setString(3, newAp.getApartment_address2());//3
			st.setString(4, newAp.getContact_telnumber());//4
			st.setString(5, newAp.getApartment_explanation());//5
			st.setString(6, newAp.getFloor_plan());//6
			st.setBinaryStream(7, new ByteArrayInputStream(newAp.getFloor_plan_image()));//7
			st.setInt(8, newAp.getDepsit_reward());//8
			st.setInt(9, newAp.getRent());//9
			st.setString(10, newAp.getPet_friendly());//10
			st.setBinaryStream(11, new ByteArrayInputStream(newAp.getApartment_image()));//11

			line=st.executeUpdate();
			st.close();

		} catch (Exception e) {
//			e1.printStackTrace();// フロントコントローラが処理するので投げるだけでよい
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

	/*
	 * searchApartment(String apartment_address1,String apartment_address2) メソッド
	 *
	 * 処理内容：物件の情報検索で物件マスタにある情報を都道府県と市区町村でデータを抽出するメソッド
	 * 引数：住所１（都道府県）,住所2（市区町村以下）
	 * 戻り値： ArrayList<ApertmentMstBean>
	 */
	public ArrayList<ApertmentMstBean> searchApartment(String apartment_address1, String apartment_address2,
			String floor_plan, String pet_friendly, String priceH, String priceL) throws Exception {
    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	//UserMSTの情報を格納するBean
    	ArrayList<ApertmentMstBean> aplist=new ArrayList<ApertmentMstBean>();

    	int count=0;//?をカウント
		initial_sql.append("select * from ApartmentMst where");
		ArrayList<String> list=new ArrayList<String>();//プレースホルダの引数を入れるリスト

//入力情報をセット
		initial_sql.append(" apartment_address1=?");
		list.add(count,apartment_address1);
		count++;
		if (apartment_address2.length()>0) {
			initial_sql.append(" and apartment_address2 like ?");
			list.add(count,"%"+apartment_address2+"%");
			count++;
		}
		if (pet_friendly.length()>0) {
			initial_sql.append(" and pet_friendly=?");
			list.add(count,pet_friendly);
			count++;
		}
		if (floor_plan.length()>0) {
			initial_sql.append(" and floor_plan=?");
			list.add(count,floor_plan);
			count++;
		}

		if (priceL.length() > 0&&priceH.length() <=0) {//下限のみ入力されたとき
			initial_sql.append(" and rent>="+priceL);
		}else if (priceL.length()<=0&&priceH.length() > 0) {//上限のみ入力されたとき
			initial_sql.append(" and rent<=" + priceH);
		}else if (priceL.length()>0&&priceH.length() > 0) {//両方入力されたとき
			initial_sql.append(" and rent>="+priceL+" and rent<=" + priceH);
		}else {}//どちらも入力されなかったときは条件を追加しない

		initial_sql.append(";");
		initial_sql.toString().replace("where and","where");	//StringBufferから(一時的に)Stringへ変換＆replaceメソッドで置き換え

/*		if (initial_sql.indexOf("where;")>=0) {//「where;」の場合(全件検索)
					initial_sql.toString().replace("where;",";");
		}
*/

    	try {
			PreparedStatement ps = con.prepareStatement(initial_sql.toString());


			for(int i=0; i<count;i++) {//?が追加された分だけlist内の条件をセット
	    		ps.setString(i+1,list.get(i).toString());
	    	}

			ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	        	ApertmentMstBean ap=new ApertmentMstBean();
	        	ap.setApartment_cord(rs.getInt("apartment_cord"));
	        	ap.setApartment_name(rs.getNString("apartment_name"));
	        	ap.setApartment_address1(rs.getNString("apartment_address1"));
	        	ap.setApartment_address2(rs.getNString("apartment_address2"));
	        	ap.setContact_telnumber(rs.getNString("contact_telnumber"));
	        	ap.setApartment_explanation(rs.getString("apartment_explanation"));
	        	ap.setFloor_plan(rs.getString("floor_plan"));
	        	ap.setFloor_plan_image(rs.getBytes("floor_plan_image"));
	        	ap.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("floor_plan_image")));
	        	ap.setDepsit_reward(rs.getInt("depsit_reward"));
	        	ap.setRent(rs.getInt("rent"));
	        	ap.setPet_friendly(rs.getString("pet_friendly"));
	        	ap.setApartment_image(rs.getBytes("apartment_image"));
	        	ap.setApartment_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("apartment_image")));
	        	ap.setInsert_date(rs.getDate("insert_date"));
	        	ap.setUpdate_date(rs.getDate("update_date"));
	        	aplist.add(ap);
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
		return aplist;

	}

	/*
	 * searchApartmentDetail(int apartment_code)メソッド
	 *
	 * 処理内容：物件の詳細情報を取ってくるメソッド。基本的に１件しかヒットしない。
	 * 引数：物件コード（プライマリキー）
	 * 戻り値： ArrayList<ApertmentMstBean>
	 */
	public ArrayList<ApertmentMstBean> searchApartmentDetail(int apartment_cord) throws Exception {
    	//DBへのコネクションを接続(auumoにつなぐ)
    	Connection con = getConnection();

    	//UserMSTの情報を格納するBean
    	ArrayList<ApertmentMstBean> aplist=new ArrayList<ApertmentMstBean>();

    	try {
    		//SQLをセット
			PreparedStatement ps = con.prepareStatement(searchApartmentDetail_sql);

			ps.setInt(1,apartment_cord);// 1個目の?に物件コードをセットする。

	        //SQLを実行
	        ResultSet rs = ps.executeQuery();

	        //取得されたデータの分だけUserMstBeanにいれて、リストにデータを格納していく。
	        while (rs.next()) {
	        	ApertmentMstBean ap=new ApertmentMstBean();
	        	ap.setApartment_cord(rs.getInt("apartment_cord"));
	        	ap.setApartment_name(rs.getNString("apartment_name"));
	        	ap.setApartment_address1(rs.getNString("apartment_address1"));
	        	ap.setApartment_address2(rs.getNString("apartment_address2"));
	        	ap.setContact_telnumber(rs.getNString("contact_telnumber"));
	        	ap.setApartment_explanation(rs.getString("apartment_explanation"));
	        	ap.setFloor_plan(rs.getString("floor_plan"));
	        	ap.setFloor_plan_image(rs.getBytes("floor_plan_image"));
	        	ap.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("floor_plan_image")));
	        	ap.setDepsit_reward(rs.getInt("depsit_reward"));
	        	ap.setRent(rs.getInt("rent"));
	        	ap.setPet_friendly(rs.getString("pet_friendly"));
	        	ap.setApartment_image(rs.getBytes("apartment_image"));
	        	ap.setApartment_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("apartment_image")));
	        	ap.setInsert_date(rs.getDate("insert_date"));
	        	ap.setUpdate_date(rs.getDate("update_date"));
	        	aplist.add(ap);
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
		return aplist;
	}

//物件削除
	public int ApartmentDelete(int apartment_cord)throws Exception {
		Connection con=null;//初期値設定
		int line=0;
		try {
			con = getConnection();
			PreparedStatement st= con.prepareStatement(delete_sql);
			st.setInt(1,apartment_cord);
			line=st.executeUpdate();
			st.close();
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
		return line;
	}

	//新規物件Top５を検索する
		public ArrayList<ApertmentMstBean> searchTop5()throws Exception {
			Connection con=null;//初期値設定
	    	ArrayList<ApertmentMstBean> aplist=new ArrayList<ApertmentMstBean>();

	    	try {
	    		con = getConnection();
				PreparedStatement ps = con.prepareStatement(searchTop5_sql);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		        	ApertmentMstBean ap=new ApertmentMstBean();
					ap.setApartment_cord(rs.getInt("apartment_cord"));
		        	ap.setApartment_name(rs.getNString("apartment_name"));
		        	ap.setApartment_address1(rs.getNString("apartment_address1"));
		        	ap.setApartment_address2(rs.getNString("apartment_address2"));
		        	ap.setContact_telnumber(rs.getNString("contact_telnumber"));
		        	ap.setApartment_explanation(rs.getString("apartment_explanation"));
		        	ap.setFloor_plan(rs.getString("floor_plan"));
		        	ap.setFloor_plan_image(rs.getBytes("floor_plan_image"));
		        	ap.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("floor_plan_image")));
		        	ap.setDepsit_reward(rs.getInt("depsit_reward"));
		        	ap.setRent(rs.getInt("rent"));
		        	ap.setPet_friendly(rs.getString("pet_friendly"));
		        	ap.setApartment_image(rs.getBytes("apartment_image"));
		        	ap.setApartment_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("apartment_image")));
		        	ap.setInsert_date(rs.getDate("insert_date"));
		        	ap.setUpdate_date(rs.getDate("update_date"));
		        	aplist.add(ap);
		        }
		        ps.close();
		      } catch (SQLException e) {
					throw e;
		      } finally {
		            if (con != null) {
		                try {
		                    con.close();
		                } catch (SQLException e) {
		                    System.out.println("MySQLのクローズに失敗しました。");
		                }
		            }
		      }
			return aplist;
		}

		/*
		 * searchApartment(String apartment_address1,String apartment_address2) メソッド
		 *
		 * 処理内容：物件の情報検索で物件マスタにある情報を都道府県と市区町村でデータを抽出するメソッド
		 * 引数：住所１（都道府県）,住所2（市区町村以下）
		 * 戻り値： ArrayList<ApertmentMstBean>
		 */
		public ArrayList<ApertmentMstBean> searchApartment2(String apartment_address1, String apartment_address2,
				String floor_plan, String pet_friendly, String priceH,String priceL)throws Exception {
			//DBへのコネクションを接続(auumoにつなぐ)
			Connection con = getConnection();

			//UserMSTの情報を格納するBean
			ArrayList<ApertmentMstBean> aplist = new ArrayList<ApertmentMstBean>();

			initial_sql.append("select * from ApartmentMst where apartment_address1=? and apartment_address2 like ?");
			if (pet_friendly.length() > 0) {
				initial_sql.append(" and pet_friendly = " + pet_friendly);
			}
			if (floor_plan.length() > 0) {
				initial_sql.append(" and floor_plan = " + floor_plan);
			}
			if (priceH.length()>0) {
				initial_sql.append(" and rent >= " + priceH);
			}
			if (priceH.length() > 0) {
				initial_sql.append(" and rent <= " + priceH);
			}
			initial_sql.append(";");

			String searchApartment_sql = initial_sql.toString();
			System.out.println(searchApartment_sql);

			try {
				//SQLをセット
				PreparedStatement ps = con.prepareStatement(searchApartment_sql);

				ps.setString(1, apartment_address1);// 1個目の?に都道府県を設定
				ps.setString(2, "%" + apartment_address2 + "%");// 2個目の?に市区町村以下の内容を設定

				//SQLを実行
				ResultSet rs = ps.executeQuery();

				//取得されたデータの分だけUserMstBeanにいれて、リストにデータを格納していく。
				while (rs.next()) {
					ApertmentMstBean ap = new ApertmentMstBean();
					ap.setApartment_cord(rs.getInt("apartment_cord"));
					ap.setApartment_name(rs.getNString("apartment_name"));
					ap.setApartment_address1(rs.getNString("apartment_address1"));
					ap.setApartment_address2(rs.getNString("apartment_address2"));
					ap.setContact_telnumber(rs.getNString("contact_telnumber"));
					ap.setApartment_explanation(rs.getString("apartment_explanation"));
					ap.setFloor_plan(rs.getString("floor_plan"));
					ap.setFloor_plan_image(rs.getBytes("floor_plan_image"));
					ap.setFloor_plan_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("floor_plan_image")));
					ap.setDepsit_reward(rs.getInt("depsit_reward"));
					ap.setRent(rs.getInt("rent"));
					ap.setPet_friendly(rs.getString("pet_friendly"));
					ap.setApartment_image(rs.getBytes("apartment_image"));
					ap.setApartment_imageBase64(Base64.getEncoder().encodeToString(rs.getBytes("apartment_image")));
					ap.setInsert_date(rs.getDate("insert_date"));
					ap.setUpdate_date(rs.getDate("update_date"));
					aplist.add(ap);
				}
				System.out.println(aplist.isEmpty());
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
			return aplist;

		}
}
