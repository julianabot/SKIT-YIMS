/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import controller.*;
import java.sql.*;
import javax.servlet.*;
import model.*;
import java.util.*;

public class DatabaseListener implements ServletContextListener {

    static Connection conn;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext sc = event.getServletContext();
        try {
            Class.forName(sc.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            //creates the url for database
            String dbusername = sc.getInitParameter("dbUsername");
            String dbpassword = sc.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(sc.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(sc.getInitParameter("dbHostName"))
                    .append(":")
                    .append(sc.getInitParameter("dbPort"))
                    .append("/")
                    .append(sc.getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), dbusername, dbpassword);

            //passes the model on the ports object so connection is not always created.
            sc.setAttribute("dbConnection", conn);
            System.out.print("DB Connected.");

        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - " + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - " + nfe.getMessage());
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //nothing
    }

}
