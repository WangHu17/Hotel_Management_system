package Bean;

import java.sql.Date;

public class timeExtensionOrdersViewBean {
	int orderNumber;
	String customerName;
	String customerPhoneNumber;
	String roomNumber;
	Date checkInTime;
	Date oldExpiryDate;
	Date newExpiryDate;
	int addMoney;
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhoneNumber() {
		return customerPhoneNumber;
	}
	public void setCustomerPhoneNumber(String customerPhoneNumber) {
		this.customerPhoneNumber = customerPhoneNumber;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public Date getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(Date checkInTime) {
		this.checkInTime = checkInTime;
	}
	public Date getOldExpiryDate() {
		return oldExpiryDate;
	}
	public void setOldExpiryDate(Date oldExpiryDate) {
		this.oldExpiryDate = oldExpiryDate;
	}
	public Date getNewExpiryDate() {
		return newExpiryDate;
	}
	public void setNewExpiryDate(Date newExpiryDate) {
		this.newExpiryDate = newExpiryDate;
	}
	public int getAddMoney() {
		return addMoney;
	}
	public void setAddMoney(int addMoney) {
		this.addMoney = addMoney;
	}
}
