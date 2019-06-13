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

@WebServlet("/gallery")
public class Gallery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = ("SELECT * FROM photos;");
            ResultSet rs = st.executeQuery(sql);
            String photo = "<ul>";
            while (rs.next()) {
                photo +=
                        "<a href='#' class='close'></a>" +
                        "<li>" +
                            "<a class='image' href='#" + rs.getString(1) + "'>" +
                                "<img id='image_" + rs.getString(1) +"' src='" + rs.getString(2) + "' >" +
                            "</a>" +
                        "</li>";
            }
            photo += "</ul>";
//            out.println(photo);
            con.close();
            req.setAttribute("photos", photo);
        } catch (Exception e) {
            System.out.println(e);
        }
        String[] arrs = getParam(req, resp);
        req.setAttribute("username", arrs[0]);
        req.setAttribute("stats", arrs[1]);
        req.getRequestDispatcher("WEB-INF/Gallery.jsp").forward(req, resp);
    }

    private String getLogin(HttpServletRequest req, HttpServletResponse resp)
    {
        logic logic = new logic();
        String r = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("identification")) {
                    boolean loged = logic.logreg("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    if (loged) {
                        r = logic.cheker("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    }
                }
            }
        }
        return r;
    }

    private String[] getParam(HttpServletRequest req, HttpServletResponse resp)
    {
        logic logic = new logic();
        String[] ar = new String[3];
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("identification")) {
                    boolean loged = logic.logreg("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    if (loged) {
                        ar[0] = logic.cheker("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                        ar[1] = logic.status("SELECT * FROM users WHERE md5 =" + "\'" + cookie.getValue() + "\'" + ";");
                    }
                }
            }
        }
        return ar;
    }

    private void commenr(String phto, String comment, String namer) {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO comments " + "(username, content, id_photo)" + " VALUES (" + "\'" + namer + "\'" + ","  + "\'" + comment + "\'" + ","  + "\'" + phto + "\'" + ");";
            stmt.executeUpdate(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void load_comm(String photy, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String resl = "";
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM comments WHERE id_photo=" + photy + ";";
            ResultSet rs = st.executeQuery(sql);
            resl += "<table>";
            while (rs.next()) {
                int r = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                int g = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                int b = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                resl += "<tr><td style='background: -webkit-linear-gradient(45deg, rgba(" + r + ", " + g + ", " + b + ", 0.6) 0%, #0E5DC4 100%);" +
                        "-webkit-background-clip: text;" +
                        "-webkit-text-fill-color: transparent;' id='scell'>" + rs.getString(2) + "</td><td id='fcell'>―</td><td id='tcell'>" + "\"" + rs.getString(3) + "\"" + "</td></tr>";
            }
            resl += "</table>";
            out.println(resl);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String act = req.getParameter("action");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        if (act == null) {
            String photo = req.getParameter("id_ph");
            String resl = "";
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM photos WHERE id_photo=" + photo + ";";
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    resl = rs.getString(3) + "|" + rs.getString(4);
                }
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM comments WHERE id_photo=" + photo + ";";
                ResultSet rs = st.executeQuery(sql);
                resl += "[comm]<table>";
                while (rs.next()) {
                    int r = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                    int g = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                    int b = ThreadLocalRandom.current().nextInt(0, 180 + 1);
                    resl += "<tr><td style='background: -webkit-linear-gradient(45deg, rgba(" + r + ", " + g + ", " + b + ", 0.6) 0%, #0E5DC4 100%);" +
                            "-webkit-background-clip: text;" +
                            "-webkit-text-fill-color: transparent;' id='scell'>" + rs.getString(2) + "</td><td id='fcell'>―</td><td id='tcell'>" + "\"" + rs.getString(3) + "\"" + "</td></tr>";
                }
                resl += "</table>";
                out.println(resl);
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        else if (act.equals("add")) {
            String id_p = req.getParameter("id_ph");
            String com = req.getParameter("comm");
            try {
                boolean check = true;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM comments WHERE id_photo=" + id_p + ";";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    if (rs.getString(2).equals(getLogin(req, resp)) && rs.getString(3).equals(com)) {
                        out.println("Exist!");
                        check = false;
                    }
                }
                if (check) {
                    commenr(id_p, com, getLogin(req, resp));
                    load_comm(id_p, req, resp);
                }
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
}
