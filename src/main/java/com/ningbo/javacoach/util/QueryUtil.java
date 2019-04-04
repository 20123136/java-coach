package com.ningbo.javacoach.util;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class QueryUtil {

	public static String ipslipt(String str) {

		StringBuilder ret = new StringBuilder();
		for (String s : str.split("\\.")) {
			ret.append(s);
		}
		return ret.toString();
	}

	/**
	 * 模糊查询
	 * 
	 * @param sql
	 * @param params
	 * @param value
	 * @param query
	 */
	public static void like(StringBuilder sql, List<Object> args, String value, String query) {
		if (StringUtils.isNotBlank(value)) {
			sql.append(query);
			args.add("%" + value + "%");
		}
	}

	/**
	 * 按时间查询
	 */
	public static void date(StringBuilder sql, List<Object> args, String date, String string) {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		if (StringUtils.isNotBlank(date)) {
			Date dd;
			try {
				if (StringUtils.isNotBlank(date)) {
					dd = fmt.parse(date);
					sql.append(string);
					args.add(dd);
				}
			} catch (ParseException e) {
				sql.append(" and 1 <> 1 ");
			}

		}
	}

	/**
	 * 按时间查询
	 */
	public static void dateTime(StringBuilder sql, List<Object> args, String date, String string) {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		if (StringUtils.isNotBlank(date)) {
			Date dd;
			try {
				if (StringUtils.isNotBlank(date)) {
					dd = fmt.parse(date);
					sql.append(string);
					args.add(dd);
				}
			} catch (ParseException e) {
				sql.append(" and 1 <> 1 ");
			}

		}
	}

	/**
	 * 多一天
	 */
	public static void addDate(StringBuilder sql, List<Object> args, String date, String string) {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		Calendar acl = Calendar.getInstance();

		if (StringUtils.isNotBlank(date)) {
			Date dd;
			try {
				dd = fmt.parse(date);
				acl.setTime(dd);
				acl.add(Calendar.DAY_OF_MONTH, 1); // 查询日期加一
				sql.append(string);
				args.add(acl.getTime());
			} catch (ParseException e) {

				sql.append(" and 1 <> 1 ");

			}

		}
	}

	/**
	 * 精确查询数据
	 */
	public static void queryData(StringBuilder sql, List<Object> args, String value, String field) {

		if (StringUtils.isNotBlank(value)) {
			sql.append(" AND " + field + " = ? ");
			args.add(value);
		}

	}
	
	/**
	 * 精确查询数据
	 */
	public static void queryData(StringBuilder sql, List<Object> args, Boolean value, String field) {

		if (value!=null) {
			sql.append(" AND " + field + " = ? ");
			args.add(value);
		}

	}
	
	/**
	 * 精确查询数据
	 */
	public static void queryData(StringBuilder sql, List<Object> args, Long value, String field) {
		
		if (value!=null) {
			sql.append(" AND " + field + " = ? ");
			args.add(value);
		}
		
	}
	
	/**
	 * 精确查询数据
	 */
	public static void queryData(StringBuilder sql, List<Object> args, Integer value, String field) {
		
		if (value!=null) {
			sql.append(" AND " + field + " = ? ");
			args.add(value);
		}
		
	}

	/**
	 * 精确查询数据
	 */
	public static void queryDate(StringBuilder sql, List<Object> args, Date date, String query) {
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = fmt.format(date);

		if (StringUtils.isNotBlank(dateString)) {
			sql.append(query);
			args.add(dateString);
		}

	}

	/**
	 * 精确查询数据
	 */
	public static void queryInteger(StringBuilder sql, List<Object> args, Integer value, String query) {

		if (value != null && StringUtils.isNotBlank(String.valueOf(value))) {
			sql.append(query);
			args.add(value);
		}
	}

	/**
	 * 精确查询数据
	 */
	public static void queryLong(StringBuilder sql, List<Object> args, Long value, String query) {

		if (value != null) {
			sql.append(query);
			args.add(value);
		}
	}

	/**
	 * 持续时间数据
	 */
	public static void queryDuration(StringBuilder sql, List<Object> args, String value, String query) {

		if (StringUtils.isNotBlank(value)) {

			sql.append(query);
			Double vale;
			try {

				vale = Double.parseDouble(value);
				Double s = vale * 1000;
				args.add(s.toString());

			} catch (Exception e) {
				sql.append("and 1=0 ");
				args.add(String.valueOf(1000000));

			}

		}

	}

	public static void setId(StringBuilder sql, List<Object> args, Integer date, String string)
			throws ParseException {

		if (StringUtils.isNotBlank(String.valueOf(date))) {
			sql.append(string);
			args.add(date);
		}
	}

	/* 多一天 */
	public static Date getAddDay(String date) throws ParseException {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		Calendar acl = Calendar.getInstance();

		acl.setTime(fmt.parse(date));
		acl.add(Calendar.DAY_OF_MONTH, 1);
		Date da = acl.getTime();

		return da;
	}

	/**
	 * 在那些之内 in 子句
	 * 
	 * @param sql
	 * @param params
	 * @param list
	 * @param query
	 */
	public static void in(StringBuilder sql, List<Object> args, Collection<String> list, String query) {
		if (list != null && list.size() > 0) {
			String[] param = new String[list.size()];
			Arrays.fill(param, "?");
			String inSql = Arrays.toString(param);
			sql.append(query + " in (" + inSql.substring(1, inSql.length() - 1) + ") ");
			args.addAll(list);
		}
	}

	// 这里返回的是一个String,在solution中使用的时候需要whereSql拼起来
	public static String inString(String query, List<Object> args, Collection<String> list) {
		if (list == null || list.size() == 0) {
			return " AND 1=2 ";
		}
		String[] param = new String[list.size()];
		Arrays.fill(param, "?");
		String inSql = Arrays.toString(param);
		args.addAll(list);
		return query + " IN (" + inSql.substring(1, inSql.length() - 1) + ")";
	}

	/**
	 * 查询时间范围
	 * 
	 * @param sql
	 * @param params
	 * @param subscribeTime
	 * @param field
	 */
	public static void queryDatetimeDuring(StringBuilder sql, List<Object> args, String subscribeTime,
			String field) {

		if (subscribeTime != null && subscribeTime.indexOf(" - ") > 0) {
			String[] duration = subscribeTime.split(" - ");
			sql.append(" AND " + field + " >= '" + duration[0] + "' AND " + field + " <= '" + duration[1] + "' ");
		}
	}
	
	/**
	 * 查询时间范围
	 * @param sql
	 * @param args
	 * @param startDatetimeValue
	 * @param endDatetimeValue
	 * @param field
	 */
	public static void queryDatetimeDuring(StringBuilder sql, List<Object> args, String startDatetimeValue, String endDatetimeValue, String field) {
		
		if (StringUtils.isNotBlank(startDatetimeValue.trim())) {
			sql.append(" AND " + field + " >= ? ");
			args.add(startDatetimeValue);
		}
		
		if (StringUtils.isNotBlank(endDatetimeValue.trim())) {
			sql.append(" AND " + field + " <= ? ");
			args.add(endDatetimeValue);
		}
		
		
	}

}
