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

@WebServlet("/reports")
public class Reports extends HttpServlet {
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
        req.setAttribute("resle_deduct", get_resl("SELECT * FROM deduction;"));
        req.getRequestDispatcher("WEB-INF/deduction.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String select = req.getParameter("select");
        if (select.equals("all")) out.println(get_resl("SELECT * FROM deduction;"));
        if (select.equals("dr")) out.println(get_resl("SELECT * FROM deduction WHERE reason='Собственное желание';"));
        if (select.equals("bl")) out.println(get_resl("SELECT * FROM deduction WHERE reason='Академическая неуспеваемость';"));
    }

    private String get_resl(String sql) {
        String stre = "<table class='responstable'><th>№</th><th>Имя студента</th><th>Группа</th><th>Курс</th><th>Причина</th>";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int count = 1;
            while (rs.next()) {
                stre += "<tr><td align='center'>" + (count++) + "</td><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(3) + "</td><td align='center'>" + rs.getString(4) + "</td><td align='center'>" + rs.getString(5) + "</td></tr>";
            }
            stre += "</table>";
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return stre;
    }
}
