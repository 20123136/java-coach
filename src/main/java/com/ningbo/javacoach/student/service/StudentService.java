package com.ningbo.javacoach.student.service;

import com.ningbo.javacoach.entity.Student;
import com.ningbo.javacoach.student.viewbeen.VBStudent;

public interface StudentService{

	public Student signup(VBStudent viewBean) throws Exception;
	
}
