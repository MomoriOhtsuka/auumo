package bean;

import java.io.Serializable;
import java.util.Date;

public class UserMstBean implements Serializable  {
	private int account_code;
	private String login_id;
	private String nick_name;
	private String email_address;
	private String password;
	private String role_id;
	private Date insert_date;
	private Date update_date;


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

	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
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

