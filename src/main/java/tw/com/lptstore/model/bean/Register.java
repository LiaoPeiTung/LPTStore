package tw.com.lptstore.model.bean;

public class Register {

	private int rID;
	private int mID;
	private int cID;

	public Register() {

	}

	public Register(int mID, int cID) {
		super();
		this.mID = mID;
		this.cID = cID;
	}

	public int getrID() {
		return rID;
	}

	public void setrID(int rID) {
		this.rID = rID;
	}

	public int getmID() {
		return mID;
	}

	public void setmID(int mID) {
		this.mID = mID;
	}

	public int getcID() {
		return cID;
	}

	public void setcID(int cID) {
		this.cID = cID;
	}

}
