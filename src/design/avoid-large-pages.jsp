<%@ page contentType="text/html" language="java" %>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>

    <!-- ✅ COMPLIANT: Including reusable header -->
    <%@ include file="/includes/header.jsp" %>

    <!-- ❌ VIOLATION: Large static HTML block for navigation repeated in many pages -->
    <div class="sidebar"> <!-- start of violation -->
        <ul>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="settings.jsp">Settings</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div> <!-- end of violation -->

    <!-- ✅ COMPLIANT: Reusable form section included -->
    <jsp:include page="/modules/user-form.jsp" />

    <!-- ❌ VIOLATION: Full form written in-place, adds many lines and makes file bulky -->
    <form method="post" action="submitUser.jsp"> <!-- start of violation -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" />
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" />
        <button type="submit">Submit</button>
    </form> <!-- end of violation -->

    <!-- ✅ COMPLIANT: Table included from reusable module -->
    <jsp:include page="/modules/user-table.jsp" />

    <!-- ❌ VIOLATION: Another large table inline (duplicate structure) -->
    <table border="1"> <!-- start of violation -->
        <tr><th>Product</th><th>Quantity</th><th>Price</th></tr>
        <tr><td>Book</td><td>2</td><td>$20</td></tr>
        <tr><td>Pen</td><td>5</td><td>$5</td></tr>
    </table> <!-- end of violation -->

    <!-- ❌ VIOLATION: Business logic embedded using scriptlet -->
    <%
        // VIOLATION: Logic like discount calculation should be in a controller
        double discount = 0.0;
        if ("premium".equals(request.getParameter("type"))) {
            discount = 0.15;
        }
    %>

    <!-- ✅ COMPLIANT: Business logic handled in controller; JSP just renders -->
    <p>Your discount: ${discountPercentage}</p>

    <!-- ✅ COMPLIANT: Including reusable footer -->
    <%@ include file="/includes/footer.jsp" %>

</body>
</html>
