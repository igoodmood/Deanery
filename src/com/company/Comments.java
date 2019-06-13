package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/comments")
public class Comments extends HttpServlet {
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
            req.setAttribute("resle_stud", get_comm());
            req.setAttribute("username", r);
            req.setAttribute("stats", stata);
            req.getRequestDispatcher("WEB-INF/comments.jsp").forward(req, resp);
        } else req.getRequestDispatcher("WEB-INF/error_page.jsp").forward(req, resp);
    }

    private String get_comm() {
        String stre = "<table><th>№</th><th>Логин пользователя</th><th>Текст</th><th>ID фото</th>";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM comments;";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                stre += "<tr><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(3) + "</td><td align='center'>" + rs.getString(4) + "</td><td align='center'><a " + "id='dele_" + rs.getString(1) + "'" + " onclick='delere(this.id)' class='btn_dele'>Удалить</a></td></tr>";
            }
            stre += "</table>";
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return stre;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String dele_id = req.getParameter("dele");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            PreparedStatement st = con.prepareStatement("DELETE FROM comments WHERE id_comm=?;");
            st.setString(1, dele_id);
            st.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        out.println(get_comm());
    }
}

