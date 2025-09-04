<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- ❌ VIOLATION: Shared instance variable (not thread-safe) -->
<%! 
    // Instance variable - shared across all threads
    int visitCount = 0;
%>

<%
    // Multiple threads might increment this simultaneously
    visitCount++;
%>
<p>❌ Visit count (not thread-safe): <%= visitCount %></p>

<!-- ✅ COMPLIANT: Use request-scoped variables instead -->
<%
    // Thread-safe: Variable is scoped to this request only
    int safeVisitCount = 0;
    safeVisitCount++;
%>
<p>✅ Safe visit count: <%= safeVisitCount %></p>

<!-- ✅ COMPLIANT: Use thread-safe methods for shared state -->
<%
    // Thread-safe increment using application scope and synchronization
    synchronized (application) {
        Integer appCount = (Integer) application.getAttribute("appVisitCount");
        if (appCount == null) {
            appCount = 1;
        } else {
            appCount++;
        }
        application.setAttribute("appVisitCount", appCount);
%>
<p>✅ Application-wide visit count (thread-safe): <%= appCount %></p>
<%
    }
%>
