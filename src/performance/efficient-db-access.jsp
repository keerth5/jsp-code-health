<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Efficient DB Access Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Database operations in loops -->
<%
    // ❌ VIOLATION: Statement execution in for loop
    for (int i = 0; i < 10; i++) {
        Statement stmt = null; // Assuming stmt is initialized
        ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id = " + i);
        while (rs.next()) {
            out.println(rs.getString("name"));
        }
    }
    
    // ❌ VIOLATION: executeUpdate in while loop
    int counter = 0;
    while (counter < 5) {
        Statement updateStmt = null; // Assuming initialized
        updateStmt.executeUpdate("UPDATE users SET last_login = NOW() WHERE id = " + counter);
        counter++;
    }
    
    // ❌ VIOLATION: jdbcTemplate operations in loop
    for (int j = 0; j < 20; j++) {
        // Simulated jdbcTemplate call in loop
        // jdbcTemplate.queryForObject("SELECT name FROM users WHERE id = ?", String.class, j);
    }
%>

<!-- ✅ COMPLIANT: Efficient database access -->
<%
    // ✅ COMPLIANT: Single query with batch processing
    Statement batchStmt = null; // Assuming initialized
    ResultSet allResults = batchStmt.executeQuery("SELECT * FROM users WHERE id IN (1,2,3,4,5)");
    
    while (allResults.next()) {
        out.println(allResults.getString("name"));
    }
%>

</body>
</html>
