<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Proper HTTP Headers Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Setting HTTP headers in JSP -->
<%
    // ❌ VIOLATION: Setting custom headers
    response.setHeader("X-Custom-Header", "value");
    
    // ❌ VIOLATION: Setting Cache-Control header
    response.setHeader("Cache-Control", "no-cache");
    
    // ❌ VIOLATION: Setting Content-Type
    response.setContentType("text/html; charset=UTF-8");
    
    // ❌ VIOLATION: Setting character encoding
    response.setCharacterEncoding("UTF-8");
%>

<h2>HTTP Headers Configuration</h2>
<p>This page demonstrates HTTP header configuration issues.</p>

<!-- ✅ COMPLIANT: Headers should be set in web.xml or filters -->
<!-- Headers should be configured in:
     1. web.xml
     2. Servlet filters
     3. Application server configuration
     4. Reverse proxy configuration
-->

</body>
</html>
