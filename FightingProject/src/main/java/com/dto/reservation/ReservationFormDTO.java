package com.dto.reservation;

public class ReservationFormDTO {

	private String reservDate;
	private String reservNum;
	public ReservationFormDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationFormDTO(String reservDate, String reservNum) {
		super();
		this.reservDate = reservDate;
		this.reservNum = reservNum;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservNum() {
		return reservNum;
	}
	public void setReservNum(String reservNum) {
		this.reservNum = reservNum;
	}
	@Override
	public String toString() {
		return "ReservationFormDTO [reservDate=" + reservDate + ", reservNum=" + reservNum + "]";
	}
	
	
}
