package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/abit")
public class Abitur extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logic logic = new logic();
        String r = null;
        String stata = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("identification")) {
                    boolean loged = logic.logreg("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    if (loged) {
                        r = logic.cheker("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                        stata = logic.status("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    }
                }
            }
        }
        req.setAttribute("username", r);
        req.setAttribute("stats", stata);
        req.getRequestDispatcher("WEB-INF/abitur.jsp").forward(req, resp);
    }
}
