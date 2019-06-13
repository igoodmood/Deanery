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

@WebServlet("/documents")
public class Document extends HttpServlet {
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
        String docs = "<table class='docer'><tr class='document'>";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = ("SELECT * FROM documents;");
            ResultSet rs = st.executeQuery(sql);
            int count = 5;
            int iter = 1;
            while (rs.next()) {
                if (iter < count) {
                    docs += "<th>" + "<a href='" + rs.getString(3) + "' target='_blank'>" + "<p><img src='pdf.png'></p>" + rs.getString(2) + "</a>" + "</th>";
                    iter += 1;
                }
                else {
                    docs += "</tr><tr class='document'>";
                    count *= 2;
                }
            }
            docs += "</tr>";
            docs += "</table>";
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        req.setAttribute("username", r);
        req.setAttribute("stats", stata);
        req.setAttribute("docs", docs);
        req.getRequestDispatcher("WEB-INF/docum.jsp").forward(req, resp);
    }
}
