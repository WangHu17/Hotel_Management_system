package Bean;

import java.sql.Date;

public class incomeViewBean {
	private Date checkOutTime;
	private int totalIncome;
	private int num;
	public Date getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Date checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public int getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(int totalIncome) {
		this.totalIncome = totalIncome;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
