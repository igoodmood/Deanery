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

@WebServlet("/answer")
public class Answer extends HttpServlet {
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
        String str = req.getParameter("id_us");
        if ("Сотрудник".equals(stata)) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM feedback WHERE id_fb=" + str + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    req.setAttribute("namer", rs.getString(1));
                    req.setAttribute("messag", rs.getString(3));
                }
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            req.setAttribute("username", r);
            req.setAttribute("stats", stata);
            req.getRequestDispatcher("WEB-INF/answer.jsp").forward(req, resp);
        } else req.getRequestDispatcher("WEB-INF/error_page.jsp").forward(req, resp);
    }
}
