package com.dao;

import java.util.List;

import com.model.BookInfo;
import com.model.ReviewInfo;

/**
 * ��������
 * @author created by gjb on 6.25
 *
 */
public interface ReviewInfoDao {
	/**
	 * find review by userId whx
	 * @return
	 */
public List<ReviewInfo> findById(Integer id);
/**
 * find review by bookId whx
 * @param bookId
 * @return
 */
public List<ReviewInfo> findByBookId(Integer bookId);
public void saveReviewInfoInDB(ReviewInfo reviewInfo);
public void deleteReviewInfoInById(Integer id);
public int getBookNumByBookId(Integer bookId);

}
