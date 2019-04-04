package com.ningbo.javacoach.student.controller;

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
	
	@RequestMapping(value = "signup")
	@ResponseBody
	public String signup(HttpServletRequest request, HttpServletResponse response, VBStudent viewBean) {
		Student student = new Student();
		try {
			student = studentService.signup(viewBean);
		} catch (Exception e) {
			logger.info(e.getMessage(), e);
		}
		return JSONObject.toJSONString(student);
	}
}
