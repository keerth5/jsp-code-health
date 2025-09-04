<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Proper Include Mechanism Example</title>
</head>
<body>

    <!-- ✅ COMPLIANT: Static include for header (unchanging HTML layout) -->
    <%@ include file="includes/header.jsp" %>

    <!-- ❌ VIOLATION: Static include used for dynamic content -->
    <%@ include file="dynamic/userProfile.jsp" %>   <!-- VIOLATION: should use <jsp:include> -->

    <!-- ✅ COMPLIANT: Dynamic include for request-based content -->
    <jsp:include page="dynamic/userProfile.jsp" />

    <!-- ❌ VIOLATION: Dynamic include used for static layout -->
    <jsp:include page="includes/footer.jsp" />   <!-- VIOLATION: better to use static include -->

    <!-- ✅ COMPLIANT: Static include for footer -->
    <%@ include file="includes/footer.jsp" %>

</body>
</html>
