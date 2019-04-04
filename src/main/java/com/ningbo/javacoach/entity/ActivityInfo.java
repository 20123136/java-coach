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
@Table(name = "activityinfo")
public class ActivityInfo {

	/**
	 * 唯一标志，UUID
	 */
	private String Id;
	
	/**
	 * 活动名称
	 */
	private String name;
	
	/**
	 * 租户唯一标识
	 */
	private String tenantid;
	
	/**
	 * 
	 */
	private String desc;
	
	/**
	 * 
	 */
	private Integer status;
	
	/**
	 * 名单id
	 */
	private String policyname;
	
	/**
	 * ־
	 */
	private String rostername;
	
	/**
	 * 
	 */
	private Integer maxcapacity;
	
	/**
	 * 
	 */
	private Integer priority;
	
	/**
	 * 
	 */
	private String localNo;
	
	/**
	 * 
	 */
	private Integer condition;
	
	/**
	 * 
	 */
	private String uui;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTenantid() {
		return tenantid;
	}

	public void setTenantid(String tenantid) {
		this.tenantid = tenantid;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPolicyname() {
		return policyname;
	}

	public void setPolicyname(String policyname) {
		this.policyname = policyname;
	}

	public String getRostername() {
		return rostername;
	}

	public void setRostername(String rostername) {
		this.rostername = rostername;
	}

	public Integer getMaxcapacity() {
		return maxcapacity;
	}

	public void setMaxcapacity(Integer maxcapacity) {
		this.maxcapacity = maxcapacity;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getLocalNo() {
		return localNo;
	}

	public void setLocalNo(String localNo) {
		this.localNo = localNo;
	}

	public Integer getCondition() {
		return condition;
	}

	public void setCondition(Integer condition) {
		this.condition = condition;
	}

	public String getUui() {
		return uui;
	}

	public void setUui(String uui) {
		this.uui = uui;
	}
	

}
