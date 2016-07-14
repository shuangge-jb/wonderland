package com.service;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.dao.OrderInfoDao;
import com.model.BookInfo;
import com.model.BookNum;
import com.model.OrderInfo;
@Service
public class SalesStasticServiceImpl implements SalesStasticService {
	@Resource
	private OrderInfoDao orderInfoDao;
	@Override
	public int getSalesNumFromBookFirstType(String bookFirstType) {
		List<OrderInfo>list=new ArrayList<OrderInfo>();
		for(int i=1;i<5;i++){
			list.addAll(orderInfoDao.findOrderHaspaid(i));
		}
		/*List<OrderInfo>list=orderInfoDao.findOrderHaspaid(1);*/
		int salesNum=0;
		if(list.size()>0){
		for(int i=0;i<list.size();i++){	
			Set<BookNum> bookNums=list.get(i).getBookNums();
	        Iterator whx=bookNums.iterator();
	        while(whx.hasNext()){
	        	BookNum bookNum=(BookNum) whx.next();
	        	if(bookNum.getBookInfo().getBookFirstType().equals(bookFirstType)){
	        		salesNum+=bookNum.getBookNum();
	        	}
	        }
		}
		}
		return salesNum;
	}
	public JSONArray getAllClassNumRes(){
		JSONArray whx=new JSONArray();
		String [] bookFirstClass={"童书","文艺","人文社科",
				"经管","教育","励志","科技","生活"
		};
		int total=this.getTotalSalesBook(bookFirstClass);
		System.out.println("total*******"+total);
		for(int i=0;i<bookFirstClass.length;i++){
			int j=0;
			j=this.getSalesNumFromBookFirstType(bookFirstClass[i]);
			JSONObject jo=new JSONObject();
			if(total!=0){
			jo.put("title", bookFirstClass[i]);
			jo.put("amount", String.valueOf((j*100/total)));
			whx.add(jo);
			}
		}	
		return whx;
	}
	public int getTotalSalesBook(String []A){
		int t=0;
		for(int i=0;i<A.length;i++){
			   t+=this.getSalesNumFromBookFirstType(A[i]);
			}
		return t;
	}
}
