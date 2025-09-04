<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Using a shared mutable static variable -->
<%!
    // Shared across all requests and threads
    String sharedUserId;
%>
<%
    sharedUserId = request.getParameter("userId"); // ❌ Not thread-safe
%>
<p>❌ Shared User ID: <%= sharedUserId %></p>

<hr/>

<!-- ✅ COMPLIANT: Use thread-local variable to isolate state -->
<%!
    private static ThreadLocal<String> threadLocalUserId = new ThreadLocal<>();
%>
<%
    String inputId = request.getParameter("userId");
    if (inputId != null) {
        threadLocalUserId.set(inputId); // ✅ Thread-safe
    }
    String currentUser = threadLocalUserId.get();
%>
<p>✅ Thread-Local User ID: <%= currentUser %></p>

<hr/>

<!-- ✅ COMPLIANT: Use request-scoped variables instead -->
<%
    String requestScopedUserId = request.getParameter("userId"); // ✅ Safe
%>
<p>✅ Request-Scoped User ID: <%= requestScopedUserId %></p>

<form method="get">
    <input type="text" name="userId" placeholder="Enter user ID" />
    <input type="submit" value="Submit" />
</form>
