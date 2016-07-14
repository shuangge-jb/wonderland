package com.service;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BookInfoDao;
import com.dao.CollectInfoDao;
import com.model.BookInfo;
import com.model.CollectInfo;
/**
 * 收藏夹管理类    whx
 * @author Administrator
 *
 */
@Service
public class CollectServiceImpl implements CollectService {
	@Resource
	private CollectInfoDao  collectinfoDao;
	@Resource
	private BookInfoDao  bookinfoDao;
	@Override
	public List<BookInfo> findCollectBookInfo(Integer userId) {
		List<CollectInfo>listCollect=collectinfoDao.findCollectBookInfo(userId);
		List<BookInfo>listBook=new LinkedList<BookInfo>();
		if(listCollect.size()>0){
			for(int i=0;i<listCollect.size();i++){
				BookInfo bookInfo=bookinfoDao.find(listCollect.get(i).getBookId());
				listBook.add(bookInfo);
			}
		}
		return listBook;
	}
	@Override
	public void deleteBookInCollect(Integer userId, Integer bookId) {
		collectinfoDao.deleteBookInCollect(userId, bookId);
	}
    
	@Override
	public void addBookToCollect(CollectInfo collectInfo) {
		collectinfoDao.addBookToCollect(collectInfo);

	}
	@Override
	public boolean isBookHasCollected(Integer userId, Integer bookId) {	
		return collectinfoDao.isBookHasCollected(bookId, userId);
	}

}
