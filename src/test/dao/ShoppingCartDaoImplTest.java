package test.dao;

import static org.junit.Assert.*;

import java.io.Serializable;
import java.util.ArrayList;

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

import com.dao.ShoppingCartDao;
import com.model.ShoppingCart;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class ShoppingCartDaoImplTest extends
		AbstractTransactionalJUnit4SpringContextTests {
@Resource
private ShoppingCartDao shoppingCartDao;
	@Test
	public void testFindByUserId() {
		shoppingCartDao.findByUserId(1);
	}

	@Test
	public void testAddExisted() {
		assertEquals(true, shoppingCartDao.add(new ShoppingCart(1,1,1)) instanceof Serializable);
	}
	@Test
	public void testAddUnexisted() {
		assertEquals(true, shoppingCartDao.add(new ShoppingCart(12,123,1)) instanceof Serializable);
	}
	@Test
	public void testDelete() {
		shoppingCartDao.delete(new ShoppingCart(1,1,1));
	}
	@Test
	public void testFind() {
		assertEquals(new Integer(1),shoppingCartDao.findByUserId(1).get(0));
	}

}
