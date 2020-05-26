package com.example.demo.interceptor;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.entity.User;
import com.example.demo.util.JWTUtil;
import com.example.demo.util.SessionUtil;
import com.example.demo.util.StringUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;

/**
 * 登录拦截器<br>
 * 需要在springmvc中配置
 * 
 * @author: 王越
 * @date: 2019年5月28日 下午3:11:04
 */
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * 该方法将在请求处理之前进行调用
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
//		return checkPage(request, response, object);
		return true;
	}

	/**
	 * 检查当前用户是否拥有访问指定页面的权限
	 * 
	 * @param request
	 * @param response
	 * @param object
	 * @return
	 * @throws Exception
	 */
	private boolean checkPage(HttpServletRequest request, HttpServletResponse response, Object object)
			throws Exception {
		// 判断设备类型
//		String[] deviceArray = new String[] { "Android", "mac os", "windows phone" };
//		String type = request.getHeader("user-agent");
//		for (int i = 0; i < deviceArray.length; i++) {
//			if (type.indexOf(deviceArray[i]) > 0) {
//				return true;
//			}
//		}

		// 获取用户IP地址
//		log.debug("getIp:" + request.getRemoteAddr());
//		log.debug("getIpAddr:" + WebServletUtil.getIpAddr(request));
//		log.debug("getRemoteAddr:" + WebServletUtil.getRemoteAddr(request));
//		log.debug("getClientIpAddr:" + WebServletUtil.getClientIpAddr(request));
//		log.debug("getClientIpAddress:" + WebServletUtil.getClientIpAddress(request));

		// 主机地址
		String host = "http://127.0.0.1:8080/";
		
//		String host = "http://112.86.129.73:2000/";

		// 只有通过链接访问当前页的时候，才能获取上一页的地址；
		String refererUrl = request.getHeader("Referer");
		// 除去host和工程名部分的路径
		String servletPath = request.getServletPath();

		// 不需要拦截的基础资源
		String[] basePathString = { "/favicon.ico", "/public/iview-3.3.3/iview.min.js.map" };
		List<String> basePathList = Arrays.asList(basePathString);
		/*
		 * 1、放行登录页面的请求 2、放行错误页面 3、放行layout-组件，即页头、页尾和侧边导航栏 4、放行不需要拦截的页面或资源
		 */
		boolean isNotNeedIntercept = (servletPath.startsWith("/account/login") || servletPath.startsWith("/layout")
				|| servletPath.startsWith("/err") || servletPath.startsWith("/error")
				|| basePathList.contains(servletPath));
		if (isNotNeedIntercept) {
			return true;
		}
		// 根据用户权限判断是否可以请求当前页面
		String authorityUrl = "";
		// 获取上级地址，说明是直接使用url访问或者从登录页面
		if (refererUrl == null || host.equals(refererUrl) || (host + "login").equals(refererUrl)) {
			// 此时的权限路径等于请求路径
			authorityUrl = servletPath;
		} else {
			// 此处为具体页面中ajax或其他请求；浏览器上级页面地址不为空，即从页面发起的请求，根据用户权限判断是否可以请求
			authorityUrl = refererUrl.substring(host.length() - 1);
		}
		// springmvc的视图跳转后缀
		String suffix = ".html";
		// 如果是试图跳转的请求，就将其转化为页面
		if (authorityUrl.endsWith(suffix)) {
			authorityUrl = StringUtil.underscoreName(authorityUrl, suffix);
		}
		// 从cookie中获取token
		Cookie[] cookies = request.getCookies();
		String token = "";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				switch (cookie.getName()) {
				case "Authorization":
					token = cookie.getValue();
				default:
					break;
				}
			}
			log.info("cookie-token:" + token);
		}

		// 根据token中的信息判断是否登录，和页面权限
		Boolean isPass = checkToken(request, response, token, host, authorityUrl);
		if (isPass) {
			// token校验没有问题，更新token,返回值为刷新后的token
			token = JWTUtil.refreshToken(token);
			// token不为空，代表需要刷新，并将刷新后的token传回前端
			if (token != null) {
				log.info("new-token:" + token);
				response.addHeader("TOKEN", token);
			}
		}

//		 从cookies中获取信息
//		String cookies2 = request.getHeader("Cookie");
//		log.info("Cookie:" + cookies2);

		return isPass;
	}

	/**
	 * 根据token中的信息判断是否登录，和页面权限
	 * 
	 * @param request
	 * @param response
	 * @param token
	 * @param host
	 * @param authorityUrl
	 * @return
	 * @throws IOException
	 */
	private Boolean checkToken(HttpServletRequest request, HttpServletResponse response, String token, String host,
			String authorityUrl) throws IOException {
		// token是否有效
		boolean isTokenFailure = (token == null || "null".equals(token) || JWTUtil.isFailure(token));
		if (isTokenFailure) {
			// token过期
			log.info("token为空或者过期,重定向登录页面");
			// 对于请求是ajax请求重定向问题的处理方法
			// 如果request.getHeader("X-Requested-With") 返回的是"XMLHttpRequest"说明就是ajax请求，需要特殊处理
			if ("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
				// 告诉ajax我是重定向
				response.addHeader("REDIRECT", "REDIRECT");
				// 告诉ajax我重定向的路径
				response.addHeader("CONTENTPATH", host);
				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				response.flushBuffer();
			} else {
				response.sendRedirect(host);
			}
			return false;
		}
		// 解析token
		Claims claims = JWTUtil.parseJWT(token);
		// 获取用户对应的子菜单页面权限
		List<String> menuNameList = JWTUtil.getMenuNameList(claims);
		if (!menuNameList.contains(authorityUrl)) {
			log.info("没有此页面权限,重定向登录页面");
			response.sendRedirect(host + "error/403");
			return false;
		}
		return true;
	}

	/**
	 * 根据用户session检查是否登录，和页面权限
	 * 
	 * @param request
	 * @param response
	 * @param url
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean checkSession(HttpServletRequest request, HttpServletResponse response, String url)
			throws Exception {
		// 获取用户session
		User user = SessionUtil.getUser();
		if (user == null) {
			log.info("seesion为空，重定向登录页面");
			response.sendRedirect("http://127.0.0.1:8080/");
			return false;
		}
		// 获取用户对应的子菜单页面权限
		List<String> menuNameList = SessionUtil.getMenuNameList();
		// 如果当前用户没有请求路径页面的权限，重定向到登录页面
		if (!menuNameList.contains(url)) {
			log.info("没有此页面权限,重定向登录页面");
			response.sendRedirect("http://127.0.0.1:8080/");
			return false;
		}
		return true;
	}

	/**
	 * 需要当前对应的Interceptor 的preHandle 方法的返回值为true 时才会执行<br>
	 * 在当前请求进行处理之后，也就是Controller 方法调用之后执行，但是它会在DispatcherServlet 进行视图返回渲染之前被调用<br>
	 * 所以我们可以在这个方法中对Controller 处理之后的ModelAndView 对象进行操作。
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView mav)
			throws Exception {
	}

	/**
	 * 需要当前对应的Interceptor 的preHandle 方法的返回值为true 时才会执行<br>
	 * 该方法将在整个请求结束之后，也就是在DispatcherServlet 渲染了对应的视图之后执行。<br>
	 * 这个方法的主要作用是用于进行资源清理工作的。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception e)
			throws Exception {

	}

}
