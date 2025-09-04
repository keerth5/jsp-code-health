<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>No Scriptlets Rule Example</title>
</head>
<body>

    <!-- ✅ Compliant: Displaying a variable using Expression Language -->
    <p>Welcome, ${userName}!</p>

    <!-- ❌ Violation: Using scriptlet to print a value -->
    <% String greeting = "Hello, " + request.getParameter("user"); %>  <!-- VIOLATION: Scriptlet used -->
    <p><%= greeting %></p>  <!-- VIOLATION: Scriptlet expression used -->

    <!-- ✅ Compliant: Using JSTL to display a value -->
    <c:if test="${not empty userName}">
        <p>Your name is: ${userName}</p>
    </c:if>

    <!-- ❌ Violation: Using scriptlet to implement control flow -->
    <% if (request.getParameter("admin") != null) { %>   <!-- VIOLATION: Scriptlet control flow -->
        <p>Admin section</p>
    <% } %>

    <!-- ✅ Compliant: Using JSTL for conditional check -->
    <c:if test="${not empty param.admin}">
        <p>Admin section (via JSTL)</p>
    </c:if>

</body>
</html>
