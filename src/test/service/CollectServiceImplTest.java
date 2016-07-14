package test.service;
import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import com.model.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.service.CollectService;
import com.service.LoginService;
import com.service.LoginServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"classpath:mall-servlet.xml" })
@TestExecutionListeners(listeners = {
		DependencyInjectionTestExecutionListener.class,
		TransactionalTestExecutionListener.class })
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class CollectServiceImplTest extends
AbstractTransactionalJUnit4SpringContextTests{
	@Resource
	private CollectService cs;
	
	@Test
	public void testFindCollectBookInfo(){
		List<BookInfo> book=cs.findCollectBookInfo(1);
		
		//id=0 的用户收藏的书只有一本，《三国演义》
		assertEquals("《三国演义》",book.get(0).getBookName());
		assertEquals(1,book.size());
		//id=1的用户收藏的书没有，长度为0
		List<BookInfo> book1=cs.findCollectBookInfo(2);
		assertEquals(0,book1.size());
		
	}
	
	
}
