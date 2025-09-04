<!-- ❌ VIOLATION: Header hardcoded -->
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <div class="header">
        <img src="logo.png" />
        <h1>Company Portal</h1>
        <a href="logout.jsp">Logout</a>
    </div>

    <p>Welcome to the dashboard!</p>
</body>
</html>

<!-- ✅ COMPLIANT: Header reused via include -->
<%@ include file="/includes/header.jsp" %>

<p>Welcome to the dashboard!</p>

<div class="header">
    <img src="logo.png" />
    <h1>Company Portal</h1>
    <a href="logout.jsp">Logout</a>
</div>
