package com.service;

import net.sf.json.JSONArray;
/**
 * whx 销量统计
 * @author Administrator
 *
 */
public interface SalesStasticService {
	/**
	 * 根据书一级分类，统计销量统计。 whx
	 * @param bookFirstType
	 * @return
	 */
	public int getSalesNumFromBookFirstType(String bookFirstType);
	/**
	 * 统计一级分类销量，返回json数组格式
	 * @return
	 */
	public JSONArray getAllClassNumRes();
	/**
	 * 返回销量总数
	 * @param A
	 * @return
	 */
	public int getTotalSalesBook(String []A);
}
