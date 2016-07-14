package test.dao;

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

import com.dao.UserInfoDao;
import com.model.UserInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})

@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class UserInfoDaoImplTest extends AbstractTransactionalJUnit4SpringContextTests {
	@Resource
	private UserInfoDao userInfoDao;

	@Test
	public void testDelete() {
		UserInfo user=userInfoDao.getUserByName("123");
		userInfoDao.delete(user);
	}
	@Test
	public void  testGetUserByName(){
		UserInfo user=userInfoDao.getUserByName("123");
		assertEquals("123", user.getUsername());
	}
	@Test
	public void testFind(){
		assertEquals("123",userInfoDao.find(1).getName());
	}
	@Test
	public void testGetPassword(){
		assertEquals("123",userInfoDao.find(1).getPassword());
	}

}
