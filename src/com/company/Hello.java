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
import java.util.concurrent.ThreadLocalRandom;

@WebServlet("/main")
public class Hello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] ar = get_val(req, resp);
        logic logic = new logic();
        req.setAttribute("number", logic.get_numstud());
        req.setAttribute("username", ar[0]);
        req.setAttribute("stats", ar[1]);
        req.getRequestDispatcher("WEB-INF/important.jsp").forward(req, resp);
    }

    private String[] get_val(HttpServletRequest req, HttpServletResponse resp) {
        logic logic = new logic();
        String[] arrs = new String[3];
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("identification")) {
                    boolean loged = logic.logreg("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    if (loged) {
                        arrs[0] = logic.cheker("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                        arrs[1] = logic.status("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    }
                }
            }
        }
        return arrs;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String str = req.getParameter("fio");
        try {
            int counter = 1;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM students WHERE student_name LIKE " + "\'%" + str + "%\'" + ";";
            ResultSet rs = st.executeQuery(sql);
            String stre = "<table class='responstable'><tr><th id='tcell'>№</th><th id='fcell'>Имя студента</th><th id='scell'>Курс</th><th id='tcell'>Группа</th></tr>";
            while (rs.next()) {
                stre += "<tr><td align='center'>" + (counter++) + "</td><td align='center'>" + rs.getString(1) + "</td><td align='center'>" + rs.getString(2) + "</td><td align='center'>" + rs.getString(3) + "</td></tr>";
            }
            stre += "</table>";
            if (stre.length() == 148){
                stre = "<div align='center'><img src='http://localhost:8080/css/noresult.png'></div>";
            }
            con.close();
            String[] ar2 = get_val(req, resp);
            req.setAttribute("username", ar2[0]);
            req.setAttribute("stats", ar2[1]);
            req.setAttribute("resle_stud", stre);
            req.setAttribute("namer", str);
            req.getRequestDispatcher("WEB-INF/resl_stud.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
