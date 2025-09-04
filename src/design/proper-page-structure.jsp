<!-- ❌ VIOLATION: Improper Page Structure -->
<!-- Random scriptlets, no directives, mixed concerns -->

<html>
<%
    String title = "Dashboard";
%>
<head>
    <title><%= title %></title>
    <%@ include file="common.jsp" %>  <!-- Directive inside <head> — bad placement -->
</head>
<body>
<jsp:include page="header.jsp" />

<!-- Business logic directly in JSP -->
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

Welcome, <%= user %>!

<!-- Repeated footer markup -->
<hr>
<p>&copy; 2025</p>

</body>
</html>

<!-- ✅ COMPLIANT: Proper JSP Page Structure -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="init.jsp" %> <!-- Common setup at top -->

<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>

<jsp:include page="header.jsp" />

<!-- Only view logic in JSP -->
<c:choose>
    <c:when test="${empty sessionScope.user}">
        <c:redirect url="login.jsp" />
    </c:when>
    <c:otherwise>
        Welcome, ${sessionScope.user}!
    </c:otherwise>
</c:choose>

<jsp:include page="footer.jsp" />
</body>
</html>
