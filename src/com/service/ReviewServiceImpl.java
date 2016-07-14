package com.service;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BookInfoDao;
import com.dao.ReviewInfoDao;
import com.dao.UserInfoDao;
import com.model.BookInfo;
import com.model.ReviewInfo;
import com.model.UserInfo;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
    private UserInfoDao userInfoDao;
	@Resource
	private BookInfoDao bookInfoDao;
	@Resource
    private ReviewInfoDao reviewInfoDao;
	@Override
	public List<ReviewInfo> findByUserName(String username) {
		Integer id=userInfoDao.getUserId(username);
		return reviewInfoDao.findById(id);
	}
	@Override
	public void saveReviewInfoInDB(ReviewInfo reviewInfo) {
		reviewInfoDao.saveReviewInfoInDB(reviewInfo);	
	}
	@Override
	public void deleteReviewInfoInById(Integer id) {
		reviewInfoDao.deleteReviewInfoInById(id);		
	}
	@Override
	public List<ReviewInfo> findByBookId(Integer bookId) {	
		return reviewInfoDao.findByBookId(bookId) ;
	}
	@Override
	public int getBookNumByBookId(Integer bookId) {
		// TODO Auto-generated method stub
		return reviewInfoDao.getBookNumByBookId(bookId);
	}
	@Override
	public UserInfo findReviewerByUserId(Integer userId) {	
		return userInfoDao.find(userId);
	}
	@Override
	public List<BookInfo> findBookName(List<ReviewInfo> list) {
	   if(list.size()<=0){
		return null;
	   }
	   else{
		   List<BookInfo>bookList=new LinkedList<BookInfo>();
		   for(int i=0;i<list.size();i++){
			   BookInfo bookInfo=bookInfoDao.find(list.get(i).getBookId()); 
			   bookList.add(bookInfo);
		   }
		   return bookList;
	   }
	}
	
	
}
