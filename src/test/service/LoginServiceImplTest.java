package test.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

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
public class LoginServiceImplTest extends
		AbstractTransactionalJUnit4SpringContextTests {
	@Resource
	private LoginService loginService;

	@Test
	public void testDelete() {
		loginService.delete("123");
	}

	@Test
	public void testGetUserByName() {
		assertEquals(new Integer(1), loginService.getUserByName("123").getId());
	}

	@Test
	public void testIsPasswordCorrectUserIncorrect() {
		assertEquals(LoginService.INCORRECT,
				loginService.isPasswordCorrect("ad", "123"));
	}
	@Test
	public void testIsPasswordCorrectUserNull(){
		assertEquals(LoginService.INCORRECT,
				loginService.isPasswordCorrect(null, "123"));
	}
	@Test
	public void testIsPasswordCorrectPasswordNull(){
		assertEquals(LoginService.INCORRECT,
				loginService.isPasswordCorrect("321123", null));
	}
	@Test
	public void testIsPasswordCorrectPasswordWrong(){
		assertEquals(LoginService.INCORRECT,
				loginService.isPasswordCorrect("321123", "123455"));
	}
	@Test
	public void testIsPasswordCorrectAllWrong(){
		assertEquals(LoginService.INCORRECT,
				loginService.isPasswordCorrect("as", "123455"));
	}
	@Test
	public void testIsUsernameExistedTrue() {
		assertEquals(LoginService.UNEXISTED,
				loginService.isUsernameExisted("1"));
	}
	@Test
	public void testIsUsernameExistedFalse() {
		assertEquals(LoginService.UNEXISTED,
				loginService.isUsernameExisted("1"));
	}
	@Test
	public void testIsUsernameExistedNull(){
		assertEquals(LoginService.UNEXISTED,
				loginService.isUsernameExisted(null));
	}
}
