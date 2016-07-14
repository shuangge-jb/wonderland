package test.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import com.model.BookInfo;
import com.service.ManageBookService;
import com.service.ReviewService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:mall-servlet.xml"})
@TestExecutionListeners(listeners={
DependencyInjectionTestExecutionListener.class,
TransactionalTestExecutionListener.class
})
@Transactional
public class ShowBookServiceImplTest   extends AbstractTransactionalJUnit4SpringContextTests {
@Resource
private ManageBookService showBookService;
@Resource
private ReviewService reviewService;
	@Test
	public void testFindReview() {
		//assertEquals("",JSONArray.fromObject(showBookService.find("1")).toString());
	}
	@Test
	public void testFindLikeAllType(){
		List<BookInfo>list=showBookService.findLike("三","");
		System.out.println(list.get(0).getBookName());
		assertEquals(1,list.size());
	}
	@Test
	public void testFindLikeType(){
		List<BookInfo>list=showBookService.findLike("三","人文社科");
		System.out.println(list.get(0).getBookName());
		assertEquals(1,list.size());
	}
	@Test
	public void test(){
		System.out.println(reviewService.findReviewerByUserId(4).getUsername());
	}
}
