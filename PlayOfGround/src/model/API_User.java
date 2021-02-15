package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class API_User {

	private int id;
	private String company;
	private Integer apiId;
	private String name;
	private String gender;
	private String phone;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthDate;
	private byte manager;
	
	public API_User() {}

	public API_User(int id, String company, Integer apiId, String name, String gender, String phone,
			LocalDate birthDate, byte manager) {
		super();
		this.id = id;
		this.company = company;
		this.apiId = apiId;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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
		return "API_User [id=" + id + ", company=" + company + ", apiId=" + apiId + ", name=" + name + ", gender="
				+ gender + ", phone=" + phone + ", birthDate=" + birthDate + ", manager="+ manager +"]";
	}
	
}
	