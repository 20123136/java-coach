package com.ningbo.javacoach.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * @author ZhangNa
 *
 * 2017年6月29日
 */
@Entity
@Table(name = "activitycount")
public class ActivityCount {

	/**
	 * 唯一标志，UUID
	 */
	private String Id;
	
	/**
	 * 活动名称
	 */
	private String activityname;
	
	/**
	 * 
	 */
	private String state;
	
	/**
	 * 名单id
	 */
	private String starttime;
	
	/**
	 * ־
	 */
	private String endtime;
	
	/**
	 * 
	 */
	private Integer rosternumber;
	
	/**
	 * 
	 */
	private Integer outreachnumber;
	
	/**
	 * 
	 */
	private Integer completionrate;
	
	/**
	 * 
	 */
	private Integer establishrate;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getActivityname() {
		return activityname;
	}

	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Integer getRosternumber() {
		return rosternumber;
	}

	public void setRosternumber(Integer rosternumber) {
		this.rosternumber = rosternumber;
	}

	public Integer getOutreachnumber() {
		return outreachnumber;
	}

	public void setOutreachnumber(Integer outreachnumber) {
		this.outreachnumber = outreachnumber;
	}

	public Integer getCompletionrate() {
		return completionrate;
	}

	public void setCompletionrate(Integer completionrate) {
		this.completionrate = completionrate;
	}

	public Integer getEstablishrate() {
		return establishrate;
	}

	public void setEstablishrate(Integer establishrate) {
		this.establishrate = establishrate;
	}
}
