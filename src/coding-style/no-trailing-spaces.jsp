<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>No Trailing Spaces Example</title>    
</head>
<body>

    <!-- ❌ VIOLATION: Line ends with trailing spaces -->
    <p>Welcome, ${userName}!     </p>           <!-- VIOLATION: trailing spaces -->

    <!-- ❌ VIOLATION: Line with tab after tag -->
    <div>Content here</div>	                   <!-- VIOLATION: trailing tab -->

    <!-- ✅ COMPLIANT: No trailing spaces -->
    <p>Your role is: ${userRole}</p>

    <br />

</body>
</html>
