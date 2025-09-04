<!-- ❌ VIOLATION: No input validation -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Login</title></head>
<body>
    <%
        String username = request.getParameter("username");
        out.println("Welcome, " + username);  // Unsafe: can output script tags, SQL, etc.
    %>
</body>
</html>

<!-- ✅ COMPLIANT: Proper input validation -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<html>
<head><title>Login</title></head>
<body>
    <%
        String username = request.getParameter("username");
        if (username != null && username.matches("^[a-zA-Z0-9_]{3,20}$")) {
            out.println("Welcome, " + StringEscapeUtils.escapeHtml4(username));  // Safe output
        } else {
            out.println("Invalid username.");
        }
    %>
</body>
</html>
