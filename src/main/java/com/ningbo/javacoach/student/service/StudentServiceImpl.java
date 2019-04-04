package com.ningbo.javacoach.student.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ningbo.javacoach.entity.Student;
import com.ningbo.javacoach.student.sql.StudentSql;
import com.ningbo.javacoach.student.viewbeen.VBStudent;

import cc.rssoft.framework.db.dao.SuperDao;


public class StudentServiceImpl implements StudentService{
	
	private final Logger logger = LogManager.getLogger(getClass());

	private static StudentSql studentSql = new StudentSql();
	
	@Autowired
	@Qualifier(value = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	@Qualifier(value = "superDao")
	private SuperDao superDao;


	@Override
	public Student signup(VBStudent viewBean) throws Exception {
		Student student = new Student();
		student.setName(viewBean.getName());
		student.setSex(viewBean.getSex());
		student.setPhoneNumber(viewBean.getPhoneNumber());
		student.setArea(viewBean.getArea());
		student = superDao.save(student);
		return student;
	}
	
}
