package com.vesperia.bbs;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBootBbsExampleApplicationTests {

	@Autowired
	private DataSource ds;
	
	@Test
	public void contextLoads() {
	}

	@Test
	public void testConnection() throws Exception {
		System.out.println("ds : " + ds);
		Connection con = ds.getConnection();
		System.out.println("con : " + con);
		con.close();
	}
}

