package com.ningbo.javacoach.coach.sql;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.ningbo.javacoach.coach.viewbeen.VBCoach;
import com.ningbo.javacoach.common.CommRequestParams;
import com.ningbo.javacoach.common.ISqlBuilder;
import com.ningbo.javacoach.common.SqlAndParams;
import com.ningbo.javacoach.datatable.Column;
import com.ningbo.javacoach.datatable.DatatablesParams;
import com.ningbo.javacoach.datatable.Order;
import com.ningbo.javacoach.entity.Coach;
import com.ningbo.javacoach.util.DbUtil;
import com.ningbo.javacoach.util.QueryUtil;

public class CoachSql implements ISqlBuilder<VBCoach>{

	private final Logger logger = LogManager.getLogger(getClass());
	private static final String COACH_TABLE = DbUtil.getTableName(Coach.class);
	private static final String WHERE1e1 = " WHERE 1=1 ";
	
	@Override
	public SqlAndParams buildQuerySql(CommRequestParams commParams, VBCoach viewBean) {
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
	public SqlAndParams buildCountSql(CommRequestParams commParams, VBCoach viewBean) {
		
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
	public SqlAndParams buildCheckedIdListSql(VBCoach viewBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void buildWhereSql(StringBuilder sql, List<Object> args, VBCoach viewBean) {
		QueryUtil.queryData(sql, args, viewBean.getName(), "name");
		QueryUtil.queryData(sql, args, viewBean.getSex(), "sex");
		QueryUtil.queryData(sql, args, viewBean.getPhoneNumber(), "phoneNumber");
	}

	@Override
	public void buildOrderBySql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		// order by鐨勪俊鎭槸UI閫氳繃queryCondition浼犻�掕繃鏉ョ殑
		// 浠庡弬鏁皅ueryCondition涓彁鍙杘rder by淇℃伅锛屽苟鏀惧埌List涓�
		// map key鍒楀悕,value鍗囧簭闄嶅簭(asc, desc)
		DatatablesParams datatablesParams = commParams.getDatatablesParams();//鍙傛暟
		List<Order> order = datatablesParams.getOrder();//鎺掑簭
		List<Column> columns = datatablesParams.getColumns();//鎵�鏈夌殑鍒�
		
		//濡傛灉鏈寚瀹氬垪鍒欎笉鎺掑簭
		if((order != null) && (!order.isEmpty())){
			sql.append(" ORDER BY ");
			for (Order m : order) {
				int orderColumIndex = m.getColumn();//绗嚑鍒�
				String dir = m.getDir();//鎺掑簭鏂瑰紡
				String orderColum = columns.get(orderColumIndex).getName();
				sql.append(" "+orderColum + " " + dir + ",");
			}
			//鍒囨帀鏈�鍚庝竴涓�楀彿
			sql.deleteCharAt(sql.lastIndexOf(","));
		}
		
	}

	@Override
	public void buildLimitOffsetSql(CommRequestParams commParams, StringBuilder sql, List<Object> args) {
		DatatablesParams datatablesParams = commParams.getDatatablesParams();//鍙傛暟
		sql.append(" LIMIT " + datatablesParams.getLength() +" OFFSET " + datatablesParams.getStart());
	}
	
	
}
