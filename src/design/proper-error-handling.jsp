<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %> <!-- ✅ COMPLIANT: Defines a proper error page -->

<html>
<head>
    <title>Error Handling Rule Sample</title>
</head>
<body>

    <h2>Welcome to the Error Handling Demo</h2>

    <!-- ❌ VIOLATION: No try-catch and risky code not protected -->
    <%
        String riskyValue = null;
        int length = riskyValue.length(); // ❌ Will throw NullPointerException, not handled
    %>

    <!-- ❌ VIOLATION: Raw exception printed to user -->
    <%
        try {
            int age = Integer.parseInt("not_a_number");
        } catch (Exception e) {
            out.println(e); // ❌ Exposes internal error to user
            e.printStackTrace(); // ❌ Should be logged, not printed in JSP
        }
    %>

    <!-- ✅ COMPLIANT: Risky code handled with friendly redirection -->
    <%
        try {
            int safeAge = Integer.parseInt(request.getParameter("age"));
            request.setAttribute("parsedAge", safeAge);
        } catch (Exception ex) {
            // ✅ Properly redirecting to error page
            response.sendRedirect("error.jsp");
        }
    %>

    <!-- ✅ COMPLIANT: Display content when there's no error -->
    <p>Your data is processed successfully.</p>

</body>
</html>
