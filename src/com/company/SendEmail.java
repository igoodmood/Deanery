package com.company;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;

@WebServlet(name = "SendEmail", urlPatterns = {"/SendEmail"})
public class SendEmail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String mess = req.getParameter("ans");
        String usernam = req.getParameter("usern");
        String quest = req.getParameter("message");
        String mailer = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM feedback WHERE name='" + usernam + "';";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                mailer = rs.getString(2);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        resp.setContentType("text/html");
        final String username = "holderboard@gmail.com";
        final String password = "kingboardforewer777";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("holderboard@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailer));
            message.setSubject("Деканат");
            String emailBody = mess + "<br><br> С уважением, <br>Сотрудник деканата.";
            message.setContent(emailBody, "text/html; charset=UTF-8");
            Transport.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            PreparedStatement st = con.prepareStatement("DELETE FROM feedback WHERE name=? and content=?;");
            st.setString(1, usernam);
            st.setString(2, quest);
            st.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        req.getRequestDispatcher("WEB-INF/send.jsp").forward(req, resp);
    }
}
