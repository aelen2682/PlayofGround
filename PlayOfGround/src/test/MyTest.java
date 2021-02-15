package test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mapper.BoardMapper;
import model.Page_User;
import model.Pagination;
import service.Page_UserSerivce;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/root-context.xml")
public class MyTest {

	@Autowired
	Page_UserSerivce pus;
	
	@Autowired
	BoardMapper mapper;
	
	@Test
	public void test() {
		//System.out.println(pus.Page_UserList());
		Pagination p = new Pagination();
//		
//		System.out.println(mapper.getBoardListCnt());
//		System.out.println(mapper.selectBoardList(0,4));
	}

	
}
