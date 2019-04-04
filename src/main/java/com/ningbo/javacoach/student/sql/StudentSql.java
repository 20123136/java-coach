package com.ningbo.javacoach.student.sql;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.ningbo.javacoach.common.CommRequestParams;
import com.ningbo.javacoach.common.ISqlBuilder;
import com.ningbo.javacoach.common.SqlAndParams;
import com.ningbo.javacoach.datatable.Column;
import com.ningbo.javacoach.datatable.DatatablesParams;
import com.ningbo.javacoach.datatable.Order;
import com.ningbo.javacoach.entity.Student;
import com.ningbo.javacoach.student.viewbeen.VBStudent;
import com.ningbo.javacoach.util.DbUtil;
import com.ningbo.javacoach.util.QueryUtil;

public class StudentSql implements ISqlBuilder<VBStudent>{

	private final Logger logger = LogManager.getLogger(getClass());
	private static final String COACH_TABLE = DbUtil.getTableName(Student.class);
	private static final String WHERE1e1 = " WHERE 1=1 ";
	
	@Override
	public SqlAndParams buildQuerySql(CommRequestParams commParams, VBStudent viewBean) {
		SqlAndParams sqlAndParams = new SqlAndParams();
		StringBuilder sql = new StringBuilder();
		List<Object> args = new ArrayList<>();

		sql.append("SELECT * FROM " + COACH_TABLE + WHERE1e1);
		
		buildWhereSql(sql, args, viewBean);
		
		buildOrderBySql(commParams, sql, args);
		buildLimitOffsetSql(commParams, sql, args);
		
		sqlAndParams.setSql(sql.toString());
		sqlAndParams.setArgs(args);
		
		logger.info(sql);
		
		return sqlAndParams;
	}

	@Override
	public SqlAndParams buildCountSql(CommRequestParams commParams, VBStudent viewBean) {
		
		SqlAndParams sqlAndParams = new SqlAndParams();
		StringBuilder sql = new StringBuilder();
		List<Object> args = new ArrayList<>();
		
		sql.append("SELECT count(id) FROM " + COACH_TABLE + WHERE1e1);
		
		buildWhereSql(sql, args, viewBean);
				
		sqlAndParams.setSql(sql.toString());
		sqlAndParams.setArgs(args);
		
		logger.info(sql);
		
		return sqlAndParams;
	}
	
	@Override
	public SqlAndParams buildCheckedIdListSql(VBStudent viewBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void buildWhereSql(StringBuilder sql, List<Object> args, VBStudent viewBean) {
		QueryUtil.queryData(sql, args, viewBean.getName(), "name");
		QueryUtil.queryData(sql, args, viewBean.getSex(), "sex");
		QueryUtil.queryData(sql, args, viewBean.getPhoneNumber(), "phoneNumber");
	}

	@Override
	public void buildOrderBySql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		// order by的信息是UI通过queryCondition传递过来的
		// 从参数queryCondition中提取order by信息，并放到List中
		// map key列名,value升序降序(asc, desc)
		DatatablesParams datatablesParams = commParams.getDatatablesParams();//参数
		List<Order> order = datatablesParams.getOrder();//排序
		List<Column> columns = datatablesParams.getColumns();//所有的列
		
		//如果未指定列则不排序
		if((order != null) && (!order.isEmpty())){
			sql.append(" ORDER BY ");
			for (Order m : order) {
				int orderColumIndex = m.getColumn();//第几列
				String dir = m.getDir();//排序方式
				String orderColum = columns.get(orderColumIndex).getName();
				sql.append(" "+orderColum + " " + dir + ",");
			}
			//切掉最后一个逗号
			sql.deleteCharAt(sql.lastIndexOf(","));
		}
		
	}

	@Override
	public void buildLimitOffsetSql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		DatatablesParams datatablesParams = commParams.getDatatablesParams();//参数
		sql.append(" LIMIT " + datatablesParams.getLength() +" OFFSET " + datatablesParams.getStart());
	}
	
	
}
