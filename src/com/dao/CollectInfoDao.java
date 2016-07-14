package com.dao;

import java.util.List;

import com.model.BookInfo;
import com.model.CollectInfo;

public interface CollectInfoDao {
	/**
	 * 通过用户Id 查询Ta的收藏  whx
	 * @param userId
	 * @return
	 */
  public List<CollectInfo> findCollectBookInfo(Integer userId);
  /**
   * 通过用户Id和 BooKId 删除收藏夹的书。 whx
   * @param userId
   * @param bookId
   */
  public void deleteBookInCollect(Integer userId,Integer bookId);
  /**
   * 把书添加到收藏夹    whx
   * @param collectInfo
   */
  public void addBookToCollect(CollectInfo collectInfo);
  /**
   * 判断该书是否已经收藏过  whx
   * @param bookId
   * @param userId
   * @return
   */
  public boolean isBookHasCollected(Integer bookId,Integer userId);
}
