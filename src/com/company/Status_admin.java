package com.company;

import com.sun.javafx.collections.MappingChange;

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

@WebServlet("/status")
public class Status_admin extends HttpServlet {
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
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM users;";
                ResultSet rs = st.executeQuery(sql);
                String stre = "<table><th>№</th><th>Логин</th><th>Текущий статус</th><th></th><th></th><th></th>";
                while (rs.next()) {
                    String admn = rs.getString(5).equals("Админ") ? "Текущий" : "Админ";
                    String sotr = rs.getString(5).equals("Сотрудник") ? "Текущий" : "Сотрудник";
                    String user = rs.getString(5).equals("Пользователь") ? "Текущий" : "Пользователь";
                    stre += "<tr><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(5) + "</td><td align='center'><a " + "id='admn_" + rs.getString(2) + "'" + " onclick='adm(this.id)' class='btn_admn'>" + admn + "</a></td><td align='center'><a " + "onclick='adm(this.id)' id='sotr_" + rs.getString(2) + "'" + " class='btn_sotr'>" + sotr + "</a></td><td align='center'><a " + "onclick='adm(this.id)' id='user_" + rs.getString(2) + "'" + " class='btn_user'>" + user + "</a></td></tr>";
                }
                stre += "</table>";
                con.close();
                req.setAttribute("resle_stud", stre);
                req.setAttribute("stats", stata);
                req.setAttribute("username", r);
            } catch (Exception e) {
                System.out.println(e);
            }
            req.getRequestDispatcher("WEB-INF/statuses.jsp").forward(req, resp);
        }
        else req.getRequestDispatcher("WEB-INF/error_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status_user = req.getParameter("stat");
        Map<String, String> map = new HashMap<>();
        map.put("admn", "Админ");
        map.put("sotr", "Сотрудник");
        map.put("user", "Пользователь");
        for (String str: map.keySet()) {
            if (str.equals(status_user)) {
                status_user = map.get(str);
                break;
            }
        }
        String id_user = req.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = "UPDATE users set status='" + status_user + "' WHERE id_user=" + id_user + ";";
            st.executeUpdate(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
