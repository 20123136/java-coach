package com.ningbo.javacoach.user.sql;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.ningbo.javacoach.common.CommRequestParams;
import com.ningbo.javacoach.common.ISqlBuilder;
import com.ningbo.javacoach.common.SqlAndParams;
import com.ningbo.javacoach.entity.User;
import com.ningbo.javacoach.user.viewbeen.VBUser;
import com.ningbo.javacoach.util.DbUtil;
import com.ningbo.javacoach.util.QueryUtil;

public class UserSql implements ISqlBuilder<VBUser>{

	private final Logger logger = LogManager.getLogger(getClass());
	private static final String USER_TABLE = DbUtil.getTableName(User.class);
	private static final String WHERE1e1 = " WHERE 1=1 ";
	
	@Override
	public SqlAndParams buildQuerySql(CommRequestParams commParams, VBUser viewBean) {
		SqlAndParams sqlAndParams = new SqlAndParams();
		StringBuilder sql = new StringBuilder();
		List<Object> args = new ArrayList<>();

		sql.append("SELECT * FROM " + USER_TABLE + WHERE1e1);
		
		if(StringUtils.isNotBlank(viewBean.getName())){
			sql.append(" AND `name` = ? ");
			args.add(viewBean.getName());
		}
		
		buildOrderBySql(commParams, sql, args);
		buildLimitOffsetSql(commParams, sql, args);
		
		sqlAndParams.setSql(sql.toString());
		sqlAndParams.setArgs(args);
		
		logger.info(sql);
		
		return sqlAndParams;
	}


	@Override
	public void buildWhereSql(StringBuilder sql, List<Object> args, VBUser viewBean) {
		
		QueryUtil.queryData(sql, args, viewBean.getName(), "name");
	}


	@Override
	public SqlAndParams buildCountSql(CommRequestParams commParams, VBUser viewBean) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public SqlAndParams buildCheckedIdListSql(VBUser viewBean) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void buildOrderBySql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void buildLimitOffsetSql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		// TODO Auto-generated method stub
		
	}
	
}
