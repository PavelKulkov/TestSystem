package ru.kulkov.testsystem;

import ru.kulkov.testsystem.DB.DB;
import sun.plugin.com.Dispatcher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Pavel Kulkov on 17.03.2016.
 */
public class auth extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try{
            HttpSession session = req.getSession();
            resp.setContentType("text/html; charset=UTF-8");
            Connection con = DB.getCon();
            String query = "SELECT * FROM users WHERE USERNAME = '"+req.getParameter("login")+"'";

            Statement st = con.createStatement();
            ResultSet rs =st.executeQuery(query);

            if(rs.next()){
                if(rs.getString("USERPASS").equals(req.getParameter("password"))){
                    session.setAttribute("isAdmin","true");
                    getServletContext().getRequestDispatcher("/tests.jsp").forward(req,resp);
                }else {
                    session.setAttribute("isAdmin","false");

                }
            }


            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
