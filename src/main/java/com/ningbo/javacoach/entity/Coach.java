package com.ningbo.javacoach.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_coach")
public class Coach {
	
	private Integer id;
	
	private String name;
	private String sex;
	
	private String birthday;
	
	private String education;
	private String phoneNumber;
	private String driverSchool;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getDriverSchool() {
		return driverSchool;
	}
	public void setDriverSchool(String driverSchool) {
		this.driverSchool = driverSchool;
	}
	
	
	
}
