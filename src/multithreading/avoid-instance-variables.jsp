<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Declaring an instance variable -->
<%!
    // This variable is shared across all users/requests
    int counter = 0;
%>

<%
    // Multiple users might access/modify this concurrently
    counter++;
%>
<p>❌ Counter using instance variable (not thread-safe): <%= counter %></p>

<!-- ✅ COMPLIANT: Using local (request-scoped) variable -->
<%
    // This variable is safe and only exists within this request
    int localCounter = 0;
    localCounter++;
%>
<p>✅ Counter using local variable (thread-safe): <%= localCounter %></p>
