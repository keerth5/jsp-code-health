<%@ page import="java.util.*, java.util.concurrent.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Using non-thread-safe HashMap in a shared static field -->
<%!
    static Map<String, String> unsafeUserMap = new HashMap<>(); // ❌ Not thread-safe
%>
<%
    String uid = request.getParameter("user");
    if (uid != null) {
        unsafeUserMap.put(uid, "dummy"); // ❌ Potential race condition
    }
%>
<p>❌ Unsafe user map size: <%= unsafeUserMap.size() %></p>

<hr/>

<!-- ✅ COMPLIANT: Use thread-safe ConcurrentHashMap -->
<%!
    static ConcurrentMap<String, String> safeUserMap = new ConcurrentHashMap<>();
%>
<%
    String safeUid = request.getParameter("user");
    if (safeUid != null) {
        safeUserMap.put(safeUid, "dummy"); // ✅ Thread-safe access
    }
%>
<p>✅ Safe user map size: <%= safeUserMap.size() %></p>

<hr/>

<!-- ✅ COMPLIANT: Avoid shared state entirely -->
<%
    Map<String, String> requestScopedMap = new HashMap<>();
    requestScopedMap.put("sessionId", session.getId()); // ✅ Safe for single request
%>
<p>✅ Request-Scoped Map Entry: <%= requestScopedMap.get("sessionId") %></p>

<form method="get">
    <input type="text" name="user" placeholder="Enter user ID" />
    <input type="submit" value="Submit" />
</form>
