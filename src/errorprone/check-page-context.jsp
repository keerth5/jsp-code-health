<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- ❌ VIOLATION: Improper or ambiguous use of pageContext -->
<%
    // Setting attribute in session scope without real need
    pageContext.setAttribute("userRole", "admin", PageContext.SESSION_SCOPE);

    // Later retrieval without checking scope or null
    String role = (String) pageContext.getAttribute("userRole");
%>
<p>User role (session scope misuse): <%= role %></p>

<!-- ✅ COMPLIANT: Proper use of pageContext with clear scope and checks -->
<%
    // Use PAGE_SCOPE or REQUEST_SCOPE for local, short-lived data
    pageContext.setAttribute("message", "Hello User", PageContext.PAGE_SCOPE);

    // Access safely with known scope and null checks
    String msg = (String) pageContext.getAttribute("message", PageContext.PAGE_SCOPE);
    if (msg != null) {
%>
        <p>Message: <%= msg %></p>
<%
    }
%>
