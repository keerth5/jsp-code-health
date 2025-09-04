<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consistent Quotes Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Mixing double and single quotes -->
    <a href="home.jsp" class='nav-link'>Home</a>         <!-- VIOLATION -->

    <!-- ❌ VIOLATION: No quotes around attribute value -->
    <input type=text name=username>                      <!-- VIOLATION -->

    <!-- ✅ COMPLIANT: Double quotes used consistently -->
    <a href="about.jsp" class="nav-link">About</a>

    <input type="text" name="username" value="${userName}" />

    <!-- ✅ COMPLIANT: Uniform use of double quotes -->
    <img src="logo.png" alt="Company Logo" />

</body>
</html>
