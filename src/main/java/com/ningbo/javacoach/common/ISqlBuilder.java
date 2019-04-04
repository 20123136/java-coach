package com.ningbo.javacoach.common;

import java.util.List;

/**
 * 
 * @author jiang
 *
 * @param <T> 杩欎釜T鏄竴涓狿OJO锛岀敤浜庤〃杈緎ql where鍚庣殑鏉′欢
 */
public interface ISqlBuilder<T> {

	/**
	 * 鎸夊墠绔殑鏉′欢鏌ヨ鐨剆ql
	 * @param commParams
	 * @param viewBean
	 * @return
	 */
	public SqlAndParams buildQuerySql(CommRequestParams commParams, T viewBean);
	
	/**
	 * 缁熻绗﹀悎鏉′欢鐨勮褰曟暟鏄灏�
	 * @param commParams
	 * @param viewBean
	 * @return
	 */
	public SqlAndParams buildCountSql(CommRequestParams commParams, T viewBean);
	
	/**
	 * 鎸夊墠绔殑鏉′欢杩涜鍏ㄩ�夋搷浣滄椂缁熻鎵�鏈夎鎵撻挬鐨刬dList
	 * @param viewBean
	 * @return
	 */
	public SqlAndParams buildCheckedIdListSql(T viewBean);
	
	/**
	 * 鎷兼帴where鏉′欢鐨剆ql銆備竴鑸儏鍐典笅璇ユ帴鍙ｄ腑鐨勫叾浠栧嚑涓柟娉曞唴閮ㄤ細鐢ㄥ埌璇ユ柟娉�
	 * @param sql
	 * @param args
	 * @param viewBean
	 */
	public void buildWhereSql(StringBuilder sql, List<Object> args, T viewBean);
	
	/**
	 * 鎷兼帴 order by 鐨剆ql銆備竴鑸儏鍐典笅璇ユ帴鍙ｄ腑闄uildCountSql()澶栫殑鍏朵粬鍑犱釜鏂规硶鍐呴儴浼氱敤鍒拌鏂规硶
	 * @param commParams
	 * @param sql
	 * @param args
	 */
	public void buildOrderBySql(CommRequestParams commParams, StringBuilder sql, List<Object> args);
	
	/**
	 * 鎷兼帴 limit ? offset ? 鐨剆ql銆�
	 * @param commParams
	 * @param sql
	 * @param args
	 */
	public void buildLimitOffsetSql(CommRequestParams commParams, StringBuilder sql, List<Object> args);
}

