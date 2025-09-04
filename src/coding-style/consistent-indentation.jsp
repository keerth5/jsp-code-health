<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consistent Indentation Example</title>
</head>
<body>
    <!-- ✅ COMPLIANT: 4 spaces indentation -->
    <div>
        <p>Welcome, ${userName}!</p>
    </div>

  <!-- ❌ VIOLATION: 2 spaces instead of 4 -->
  <div>
    <p>User role: ${userRole}</p>
  </div>

    <!-- ❌ VIOLATION: mixing a tab with spaces -->
	<div>
        <p>Account status: ${status}</p>
    </div>

    <!-- ✅ COMPLIANT: back to 4 spaces consistently -->
    <jsp:include page="footer.jsp" />
</body>
</html>
