<!-- ❌ VIOLATION: No header comment -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Home</title></head>
<body>
    <h2>Welcome!</h2>
</body>
</html>

<!-- ✅ COMPLIANT: Includes proper header comment -->
<%-- 
    File: Home.jsp
    Purpose: Displays a welcome page to logged-in users
    Dependencies: header.jsp, footer.jsp
    Author: dev.team@example.com
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Home</title></head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Welcome!</h2>
    <jsp:include page="footer.jsp" />
</body>
</html>
