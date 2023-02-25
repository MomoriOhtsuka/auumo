package bean;

import java.sql.Date;

public class ApertmentMstBean implements java.io.Serializable{
//Ap「a」rtmentBeanに変えたい

	private int apartment_cord;				//物件コード
	private String apartment_name;			//物件名
	private String apartment_address1;		//物件住所（都道府県）
	private String apartment_address2;		//物件住所（市区町村）
	private String contact_telnumber;		//管理先電話番号
	private String apartment_explanation;	//物件説明
	private String floor_plan;				//間取り
	//private Blob floor_plan_image;			//間取り画像
	private byte[] floor_plan_image;			//間取り画像
	private String floor_plan_imageBase64;	//間取り画像をBase64にデコードした値
	private int depsit_reward;				//敷金・礼金
	private int rent;						//家賃
	private String pet_friendly;				//ペット可否
	//private Blob apartment_image;			//物件画像
	private byte[] apartment_image;			//物件画像
	private String apartment_imageBase64;	//物件画像をBase64にデコードした値
	private Date insert_date;				//登録日
	private Date update_date;				//更新日
	public int getApartment_cord() {
		return apartment_cord;
	}
	public void setApartment_cord(int apartment_cord) {
		this.apartment_cord = apartment_cord;
	}
	public String getApartment_name() {
		return apartment_name;
	}
	public void setApartment_name(String apartment_name) {
		this.apartment_name = apartment_name;
	}
	public String getApartment_address1() {
		return apartment_address1;
	}
	public void setApartment_address1(String apartment_address1) {
		this.apartment_address1 = apartment_address1;
	}
	public String getApartment_address2() {
		return apartment_address2;
	}
	public void setApartment_address2(String apartment_address2) {
		this.apartment_address2 = apartment_address2;
	}
	public String getContact_telnumber() {
		return contact_telnumber;
	}
	public void setContact_telnumber(String contact_telnumber) {
		this.contact_telnumber = contact_telnumber;
	}
	public String getApartment_explanation() {
		return apartment_explanation;
	}
	public void setApartment_explanation(String apartment_explanation) {
		this.apartment_explanation = apartment_explanation;
	}
	public String getFloor_plan() {
		return floor_plan;
	}
	public void setFloor_plan(String floor_plan) {
		this.floor_plan = floor_plan;
	}
//	public Blob getFloor_plan_image() {
//		return floor_plan_image;
//	}
//	public void setFloor_plan_image(Blob floor_plan_image) {
//		this.floor_plan_image = floor_plan_image;
//	}
	public byte[] getFloor_plan_image() {
	return floor_plan_image;
	}
	public void setFloor_plan_image(byte[] floor_plan_image) {
	this.floor_plan_image = floor_plan_image;
	}

	public int getDepsit_reward() {
		return depsit_reward;
	}
	public void setDepsit_reward(int depsit_reward) {
		this.depsit_reward = depsit_reward;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public String getPet_friendly() {
		return pet_friendly;
	}
	public void setPet_friendly(String pet_friendly) {
		this.pet_friendly = pet_friendly;
	}
//	public Blob getApartment_image() {
//		return apartment_image;
//	}
//	public void setApartment_image(Blob apartment_image) {
//		this.apartment_image = apartment_image;
//	}
	public byte[] getApartment_image() {
		return apartment_image;
	}
	public void setApartment_image(byte[] apartment_image) {
		this.apartment_image = apartment_image;
	}

	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getFloor_plan_imageBase64() {
		return floor_plan_imageBase64;
	}
	public void setFloor_plan_imageBase64(String floor_plan_imageBase64) {
		this.floor_plan_imageBase64 = floor_plan_imageBase64;
	}
	public String getApartment_imageBase64() {
		return apartment_imageBase64;
	}
	public void setApartment_imageBase64(String apartment_imageBase64) {
		this.apartment_imageBase64 = apartment_imageBase64;
	}



}
