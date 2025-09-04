<!-- ❌ VIOLATION: Abusing session scope for temporary or heavy data -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    // Storing large or unnecessary data in session
    List<String> logs = new ArrayList<>();
    logs.add("Page accessed at: " + new java.util.Date());
    session.setAttribute("debugLogs", logs);

    // Using session to pass data between immediate pages
    session.setAttribute("userInput", request.getParameter("name"));
%>
<p>Data stored in session.</p>

<!-- ✅ COMPLIANT: Use request scope or external store for temporary data -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    // Log data should not be stored in session; use logging frameworks instead
    System.out.println("Page accessed at: " + new java.util.Date());

    // For data transfer between pages, prefer request attributes
    request.setAttribute("userInput", request.getParameter("name"));
    RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
    rd.forward(request, response);
%>
