<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>No Empty Comments Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Empty JSP comment -->
<%--  --%>

<!-- ❌ VIOLATION: Empty JSP comment with spaces -->
<%--    --%>

<!-- ❌ VIOLATION: Empty single line comment -->
//

<!-- ❌ VIOLATION: Empty multi-line comment -->
/*  */

<!-- ❌ VIOLATION: Empty multi-line comment with spaces -->
/*    */

<%
    // ❌ VIOLATION: Empty single line comment in scriptlet
    
    /* ❌ VIOLATION: Empty multi-line comment in scriptlet */
    
    int x = 5; // ✅ COMPLIANT: Comment with content
    /* ✅ COMPLIANT: Multi-line comment with content */
%>

<!-- ✅ COMPLIANT: JSP comment with meaningful content -->
<%-- This is a meaningful comment explaining the purpose --%>

<!-- ✅ COMPLIANT: HTML comment with content -->
<!-- This div contains the main content -->
<div>
    <p>Main content here</p>
</div>

</body>
</html>

