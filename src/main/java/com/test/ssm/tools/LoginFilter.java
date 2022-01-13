package com.test.ssm.tools;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @className: LoginFilter
 * @program: Yue-resume
 * @description: // 登录过滤器
 * @author: GirtSeanking
 * @create: 2022-01-05 22:03
 **/

public class LoginFilter implements Filter {

    private String encoding = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        if (session.getAttribute("user")==null
                && request.getRequestURI().indexOf("/index") == -1) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    public void destroy() {

    }

}
