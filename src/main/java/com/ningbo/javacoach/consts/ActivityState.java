package com.ningbo.javacoach.consts;

public enum ActivityState {
	
	INIT("init", "鍒濆鍖�"),
	RUNNING("running", "杩愯涓�"),
	COMPLETE("complete", "瀹屾垚");
	
	private String state;
	private String stateDesc;
	
	private ActivityState(String state, String stateDesc) {
		this.state = state;
		this.stateDesc = stateDesc;
	}

	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}



	public String getStateDesc() {
		return stateDesc;
	}

	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}
	
}
