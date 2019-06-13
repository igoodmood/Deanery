package com.company;

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

@WebServlet("/control_news")
public class Add_news extends HttpServlet {
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
        if ("Админ".equals(stata)) {
            String stre = "<table><th>№</th><th>День</th><th>Месяц</th><th>Заголовок</th><th>Содержание</th><th>Фото</th>";
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM news;";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    stre += "<tr><td align='center'>" + rs.getString(6) + "</td><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(3) + "</td><td align='center'>" + rs.getString(4) + "<td align='center'>" + "<img width='60%' height=auto src='" + rs.getString(5) + "'></td><td align='center'><a " + "id='dele_" + rs.getString(6) + "'" + " onclick='new_dele(this.id)' class='btn_news'>Удалить</a></td></tr>";
                }
                stre += "</table>";
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            req.setAttribute("newser", stre);
            req.setAttribute("username", r);
            req.setAttribute("stats", stata);
            req.getRequestDispatcher("WEB-INF/news_add.jsp").forward(req, resp);
        } else req.getRequestDispatcher("WEB-INF/error_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String day = req.getParameter("da");
        String month = req.getParameter("mo");
        String title = req.getParameter("tit");
        String photo = req.getParameter("ph");
        String context = req.getParameter("con");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO news " + "(day, month, title, content, image)" + " VALUES (" + "\'" + day + "\'" + ","  + "\'" + month + "\'"  + ","  + "\'" + title + "\'" + ","  + "\'" + context + "\'" + ","  + "\'" + photo + "\'" + ");";
            stmt.executeUpdate(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        doGet(req, resp);
    }
}
