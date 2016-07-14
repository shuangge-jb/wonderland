package com.service;

import java.util.List;

import com.model.BookInfo;
import com.model.ReviewInfo;
import com.model.UserInfo;

/**
 * 书本评论相关接口  whx 
 * @author Administrator
 *
 */
public interface ReviewService {
	public List<ReviewInfo> findByUserName(String username);

	public List<ReviewInfo> findByBookId(Integer bookId);

	public void saveReviewInfoInDB(ReviewInfo reviewInfo);

	public void deleteReviewInfoInById(Integer id);

	public int getBookNumByBookId(Integer bookId);
	public List<BookInfo>findBookName(List<ReviewInfo>list);
	/**
	 * 根据评论者ID找出评论者信息 gjb
	 * 
	 * @param userId
	 * @return
	 */
	public UserInfo findReviewerByUserId(Integer userId);
}
