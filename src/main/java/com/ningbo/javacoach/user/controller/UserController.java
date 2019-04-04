package com.ningbo.javacoach.user.controller;

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
import com.ningbo.javacoach.user.service.UserService;
import com.ningbo.javacoach.user.viewbeen.VBUser;


@Controller
@RequestMapping("user")
public class UserController {
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Autowired
	@Qualifier(value = "userService")
	private UserService userService;
	
	@RequestMapping(value = "login")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response, VBUser viewBean) {
		JSONObject jSONObject = new JSONObject();
		try {
			jSONObject = userService.login(viewBean);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return jSONObject.toJSONString();
	}
}
