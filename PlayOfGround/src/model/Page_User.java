package model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Page_User {

	private int id;
	private String userId;
	private String password;
	private String name;
	private String gender;
	private String phone;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthDate;
	private byte manager;
	
	public Page_User() {}

	public Page_User(int id, String userId, String password, String name, String gender, String phone,
			LocalDate birthDate, byte manager) {
		super();
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.birthDate = birthDate;
		this.manager = manager;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}
	
	public byte getManager() {
		return manager;
	}

	public void setManager(byte manager) {
		this.manager = manager;
	}
	@Override
	public String toString() {
		return "Page_User [id=" + id + ", userId=" + userId + ", password=" + password + ", name=" + name + ", gender="
				+ gender + ", phone=" + phone + ", birthDate=" + birthDate + ", manager="+ manager +"]";
	}
	
}
