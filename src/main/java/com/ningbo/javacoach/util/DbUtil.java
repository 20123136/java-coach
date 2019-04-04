package com.ningbo.javacoach.util;


import javax.persistence.Table;

/**
 * 访问数据库的工具。
 * 
 * 默认单租户模式
 * 
 * 1、单租户下获取某个数据库的某张表
 * `" + DbUtil.getDbname() + "`.`" + DbUtil.getTableName(EntityClassName.class) + "`
 * 
 * 2、多租户下获取某个数据库的某张表
 * `" + DbUtil.getDbname(tenantId) + "`.`" + DbUtil.getTableName(tenantId, EntityClassName.class) + "`
 * 
 * @author ZhangNa
 *
 * 2017年6月28日
 */
public class DbUtil {
	
	public static final Long DEFAULT_TEANT_ID = 0L;

	private static String defaultDbname = "defaultDbname";

	private static String tenantDbnamePerfix = "tenant_";

	/**
	 * 
	 * @param defaultDbname 在spring配置文件里传入这个值
	 * @param tenantDbnamePerfix 在spring配置文件里传入这个值
	 */
	public DbUtil(String defaultDbname, String tenantDbnamePerfix) {
		DbUtil.defaultDbname = defaultDbname;
		DbUtil.tenantDbnamePerfix = tenantDbnamePerfix;
	}

	/**
	 * 
	 * 返回租户管理程序的数据库名称
	 */
	public static String getDbname() {
		return defaultDbname;
	}
	
	
	/**
	 * 
	 * 返回具体租户的数据库名称
	 * 
	 * 如果是租户管理程序，就返回租户管理程序的数据库名称
	 * 
	 * 约定：租户数据库的名称为"${dbname}_${teandId}"<br>
	 * “租户管理程序”的tenantId固定为“0L”<br>
	 * 
	 * 只能在这里拼写数据库名称/schema名称字符串，<br>
	 * 
	 * 不允许在其他代码里直接拼写！！<br>
	 * 不允许在其他代码里直接拼写！！<br>
	 * 不允许在其他代码里直接拼写！！<br>
	 * 
	 * @param tenantId
	 * @return
	 */
	public static String getDbname(Long tenantId) {
		if (tenantId == DEFAULT_TEANT_ID) {
			return defaultDbname;
		} else {
			return tenantDbnamePerfix + tenantId;
		}
	}
	
	/**
	 * 
	 * 根据Entity类返回具体的表名（表名是通过@Table定义的）
	 * 
	 * @param entityClass
	 * @return
	 */
	public static <T> String getTableName(Class<T> entityClass) {
		return entityClass.getAnnotation(Table.class).name();
	};

	/**
	 * 
	 * 根据Entity类返回具体租户的表名（表名是通过@Table定义的），租户ID作为表的前缀
	 * 
	 * @param entityClass
	 * @return
	 */
	public static <T> String getTableName(Long tenantId, Class<T> entityClass) {
		return tenantId + "_" + entityClass.getAnnotation(Table.class).name();
	};
	
}
	
