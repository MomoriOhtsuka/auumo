package bean;

import java.io.Serializable;
import java.util.Date;

public class ReviewBean  implements Serializable{
	private int review_id;
	private int apartment_cord;
	private int account_cord;
	private String message;
	private Date insert_date;
	private Date update_date;

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
	public int getAccount_cord() {
		return account_cord;
	}
	public void setAccount_cord(int account_cord) {
		this.account_cord = account_cord;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
}
