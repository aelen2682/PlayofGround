package model;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {

	private int id;
	private String title;
	private String context;
	private String name;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime iDate;
	private LocalDateTime upDate;
	
 
	public Board() { }

	public Board(int id, String title, String context, String name, LocalDateTime iDate, LocalDateTime upDate) {
		super();
		this.id = id;
		this.title = title;
		this.context = context;
		this.name = name;
		this.iDate = iDate;
		this.upDate = upDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getiDate() {
		return iDate;
	}

	public void setiDate(LocalDateTime iDate) {
		this.iDate = iDate;
	}

	public LocalDateTime getUpDate() {
		return upDate;
	}

	public void setUpDate(LocalDateTime upDate) {
		this.upDate = upDate;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", context=" + context + ", name=" + name + ", iDate=" + iDate
				+ ", upDate=" + upDate + "]";
	}
	
	
}
