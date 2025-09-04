<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Using shared mutable resource -->
<%!
    // This list is shared across all threads
    java.util.List<String> sharedList = new java.util.ArrayList<>();
%>
<%
    String value = request.getParameter("item");
    if (value != null) {
        sharedList.add(value); // ❌ Not thread-safe!
    }
%>
<p>❌ Shared List size: <%= sharedList.size() %></p>

<hr/>

<!-- ✅ COMPLIANT: Use local (request-scoped) variable -->
<%
    java.util.List<String> requestList = new java.util.ArrayList<>();
    String safeValue = request.getParameter("item");
    if (safeValue != null) {
        requestList.add(safeValue); // ✅ Safe - only within this request
    }
%>
<p>✅ Request-scoped List size: <%= requestList.size() %></p>

<hr/>

<!-- ✅ COMPLIANT: Using JSTL and EL (fully stateless and thread-safe) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form method="get">
    <input type="text" name="item" placeholder="Enter item" />
    <input type="submit" value="Add" />
</form>

<p>✅ Item entered: ${param.item}</p>
