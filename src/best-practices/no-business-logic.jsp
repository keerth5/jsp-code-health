<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>No Business Logic Rule Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Business logic in JSP -->
    <% 
        String role = request.getParameter("role");       // Getting request parameter
        if ("admin".equals(role)) {                       // Decision logic
            out.println("Welcome Admin!");
        } else {
            out.println("Welcome User!");
        }
    %>

    <!-- ✅ COMPLIANT: Business logic handled in controller -->
    <!-- Controller code (Servlet or Spring Controller):
        String role = request.getParameter("role");
        String greeting = "User";
        if ("admin".equals(role)) {
            greeting = "Admin";
        }
        request.setAttribute("greeting", greeting);
    -->

    <!-- Presentation logic only -->
    <p>Welcome ${greeting}!</p>

</body>
</html>
