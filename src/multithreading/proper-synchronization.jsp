<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Accessing shared data without synchronization -->
<%!
    // Shared across threads (NOT thread-safe)
    int unsafeCounter = 0;
%>

<%
    // Multiple threads may modify this at the same time
    unsafeCounter++;
%>
<p>❌ Unsafe counter without synchronization: <%= unsafeCounter %></p>

<!-- ✅ COMPLIANT: Synchronizing access to shared resource -->
<%!
    int safeCounter = 0;
    Object lock = new Object();
%>

<%
    synchronized (lock) {
        safeCounter++;
    }
%>
<p>✅ Safe counter with proper synchronization: <%= safeCounter %></p>

<!-- ✅ BETTER PRACTICE: Use request-scoped local variables -->
<%
    int localCounter = 0;
    localCounter++;
%>
<p>✅ Local counter (thread-safe by design): <%= localCounter %></p>
