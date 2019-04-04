package com.ningbo.javacoach.user.service;

import com.alibaba.fastjson.JSONObject;
import com.ningbo.javacoach.user.viewbeen.VBUser;

public interface UserService{

	public JSONObject login(VBUser viewBean);
	
}
