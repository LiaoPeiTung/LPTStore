package tw.com.lptstore.model.bean;

public class Competition {

	private int cID;
	private String cName;
	private int cFee;
	private String cTime;
	private String cReward;

	public Competition() {
	}

	public Competition(String cName, int cFee, String cTime, String cReward) {
		super();
		this.cName = cName;
		this.cFee = cFee;
		this.cTime = cTime;
		this.cReward = cReward;
	}

	public Competition(int cID, String cName, int cFee, String cTime, String cReward) {
		super();
		this.cID = cID;
		this.cName = cName;
		this.cFee = cFee;
		this.cTime = cTime;
		this.cReward = cReward;
	}

	public int getcID() {
		return cID;
	}

	public void setcID(int cID) {
		this.cID = cID;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getcFee() {
		return cFee;
	}

	public void setcFee(int cFee) {
		this.cFee = cFee;
	}

	public String getcTime() {
		return cTime;
	}

	public void setcTime(String cTime) {
		this.cTime = cTime;
	}

	public String getcReward() {
		return cReward;
	}

	public void setcReward(String cReward) {
		this.cReward = cReward;
	}

}
