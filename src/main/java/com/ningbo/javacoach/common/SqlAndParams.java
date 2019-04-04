package com.ningbo.javacoach.common;

import java.util.ArrayList;
import java.util.List;

public class SqlAndParams {

	private String sql;
	
	private List<Object> args = new ArrayList<>();
	
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public List<Object> getArgs() {
		return args;
	}
	public void setArgs(List<Object> args) {
		this.args = args;
	}

}
