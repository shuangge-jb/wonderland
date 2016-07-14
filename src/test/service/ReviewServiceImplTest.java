package test.service;

import static org.junit.Assert.*;

import com.dao.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.model.BookInfo;
import com.model.ReviewInfo;
import com.model.UserInfo;
import com.service.ReviewService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
public class ReviewServiceImplTest extends AbstractTransactionalJUnit4SpringContextTests{
    @Resource
	private ReviewService reviewService;
   
    @Resource
    private ReviewInfoDao reviewInfoDao;
    
    @Resource
    private BookInfo bookInfoDao;
	

	public BookInfo getBookInfoDao() {
		return bookInfoDao;
	}

	public void setBookInfoDao(BookInfo bookInfoDao) {
		this.bookInfoDao = bookInfoDao;
	}

	public ReviewService getReviewService() {
		return reviewService;
	}

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	@Test
	public void testFindReviewerByUserName() {
		List<ReviewInfo> list=reviewService.findByUserName("123");	
		assertEquals("",list.get(0).getReviewContent());
		assertEquals("",list.get(1).getReviewContent());
		
	}
	@Test
	public void testFindByBookId(){
		List<ReviewInfo> list=reviewService.findByBookId(new Integer(1));
		assertEquals(1, list.size());
	}
	@Test
	public void testFindBookName(){
		List<ReviewInfo> list=new ArrayList();
		assertEquals(null,list);
		
		
	}

	public ReviewInfoDao getReviewInfoDao() {
		return reviewInfoDao;
	}

	public void setReviewInfoDao(ReviewInfoDao reviewInfoDao) {
		this.reviewInfoDao = reviewInfoDao;
	}
}
