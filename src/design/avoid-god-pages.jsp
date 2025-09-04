<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Page</title>
</head>
<body>

<!-- ❌ VIOLATION: Monolithic JSP (God Page) -->
<%
    // Business logic embedded directly
    String username = request.getParameter("username");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "password");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM customers WHERE username='" + username + "'");
%>
<h2>Customer Details</h2>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Email</th></tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
    </tr>
    <%
        }
        rs.close();
        stmt.close();
        con.close();
    %>
</table>

<!-- ✅ COMPLIANT: Split logic and reuse components -->
<!-- Assume a servlet/controller fetches customerList and sets it as request attribute -->
<h2>Customer List</h2>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Email</th></tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
        </tr>
    </c:forEach>
</table>

<!-- ✅ COMPLIANT: Use includes for layout/components -->
<jsp:include page="footer.jsp" />
</body>
</html>
