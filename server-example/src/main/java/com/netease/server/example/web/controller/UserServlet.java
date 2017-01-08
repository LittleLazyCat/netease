package com.netease.server.example.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 *
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 4607606190625660785L;

	/**
	 * Logger for this class.
	 */
	private static Logger logger = Logger.getLogger(UserServlet.class);

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.info("UserServlet post method is invoked.");
		response.setContentType("text/html;charset=UTF-8");
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");

		HttpSession session = request.getSession();
		session.setAttribute("userPsw", userPassword);
		//String psw = (String) session.getAttribute("userPsw");

		Cookie userNameCookie = new Cookie("userName", userName);
		// 设置cookie存在30分钟
		userNameCookie.setMaxAge(30 * 60);
		response.addCookie(userNameCookie);

		// 用于暂时存储cookie中的用户名
		String tempName = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// 判断用户是否为第二次登录,以及获取cookie中的userName的值
				if ("userName".equals(cookie.getName())) {
					tempName = cookie.getValue();
					session.invalidate();
				}
			}
		}

		try {
			if (userName.equals(tempName)) {
				PrintWriter writer = response.getWriter();
				writer.println("<html>");
				writer.println("<head><title>用户中心</title></head>");
				writer.println("<body>");
				writer.println("<p>用户名：" + userName + "</p>");
				writer.println("<p>用户密码：" + userPassword + "</p>");
				writer.println("</body>");
				writer.println("</html>");
				writer.close();
			} else if (userName == "") {
				dispatcher = request.getRequestDispatcher("/error.html");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			dispatcher = request.getRequestDispatcher("/error.html");
			dispatcher.forward(request, response);
		}

	}
}
