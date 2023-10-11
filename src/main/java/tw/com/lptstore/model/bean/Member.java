package tw.com.lptstore.model.bean;

public class Member {

	private int mID;
	private String account;
	private String password;
	private String level;
	private String mName;
	private String mPhone;
	

	public Member() {
	}

	public Member(String account, String password, String level, String mName) {
		super();
		this.account = account;
		this.password = password;
		this.level = level;
		this.mName = mName;
	}

	public Member(String account, String password, String level, String mName, String mPhone) {
		super();
		this.account = account;
		this.password = password;
		this.level = level;
		this.mName = mName;
		this.mPhone = mPhone;
	}
	
	public Member(int mID, String account, String password, String level, String mName, String mPhone) {
		super();
		this.mID = mID;
		this.account = account;
		this.password = password;
		this.level = level;
		this.mName = mName;
		this.mPhone = mPhone;
	}



	public int getmID() {
		return mID;
	}

	public void setmID(int mID) {
		this.mID = mID;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}


}
