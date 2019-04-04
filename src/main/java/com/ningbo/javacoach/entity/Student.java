package com.ningbo.javacoach.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cc.rssoft.framework.db.core.BaseEntity;

@Entity
@Table(name = "t_student")
public class Student extends BaseEntity {
	
	private String name;
	private String sex;
	
	private String birthday;
	private String phoneNumber;
	
	private String area;
	
	private String desc;
	
	private Integer coachId;

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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Integer getCoachId() {
		return coachId;
	}

	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}
	
}
