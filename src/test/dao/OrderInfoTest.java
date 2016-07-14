package test.dao;

import static org.junit.Assert.*;

import java.security.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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

import com.dao.AddressDao;
import com.dao.OrderInfoDao;
import com.model.Address;
import com.model.BookNum;
import com.model.OrderInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
"classpath:mall-servlet.xml" })
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)
public class OrderInfoTest extends AbstractTransactionalJUnit4SpringContextTests{
	
	@Resource
	private OrderInfoDao orderInfoDao;
	@Resource 
	private AddressDao addressDao;
	

	@Test
	public void testFindAll() {
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(2016, 6, 1);
		Date begin = calendar.getTime();
		calendar.set(2016, 6, 5);
		Date end = calendar.getTime();
		System.out.println(begin);
		System.out.println(end);
		for(OrderInfo orderInfo:orderInfoDao.findBetween(begin, end)){
			System.out.println(orderInfo.getId());
		}

	}

}
