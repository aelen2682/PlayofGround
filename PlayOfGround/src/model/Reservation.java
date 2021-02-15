package model;

public class Reservation {

	private int id;
	private String reservationName;
	private String reservationAddress;
	private String reservationDate;
	private String userId;
	private Integer apiId;
	private String name;
	private String phone;
	
	public Reservation() {}

	public Reservation(int id, String reservationName, String reservationAddress, String reservationDate, String userId,
			Integer apiId, String name, String phone) {
		super();
		this.id = id;
		this.reservationName = reservationName;
		this.reservationAddress = reservationAddress;
		this.reservationDate = reservationDate;
		this.userId = userId;
		this.apiId = apiId;
		this.name = name;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReservationName() {
		return reservationName;
	}

	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}

	public String getReservationAddress() {
		return reservationAddress;
	}

	public void setReservationAddress(String reservationAddress) {
		this.reservationAddress = reservationAddress;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getApiId() {
		return apiId;
	}

	public void setApiId(Integer apiId) {
		this.apiId = apiId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", reservationName=" + reservationName + ", reservationAddress="
				+ reservationAddress + ", reservationDate=" + reservationDate + ", userId=" + userId + ", apiId="
				+ apiId + ", Name=" + name + ", Phone=" + phone + "]";
	}
}
