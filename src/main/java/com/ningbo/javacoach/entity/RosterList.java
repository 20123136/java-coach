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
@Table(name = "rosterlist")
public class RosterList {

	/**
	 * 唯一标志，UUID
	 */
	private String Id;
	
	/**
	 * 活动名称
	 */
	private String name;
	
	/**
	 * 
	 */
	private String desc;
	
	/**
	 * 名单id
	 */
	private String columns;
	
	/**
	 * ־
	 */
	private String createtime;
	
	/**
	 * 
	 */
	private String lastModifyTime;
	
	/**
	 * 
	 */
	private String importPath;
	
	/**
	 * 
	 */
	private String importmode;
	
	/**
	 * 
	 */
	private String importTime;
	
	/**
	 * 
	 */
	private String lastImportTime;
	
	/**
	 * 
	 */
	private String lastImportStatus;
	
	/**
	 * 
	 */
	private Integer expireDays;
	
	/**
	 * 
	 */
	private String tenantId;

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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(String lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	public String getImportPath() {
		return importPath;
	}

	public void setImportPath(String importPath) {
		this.importPath = importPath;
	}

	public String getImportmode() {
		return importmode;
	}

	public void setImportmode(String importmode) {
		this.importmode = importmode;
	}

	public String getImportTime() {
		return importTime;
	}

	public void setImportTime(String importTime) {
		this.importTime = importTime;
	}

	public String getLastImportTime() {
		return lastImportTime;
	}

	public void setLastImportTime(String lastImportTime) {
		this.lastImportTime = lastImportTime;
	}

	public String getLastImportStatus() {
		return lastImportStatus;
	}

	public void setLastImportStatus(String lastImportStatus) {
		this.lastImportStatus = lastImportStatus;
	}

	public Integer getExpireDays() {
		return expireDays;
	}

	public void setExpireDays(Integer expireDays) {
		this.expireDays = expireDays;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}
