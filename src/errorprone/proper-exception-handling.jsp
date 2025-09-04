<!-- ❌ VIOLATION: No exception handling -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Customer Info</title></head>
<body>
<%
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "password");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM customers");
    while (rs.next()) {
        out.println(rs.getString("name") + "<br>");
    }
    rs.close();
    stmt.close();
    con.close();
%>
</body>
</html>

<!-- ✅ COMPLIANT: Exception is handled and logged properly -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.logging.*" %>
<%
    Logger logger = Logger.getLogger("AppLogger");
%>
<html>
<head><title>Customer Info</title></head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "password");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM customers");

        while (rs.next()) {
            out.println(rs.getString("name") + "<br>");
        }

    } catch (SQLException e) {
        logger.severe("DB error: " + e.getMessage());
        out.println("Something went wrong. Please try again later.");

    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignored) {}
        try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
        try { if (con != null) con.close(); } catch (Exception ignored) {}
    }
%>
</body>
</html>
