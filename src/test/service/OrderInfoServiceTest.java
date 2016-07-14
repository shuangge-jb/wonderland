package test.service;

import static org.junit.Assert.*;

import java.security.Timestamp;
import java.util.Calendar;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
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

import com.model.OrderInfo;
import com.service.OrderInfoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)
public class OrderInfoServiceTest extends AbstractTransactionalJUnit4SpringContextTests {

	@Resource
	private OrderInfoService orderInfoservice;

	@Test
	public void test() {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(2016, 5, 1);
		System.out.println(calendar.getTime());
		java.sql.Timestamp timeStamp = new java.sql.Timestamp(calendar.getTimeInMillis());
		System.out.println(timeStamp);
		System.out.println(orderInfoservice.getOrderInfoList(123).get(2).getPubTime());
	}

}
