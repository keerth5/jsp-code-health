<!-- ❌ VIOLATION: Resources not closed -->
<%@ page import="java.sql.*" %>
<%
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pass");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM users");

    while (rs.next()) {
        out.println(rs.getString("name") + "<br>");
    }
    // No rs.close(), stmt.close(), or con.close()
%>

<!-- ✅ COMPLIANT: Proper resource cleanup using finally -->
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pass");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM users");

        while (rs.next()) {
            out.println(rs.getString("name") + "<br>");
        }
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (stmt != null) stmt.close(); } catch (Exception ignore) {}
        try { if (con != null) con.close(); } catch (Exception ignore) {}
    }
%>
