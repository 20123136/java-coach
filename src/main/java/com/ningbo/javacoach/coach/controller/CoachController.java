package com.ningbo.javacoach.coach.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ningbo.javacoach.coach.service.CoachService;
import com.ningbo.javacoach.coach.viewbeen.VBCoach;
import com.ningbo.javacoach.common.CommRequestParams;

@Controller
@RequestMapping("coach")
public class CoachController {
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Autowired
	@Qualifier(value = "coachService")
	private CoachService coachService;
	
	@RequestMapping(value = "getData")
	@ResponseBody
	public String getStatisticsData(HttpServletRequest request, HttpServletResponse response, CommRequestParams commParams, VBCoach viewBean) {
		JSONObject jSONObject = new JSONObject();
		try {
			jSONObject = coachService.getCoachData(commParams, viewBean);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return jSONObject.toJSONString();
	}
}
