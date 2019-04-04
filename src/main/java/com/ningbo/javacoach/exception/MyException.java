package com.ningbo.javacoach.exception;


public class MyException extends RuntimeException {

	private static final long serialVersionUID = 7215013520636964844L;
	private String errcode = "0";
	private String errmsg = "";

	public MyException(String errcode, String errmsg) {
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
