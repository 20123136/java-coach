package com.ningbo.javacoach.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * @author ZhangNa
 *
 * 2017年7月4日
 */
@Entity
@Table(name = "ivr")
public class Ivr {

	/**
	 * 唯一标志，UUID
	 */
	private String Id;
	
	/**
	 * 流程名称
	 */
	private String name;
	

}
