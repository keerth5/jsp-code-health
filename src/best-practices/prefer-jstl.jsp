<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Prefer JSTL Example</title>
</head>
<body>

    <!-- ✅ Compliant: JSTL used to print a value -->
    <p>Hello, ${userName}!</p>

    <!-- ❌ Violation: Scriptlet used to declare and print -->
    <% String city = "Chennai"; %>         <!-- VIOLATION -->
    <p>City: <%= city %></p>               <!-- VIOLATION -->

    <!-- ✅ Compliant: JSTL used to conditionally render content -->
    <c:if test="${userRole == 'admin'}">
        <p>Welcome, Admin!</p>
    </c:if>

    <!-- ❌ Violation: Scriptlet used for conditional rendering -->
    <% if ("admin".equals(request.getParameter("userRole"))) { %>   <!-- VIOLATION -->
        <p>Welcome, Admin!</p>
    <% } %>

    <!-- ✅ Compliant: JSTL loop -->
    <c:forEach var="item" items="${itemList}">
        <p>Item: ${item}</p>
    </c:forEach>

    <!-- ❌ Violation: Scriptlet loop -->
    <%
        java.util.List<String> itemList = java.util.Arrays.asList("Apple", "Banana", "Cherry");  <!-- VIOLATION -->
        for (String item : itemList) {
    %>
        <p>Item: <%= item %></p>  <!-- VIOLATION -->
    <%
        }
    %>

</body>
</html>
