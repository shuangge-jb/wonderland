package test.service;

import static org.junit.Assert.*;

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

import com.dao.UserInfoDao;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class RegistServiceImplTest   extends AbstractTransactionalJUnit4SpringContextTests {
@Resource
	private UserInfoDao userInfoDao;
	@Test
	public void testIsUserNameExit() {
		System.out.println(userInfoDao.getUserByName("123"));
	}

}
