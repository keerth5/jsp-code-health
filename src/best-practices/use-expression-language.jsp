<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Use Expression Language Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Java expression used in JSP -->
    <p>Hello, <%= request.getParameter("name") %>!</p>  <!-- VIOLATION -->

    <!-- ✅ COMPLIANT: Expression Language used -->
    <p>Hello, ${param.name}!</p>

    <!-- ❌ VIOLATION: Accessing object via Java expression -->
    <%
        User user = (User) request.getAttribute("user");
    %>
    <p>User Name: <%= user.getName() %></p>  <!-- VIOLATION -->

    <!-- ✅ COMPLIANT: Using EL to access bean property -->
    <p>User Name: ${user.name}</p>

</body>
</html>
