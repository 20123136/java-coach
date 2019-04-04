package com.ningbo.javacoach.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * @author ZhangNa
 *
 * 2017年6月28日
 */
@Entity
@Table(name = "activitycallresult")
public class ActivityCallResult {

	/**
	 * 唯一标志，UUID
	 */
	private String Id;
	
	/**
	 * 客户名
	 */
	private String FirstName;
	
	/**
	 * 客户姓
	 */
	private String LastName;
	
	/**
	 * 性别
	 */
	private Integer gender;
	
	/**
	 * 活动id
	 */
	private String activity_id;
	
	/**
	 * 名单id
	 */
	private String rosterinfo_id;
	
	/**
	 * 一次呼叫的唯一标志־
	 */
	private String Callid;
	
	/**
	 * 开始时间
	 */
	private Date Callstarttime;
	
	/**
	 * 结束时间
	 */
	private Date Callendtime;
	
	/**
	 * 外呼结果，是否成功
	 */
	private String Result;
	
	/**
	 * 外呼结果，失败原因
	 * 
	 * 0：成功；1：用户正忙；2：来电提醒；3：无法接通；4：呼叫限制；5：呼叫转移；6：关机；7：停机；8：空号；9：正在通话中；10：网络忙；11：超时；12：短忙音；13：长忙音
	 * 
	 */
	private Integer ResultCode;
	
	/**
	 * 联系号码
	 */
	private String contactnum;
	
	/**
	 * 
	 */
	private String identifyid;
	
	/**
	 * 呼叫次数
	 */
	private Integer calltimes;
	
	/**
	 * 应答时间
	 */
	private Date CallAnswerTime;
	
	/**
	 * 呼叫结束类型，是否转人工 。1 转人工
	 */
	private Integer CallEndType;
	
	/**
	 * 联系人ID，表示联系人唯一性
	 */
	private String contactID;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(String activity_id) {
		this.activity_id = activity_id;
	}

	public String getRosterinfo_id() {
		return rosterinfo_id;
	}

	public void setRosterinfo_id(String rosterinfo_id) {
		this.rosterinfo_id = rosterinfo_id;
	}

	public String getCallid() {
		return Callid;
	}

	public void setCallid(String callid) {
		Callid = callid;
	}

	public Date getCallstarttime() {
		return Callstarttime;
	}

	public void setCallstarttime(Date callstarttime) {
		Callstarttime = callstarttime;
	}

	public Date getCallendtime() {
		return Callendtime;
	}

	public void setCallendtime(Date callendtime) {
		Callendtime = callendtime;
	}

	public String getResult() {
		return Result;
	}

	public void setResult(String result) {
		Result = result;
	}

	public Integer getResultCode() {
		return ResultCode;
	}

	public void setResultCode(Integer resultCode) {
		ResultCode = resultCode;
	}

	public String getContactnum() {
		return contactnum;
	}

	public void setContactnum(String contactnum) {
		this.contactnum = contactnum;
	}

	public String getIdentifyid() {
		return identifyid;
	}

	public void setIdentifyid(String identifyid) {
		this.identifyid = identifyid;
	}

	public Integer getCalltimes() {
		return calltimes;
	}

	public void setCalltimes(Integer calltimes) {
		this.calltimes = calltimes;
	}

	public Date getCallAnswerTime() {
		return CallAnswerTime;
	}

	public void setCallAnswerTime(Date callAnswerTime) {
		CallAnswerTime = callAnswerTime;
	}

	public Integer getCallEndType() {
		return CallEndType;
	}

	public void setCallEndType(Integer callEndType) {
		CallEndType = callEndType;
	}

	public String getContactID() {
		return contactID;
	}

	public void setContactID(String contactID) {
		this.contactID = contactID;
	}

}
