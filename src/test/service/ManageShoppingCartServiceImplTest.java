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

import com.service.ManageShoppingCartService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=true)
public class ManageShoppingCartServiceImplTest extends
		AbstractTransactionalJUnit4SpringContextTests {
@Resource
private ManageShoppingCartService manageShoppingCartService;
/**
 * find
 */
	@Test
	public void testFindExisted() {
		assertEquals(2, manageShoppingCartService.find("1").size());
	}
	@Test
	public void testFindUnexisted() {
		assertEquals(0, manageShoppingCartService.find("12").size());
	}
/**
 * add
 */
	@Test
	public void testAddBothExistedDuplicated() {
		assertEquals("已插入购物车" ,manageShoppingCartService.add("1", "1","1"));
	}
	@Test
	public void testAddBothExistedNotDuplicated() {
		assertEquals("添加成功" ,manageShoppingCartService.add("2", "1","1"));
	}
	@Test
	public void testAddSellOut() {
		assertEquals("库存不足" ,manageShoppingCartService.add("2", "2","1"));
	}
	@Test
	public void testAddUserUnexisted() {
		assertEquals("该用户不存在" ,manageShoppingCartService.add("12", "1","1"));
	}
	@Test
	public void testAddBookUnexisted() {
		assertEquals("该书不存在" ,manageShoppingCartService.add("1", "12","1"));
	}
	/**
	 * delete
	 */
	@Test
	public void testDeleteBothExisted() {
		assertEquals("删除成功" ,manageShoppingCartService.delete("1", "1"));
	}
	
	@Test
	public void testDeleteBookUnexisted() {
		assertEquals("该书不存在" ,manageShoppingCartService.delete("1", "12"));
	}
	/**
	 * numberAutoIncrement
	 */
	@Test
	public void testNumberAutoIncrementNotEnough(){
		//余量只有1本，购物车已经有1本，现在自增1
		assertEquals(false,manageShoppingCartService.numberAutoIncrement("1", "1"));
		
	}
	@Test
	public void testNumberAutoIncrementNull(){
		assertEquals(false,manageShoppingCartService.numberAutoIncrement("2", "1"));
	}
	
	/**
	 * 
	 */
	public void testNumberAutoDecrementOne(){
		assertEquals(false,manageShoppingCartService.numberAutoDecrement("1", "1"));
	}
	public void testNumberAutoDecrementCartNull(){
		assertEquals(false,manageShoppingCartService.numberAutoDecrement("2", "1"));
	}
}
