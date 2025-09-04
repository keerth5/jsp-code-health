<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Separate Concerns Rule Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Business logic mixed in JSP (computing total) -->
    <%
        int price = 100;
        int quantity = 3;
        int total = price * quantity;
    %>
    <p>Total price: <%= total %></p>  <!-- VIOLATION -->

    <!-- ✅ COMPLIANT: Logic done in controller, JSP only renders -->
    <!-- Controller:
        int price = 100;
        int quantity = 3;
        int total = price * quantity;
        request.setAttribute("total", total);
    -->
    <p>Total price: ${total}</p>

    <!-- ❌ VIOLATION: Control logic inside JSP -->
    <%
        if ("admin".equals(request.getParameter("role"))) {
    %>
        <p>Welcome, Admin!</p>
    <%
        }
    %>

    <!-- ✅ COMPLIANT: Control logic in controller, JSP renders based on prepared flag -->
    <!-- Controller:
        boolean isAdmin = "admin".equals(request.getParameter("role"));
        request.setAttribute("isAdmin", isAdmin);
    -->
    <c:if test="${isAdmin}">
        <p>Welcome, Admin!</p>
    </c:if>

</body>
</html>
