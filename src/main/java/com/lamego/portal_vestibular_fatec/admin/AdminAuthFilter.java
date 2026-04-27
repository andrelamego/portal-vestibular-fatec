package com.lamego.portal_vestibular_fatec.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class AdminAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();

        if (uri.startsWith("/admin/") && !uri.equals("/admin/login")) {
            HttpSession session = httpRequest.getSession(false);
            boolean autenticado = session != null
                    && Boolean.TRUE.equals(session.getAttribute("adminAutenticado"));

            if (!autenticado) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/login");
                return;
            }
        }

        chain.doFilter(request, response);
    }
}