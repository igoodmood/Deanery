package com.company;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/letters")
public class Letters extends HttpServlet {
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
        if ("Сотрудник".equals(stata)) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM feedback;";
                ResultSet rs = st.executeQuery(sql);
                String stre = "<table id='messa'><th>Имя</th><th>Почта</th><th>Сообщение</th><th></th>";
                while (rs.next()) {
                    stre += "<tr><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(2) + "</td><td style='width:71vh' align='center'>" + rs.getString(3) + "</td><td align='center'><a " + "onclick='answr(this.id)' id='answ_" + rs.getString(4) + "'" + " class='btn_answ'>Отправить</a></td></tr>";
                }
                stre += "</table>";
                con.close();
                req.setAttribute("username", r);
                req.setAttribute("stats", stata);
                req.setAttribute("resle_stud", stre);
            } catch (Exception e) {
                System.out.println(e);
            }
            req.getRequestDispatcher("WEB-INF/letters.jsp").forward(req, resp);
        } else req.getRequestDispatcher("WEB-INF/error_page.jsp").forward(req, resp);
    }
}