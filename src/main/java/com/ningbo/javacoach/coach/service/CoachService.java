package com.ningbo.javacoach.coach.service;

import com.alibaba.fastjson.JSONObject;
import com.ningbo.javacoach.coach.viewbeen.VBCoach;
import com.ningbo.javacoach.common.CommRequestParams;

public interface CoachService{

	public JSONObject getCoachData(CommRequestParams commParams, VBCoach viewBean);
	
}
