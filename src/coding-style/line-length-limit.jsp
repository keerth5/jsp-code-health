<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Line Length Limit Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Line exceeds 120 characters -->
    <input type="text" name="username" placeholder="Enter your username for login to the internal company portal system" />  <!-- 135 chars -->

    <!-- ❌ VIOLATION: Long JSP tag in one line -->
    <jsp:include page="/components/widgets/dynamiccontent/userprofile/loadUserProfileForPortalPage.jsp" />  <!-- 142 chars -->

    <!-- ✅ COMPLIANT: Break lines at logical boundaries -->
    <input type="text"
           name="username"
           placeholder="Enter your username for login" />

    <!-- ✅ COMPLIANT: Break long include path -->
    <jsp:include 
        page="/components/widgets/dynamiccontent/userprofile/loadUserProfileForPortalPage.jsp" />

</body>
</html>
