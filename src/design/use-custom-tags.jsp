<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags/app" %> <!-- ✅ COMPLIANT: Custom tag used -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Use Custom Tags Example</title>
</head>
<body>

    <h2>Welcome to the Dashboard</h2>

    <!-- ❌ VIOLATION: Complex Java logic written inline using scriptlet -->
    <%
        String role = request.getParameter("role");
        if ("admin".equals(role)) {
            out.println("<p>Welcome Admin! You have full access.</p>");
        } else {
            out.println("<p>Welcome User. Limited access granted.</p>");
        }
    %>

    <!-- ❌ VIOLATION: Complex conditional logic handled using JSTL -->
    <c:choose>
        <c:when test="${user.age > 60}">
            <p>Senior Citizen Discount Applied</p>
        </c:when>
        <c:when test="${user.age > 30}">
            <p>Standard User Discount Applied</p>
        </c:when>
        <c:otherwise>
            <p>No Discount</p>
        </c:otherwise>
    </c:choose>

    <hr />

    <!-- ✅ COMPLIANT: Replaces scriptlet logic with custom tag -->
    <app:renderRoleMessage role="${param.role}" />

    <!-- ✅ COMPLIANT: Replaces conditional logic with custom discount tag -->
    <app:discountMessage age="${user.age}" />

</body>
</html>
