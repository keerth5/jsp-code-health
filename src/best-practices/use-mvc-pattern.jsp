<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>    <!-- ❌ VIOLATION: Model logic in View -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MVC Pattern Rule Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Business logic and DB access in JSP -->
    <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "user", "pass");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT name FROM users");
        while (rs.next()) {
            out.println("<p>User: " + rs.getString("name") + "</p>");
        }
        rs.close();
        stmt.close();
        conn.close();
    %>

    <!-- ✅ COMPLIANT: Business logic in Controller -->
    <!-- Controller (Servlet or Spring Controller):
        List<String> userList = userService.getAllUserNames();
        request.setAttribute("userList", userList);
    -->

    <!-- View (JSP): Clean presentation logic -->
    <c:forEach var="user" items="${userList}">
        <p>User: ${user}</p>
    </c:forEach>

</body>
</html>
