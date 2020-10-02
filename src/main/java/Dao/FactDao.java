package Dao;

public class FactDao {
	private memberDao MD;
	private sendMailDao SMD;
	private staffDao SD;
	
	public memberDao getMD() {
		return MD;
	}
	public void setMD(memberDao mD) {
		MD = mD;
	}
	public sendMailDao getSMD() {
		return SMD;
	}
	public void setSMD(sendMailDao sMD) {
		SMD = sMD;
	}
	public staffDao getSD() {
		return SD;
	}
	public void setSD(staffDao sD) {
		SD = sD;
	}
	
	
}
