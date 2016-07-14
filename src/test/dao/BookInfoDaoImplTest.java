package test.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BookInfoDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"classpath:mall-servlet.xml" })
// @TestExecutionListeners(listeners={
// DependencyInjectionTestExecutionListener.class,
// TransactionalTestExecutionListener.class
// })
@Transactional
public class BookInfoDaoImplTest extends
		AbstractTransactionalJUnit4SpringContextTests {
	@Resource
	private BookInfoDao bookInfoDao;

	/**
	 * find
	 */
	@Test
	public void testFindNull() {
		assertEquals(null, bookInfoDao.find(12));
	}

	@Test
	public void testFind() {
		assertEquals(new Integer(1), bookInfoDao.find(1).getId());
	}

	/**
	 * findAll
	 */
	@Test
	public void testFindAll() {
		assertEquals(2, bookInfoDao.findAll().size());
	}
	/**
	 * findLike
	 */
	@Test
	public void testFindLike() {
		assertEquals(1, bookInfoDao.findLike("三").size());
	}

	@Test
	public void testFindLikeNone() {
		assertEquals(0, bookInfoDao.findLike("三1").size());
	}

	/**
	 * findByType
	 */
	@Test
	public void testFindByType() {
		assertEquals(3, bookInfoDao.findByType("人文社科").size());
	}
	
	@Test
	public void testFindBookFirstType(){
		int result=bookInfoDao.findBookFirstType().size();
		System.out.println("sizse="+result);
		assertEquals(4, result);
	}
}
