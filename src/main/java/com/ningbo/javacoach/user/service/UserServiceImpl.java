package com.ningbo.javacoach.user.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.alibaba.fastjson.JSONObject;
import com.ningbo.javacoach.common.SqlAndParams;
import com.ningbo.javacoach.user.sql.UserSql;
import com.ningbo.javacoach.user.viewbeen.VBUser;
import com.ningbo.javacoach.util.MD5Util;


public class UserServiceImpl implements UserService{
	
	private final Logger logger = LogManager.getLogger(getClass());

	private static UserSql userSql = new UserSql();
	
	@Autowired
	@Qualifier(value = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;


	public JSONObject login(VBUser viewBean) {
		JSONObject jsonObject = new JSONObject();
		try {
			SqlAndParams querySqlAndParams = userSql.buildQuerySql(null, viewBean);
			List<VBUser> list = jdbcTemplate.query(querySqlAndParams.getSql(), querySqlAndParams.getArgs().toArray(), new BeanPropertyRowMapper<>(VBUser.class));
			if(list.size() == 1 && MD5Util.MD5(viewBean.getPassword()).equals(list.get(0).getPassword())) {
				jsonObject.put("returnCode", 0);
				jsonObject.put("returnMsg", "登录成功");
			} else if(list.size() == 1 && !MD5Util.MD5(viewBean.getPassword()).equals(list.get(0).getPassword())){
				jsonObject.put("returnCode", 1);
				jsonObject.put("returnMsg", "密码错误");
			} else if(list.size() == 0){
				jsonObject.put("returnCode", 2);
				jsonObject.put("returnMsg", "用户名不存在");
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return jsonObject;
	}

	
}
