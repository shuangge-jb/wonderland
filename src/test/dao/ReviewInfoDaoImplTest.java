package test.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ReviewInfoDao;
import com.dao.ShoppingCartDao;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class ReviewInfoDaoImplTest extends AbstractJUnit4SpringContextTests {
	@Resource
	private ReviewInfoDao reviewInfoDao;
	@Test
	public void testFindByBookId() {
		assertEquals("好评", reviewInfoDao.findByBookId(1).get(0).getReviewContent());
	}

}
