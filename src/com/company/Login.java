package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/Login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logic logic = new logic();
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        String time_cookie = req.getParameter("time");
        logic lg = new logic();
        boolean rslt = lg.logreg("SELECT * FROM users WHERE login =" + "\'" + name + "\'" + "and password =" + "\'" + pass + "\'" + ";");
        if (rslt) {
            Cookie user = new Cookie("identification", logic.md5Custom(name));
            if (time_cookie.equals("false")) user.setMaxAge(60 * 60 * 12);
            resp.addCookie(user);
        }
        out.println(String.valueOf(rslt));
    }
}
