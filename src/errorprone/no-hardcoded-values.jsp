<!-- ❌ VIOLATION: Hardcoded DB credentials -->
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" %>
<%
    String url = "jdbc:mysql://localhost:3306/mydb";
    String user = "root";
    String password = "admin123"; // Hardcoded password

    Connection conn = DriverManager.getConnection(url, user, password);
%>

<!-- ✅ COMPLIANT: Read config from external source -->
<%@ page language="java" import="java.sql.*, java.util.*, java.io.*" contentType="text/html; charset=UTF-8" %>
<%
    Properties props = new Properties();
    InputStream in = application.getResourceAsStream("/WEB-INF/db.properties");
    props.load(in);

    String url = props.getProperty("db.url");
    String user = props.getProperty("db.user");
    String password = props.getProperty("db.password");

    Connection conn = DriverManager.getConnection(url, user, password);
%>
