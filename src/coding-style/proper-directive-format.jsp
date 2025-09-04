<!-- ❌ VIOLATION: Missing space after directive name -->
<%@pagecontentType="text/html"%>     <!-- VIOLATION -->

<!-- ❌ VIOLATION: Missing quotes around attribute value -->
<%@ page contentType=text/html %>    <!-- VIOLATION -->

<!-- ❌ VIOLATION: Misordered and inconsistent spacing -->
<%@tagliburi="http://java.sun.com/jsp/jstl/core"prefix="c"%>  <!-- VIOLATION -->

<!-- ✅ COMPLIANT: Well-formatted directives -->
<%@ page contentType="text/html" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
