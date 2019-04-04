package com.ningbo.javacoach.datatable;

import java.util.ArrayList;
import java.util.List;

public class DatatablesParams {
	
	private Integer draw = 0;
	private Integer length; //每页需要加载多少条数据
	private Integer start;//从第几条记录开始(limit start,length)
	
	private List<Column> columns = new ArrayList<>();
	private List<Order> order = new ArrayList<>();// 专用的 排序信息
	
	private Search search = new Search();
	
	
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
	public List<Order> getOrder() {
		return order;
	}
	public void setOrder(List<Order> order) {
		this.order = order;
	}
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}
	public Integer getDraw() {
		return draw;
	}
	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}

	
}
