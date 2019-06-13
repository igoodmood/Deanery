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
import java.util.ArrayList;

@WebServlet("/students")
public class Students extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        ArrayList<String> nums = logic.number_st();
        for (int i = 0; i < 5; i++) {
            req.setAttribute("c" + i, nums.get(i));
        }
        req.setAttribute("stats", stata);
        req.setAttribute("username", r);
        req.getRequestDispatcher("WEB-INF/potok_stud.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String sql = "";
        String course = req.getParameter("course");
        String gr = req.getParameter("groop");
        String select = "<label>" +
                "<select class='selectBox_" + course + "' onchange='changeFunc(" + course + ");'>" +
                "<option>Группа</option>" +
                "<option value='ПЗАС'>ПЗАС</option>" +
                "<option value='КН'>КН</option>" +
                "<option value='СУА'>СУА</option>" +
                "<option value='ИПЗ'>ИПЗ</option>" +
                "<option value='КСМ'>КСМ</option>" +
                "</select>" +
                "</label>";
        try {
            int counter = 1;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            if ("all".equals(gr) || "Группа".equals(gr)) sql = ("SELECT * FROM students WHERE course=" + course + " ORDER BY student_name;");
            else sql = ("SELECT * FROM students WHERE course=" + course + " and gryp='" + gr + "' ORDER BY student_name;");
            ResultSet rs = st.executeQuery(sql);
            String str = "<table class='responstable'><tr><th id='tcell'>№</th><th id='fcell'>Имя студента</th><th id='scell'>Курс</th><th id='tcell'>" + select + "</th></tr>";
            while (rs.next()) {
                str += "<tr><td align='center'>" + (counter++) + "</td><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(3) + "</td></tr>";
            }
            str += "</table>";
            out.println(str);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
