package com.company;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class logic {
    public boolean logreg(String sql) {
        boolean check = false;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) check = true;
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

    public String cheker(String sql) {
        String reslt = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                reslt = rs.getString(1);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return reslt;
    }

    public String status(String sql) {
        String reslt = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                reslt = rs.getString(5);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return reslt;
    }

    public ArrayList<String> number_st() {
        ArrayList<String> list = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM students WHERE course=" + i + ";");
                if(rs.next()) list.add(rs.getString(1));
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public ArrayList<String> report_st() {
        ArrayList<String> list = new ArrayList<>();
        for (int i = 2018; i >= 2014; i--) {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM reports WHERE year=" + i + ";");
                if(rs.next()) list.add(rs.getString(1));
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public String feed(String sql) {
        String email = "";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()){
                email = rs.getString(4);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return email;
    }

    public int get_numstud() {
        int count = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/deckanat?useSSL=false", "root", "roottoor");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM students;");
            if(rs.next()) count = Integer.valueOf(rs.getString(1));
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public String md5Custom(String st) {
        MessageDigest messageDigest;
        byte[] digest = new byte[0];

        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(st.getBytes());
            digest = messageDigest.digest();
        } catch (NoSuchAlgorithmException e) {
            // тут можно обработать ошибку
            // возникает она если в передаваемый алгоритм в getInstance(,,,) не существует
            e.printStackTrace();
        }

        BigInteger bigInt = new BigInteger(1, digest);
        String md5Hex = bigInt.toString(16);

        while( md5Hex.length() < 32 ){
            md5Hex = "0" + md5Hex;
        }

        return md5Hex;
    }
}
