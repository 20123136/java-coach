package com.ningbo.javacoach.exception;


public class MyReturn {
	private String errcode = "0";
	private String errmsg = "Success";

	public MyReturn() {
	}
	
	public MyReturn(String errcode, String errmsg) {
		setErrcode(errcode);
		setErrmsg(errmsg);
	}

	public String getErrcode() {
		return errcode;
	}

	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
}
