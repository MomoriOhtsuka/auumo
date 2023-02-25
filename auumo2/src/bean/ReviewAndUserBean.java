package bean;

import java.sql.Timestamp;

public class ReviewAndUserBean implements java.io.Serializable{

	private int review_id;
	private int apartment_cord;
	private int account_code;
	private String message;
	private String login_id;
	private String nick_name;
	private Timestamp  review_insert_date;


	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getApartment_cord() {
		return apartment_cord;
	}
	public void setApartment_cord(int apartment_cord) {
		this.apartment_cord = apartment_cord;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public int getAccount_code() {
		return account_code;
	}
	public void setAccount_code(int account_code) {
		this.account_code = account_code;
	}

	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public Timestamp getReview_insert_date() {
		return review_insert_date;
	}
	public void setReview_insert_date(Timestamp review_input_date) {
		this.review_insert_date = review_input_date;
	}


}
