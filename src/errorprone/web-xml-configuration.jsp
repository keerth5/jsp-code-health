<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web.xml Configuration Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Web.xml configuration elements in JSP -->
<!-- These should be in web.xml, not in JSP files -->

<!-- ❌ VIOLATION: Error page configuration -->
<error-page>
    <error-code>404</error-code>
    <location>/error/404.jsp</location>
</error-page>

<!-- ❌ VIOLATION: Security constraint configuration -->
<security-constraint>
    <web-resource-collection>
        <web-resource-name>Admin Area</web-resource-name>
        <url-pattern>/admin/*</url-pattern>
    </web-resource-collection>
</security-constraint>

<!-- ❌ VIOLATION: Servlet mapping configuration -->
<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/myservlet</url-pattern>
</servlet-mapping>

<h2>Web Configuration</h2>
<p>This page demonstrates web.xml configuration issues.</p>

<!-- ✅ COMPLIANT: These configurations belong in web.xml -->
<!-- 
web.xml should contain:
<error-page>
    <error-code>404</error-code>
    <location>/error/404.jsp</location>
</error-page>

<security-constraint>
    <web-resource-collection>
        <web-resource-name>Admin Area</web-resource-name>
        <url-pattern>/admin/*</url-pattern>
    </web-resource-collection>
</security-constraint>

<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/myservlet</url-pattern>
</servlet-mapping>
-->

</body>
</html>
