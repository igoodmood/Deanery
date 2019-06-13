package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/Register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logic logic = new logic();
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("namer");
        String pass = req.getParameter("passer");
        String mail = req.getParameter("mail");
        logic lg = new logic();
        boolean rslt = lg.logreg("SELECT * FROM users WHERE login =" + "\'" + name + "\'" + ";");
        if (!rslt) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement stmt = con.createStatement();
                String sql = "INSERT INTO users " + "(login, password, email, status, md5)" + " VALUES (" + "\'" + name + "\'" + ","  + "\'" + pass + "\'" + ","  + "\'" + mail + "\'" + ","  + "\'" + "Пользователь" + "\'" + ","  + "\'" + logic.md5Custom(name) + "\'" + ");";
                stmt.executeUpdate(sql);
                out.println("written");
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        else out.println("error");
    }
}
