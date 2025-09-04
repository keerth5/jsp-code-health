<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ❌ VIOLATION: Using instance variables (stateful design) -->
<%!
    String userName; // Shared across all requests and threads — NOT SAFE
%>
<%
    userName = request.getParameter("user");
%>
<p>❌ Hello, <%= userName %></p>

<hr/>

<!-- ✅ COMPLIANT: Using request-scoped local variables (stateless) -->
<%
    String safeUserName = request.getParameter("user");
%>
<p>✅ Hello, <%= safeUserName %></p>

<hr/>

<!-- ✅ COMPLIANT: Using JSTL & EL (fully stateless and recommended) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form method="get">
    <input type="text" name="user" placeholder="Enter your name" />
    <input type="submit" value="Submit" />
</form>

<c:if test="${not empty param.user}">
    <p>✅ Hello, ${param.user}</p>
</c:if>
