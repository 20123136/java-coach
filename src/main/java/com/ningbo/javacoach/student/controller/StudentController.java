package com.ningbo.javacoach.student.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ningbo.javacoach.entity.Student;
import com.ningbo.javacoach.student.service.StudentService;
import com.ningbo.javacoach.student.viewbeen.VBStudent;


@Controller
@RequestMapping("student")
public class StudentController {
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Autowired
	@Qualifier(value = "studentService")
	private StudentService studentService;
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "signup")
	@ResponseBody
	public JSONObject signup(@RequestBody VBStudent viewBean) {
		JSONObject jsonObject = new JSONObject();
		Student student = new Student();
		try {
			student = studentService.signup(viewBean);
			jsonObject.put("returnCode", 0);
			jsonObject.put("returnMsg", "³É¹¦");
			jsonObject.put("data", student);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return jsonObject;
	}
}
