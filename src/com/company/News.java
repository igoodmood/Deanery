package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/news")
public class News extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = ("SELECT * FROM news;");
            ResultSet rs = st.executeQuery(sql);
            String news = "";
            while (rs.next()) {
                news += "<div class=\"news-slider__item swiper-slide\">" +
                        "<a href=\"#\" class=\"news__item\">" +
                        "<div class=\"news-date\">" +
                        "<span class=\"news-date__title\">" + rs.getString(1) + "</span>" +
                        "<span class=\"news-date__txt\">" + rs.getString(2) + "</span>" +
                        "</div>" +
                        "<div class=\"news__title\">" + rs.getString(3) +
                        "</div>" +
                        "<p class=\"news__txt\">" + rs.getString(4) + "</p>" +
                        "<div class=\"news__img\">" +
                        "<img src=\"" + rs.getString(5) + "\"" +
                        "alt=\"news\">" +
                        "</div>" +
                        "</a>" +
                        "</div>";
            }
//            out.println(news);
            con.close();
            req.setAttribute("news", news);
        } catch (Exception e) {
            System.out.println(e);
        }
        logic logic = new logic();
        String r = null;
        String stata = "";
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
        req.setAttribute("stats", stata);
        req.setAttribute("username", r);
        req.getRequestDispatcher("WEB-INF/news.jsp").forward(req, resp);
    }
}
