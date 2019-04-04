package com.ningbo.javacoach.exception;

/**
 * 
 * @author ZhangNa
 *
 * 2017年6月28日
 */
public enum ErrCode {
	
	DATAACCESSEXCEPTION("-1","数据库操作异常");

	private String errcode;
	private String errmsg;

	private ErrCode(String errcode, String errmsg) {
		this.errcode = errcode;
		this.errmsg = errmsg;
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
