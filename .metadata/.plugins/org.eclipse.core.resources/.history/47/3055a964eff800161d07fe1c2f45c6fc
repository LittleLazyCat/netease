package com.netease.course;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestData {

	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("application-context.xml");

		MybatisUserDao dao = context.getBean("mybatisUserDao", MybatisUserDao.class);
		List<User> userList = dao.getUserList();
		for (User user: userList) {
			System.out.println(user.getFirstName() + " " + user.getLastName());
		}
		
		User liLei = dao.getUser("Lei");
		System.out.println("getByFirstName: " + liLei.getFirstName() + " " + liLei.getLastName());

		((ConfigurableApplicationContext) context).close();
	}
}
