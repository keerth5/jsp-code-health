<!-- ❌ VIOLATION: Accessing potentially null attribute without check -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>User Profile</title></head>
<body>
<%
    String username = (String) session.getAttribute("username");
    out.println("Welcome, " + username.toUpperCase()); // May throw NPE if username is null
%>
</body>
</html>

<!-- ✅ COMPLIANT: Check for null before usage -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>User Profile</title></head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        out.println("Welcome, " + username.toUpperCase());
    } else {
        out.println("Welcome, guest!");
    }
%>
</body>
</html>
