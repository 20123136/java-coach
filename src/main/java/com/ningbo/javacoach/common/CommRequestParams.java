package com.ningbo.javacoach.common;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.ningbo.javacoach.datatable.DatatablesParams;


public class CommRequestParams {

	private HttpServletRequest request = null;
	
	/**
	 * 涓撶敤鍙傛暟
	 */
	private DatatablesParams datatablesParams;
	
	/**
	 * 涓撻棬鎺ユ敹椤甸潰Datatables浼犺繃鏉ョ殑鍙傛暟灏佽鍒癲atatablesParams涓紝铏界劧鍙湁涓�涓猄et鏂规硶浣嗘槸  锛侊紒锛佷笉鑳藉垹锛侊紒锛�
	 * 椤甸潰鐨勫瓧娈靛悕key蹇呴』鏄痙ataTableJsonParams
	 * @param param
	 */
	public void setDataTableJsonParams(String dataTableJsonParams) {
		this.setDatatablesParams(JSON.parseObject(dataTableJsonParams, DatatablesParams.class));
	}

	public DatatablesParams getDatatablesParams() {
		return datatablesParams;
	}

	public void setDatatablesParams(DatatablesParams datatablesParams) {
		this.datatablesParams = datatablesParams;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


}
