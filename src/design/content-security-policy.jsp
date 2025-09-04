<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Security Policy Example</title>
    
    <!-- ✅ COMPLIANT: Content Security Policy meta tag -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://trusted.com; style-src 'self' https://trusted.com; img-src 'self' https://trusted.com">
    
    <!-- Alternative meta tag formats -->
    <meta http-equiv='Content-Security-Policy' content="default-src 'self'">
    <meta http-equiv=Content-Security-Policy content="default-src 'self'">
</head>
<body>
    <h1>Content Security Policy Example</h1>
    
    <h2>CSP Header in JSP</h2>
    
    <!-- ✅ COMPLIANT: Setting CSP header in Java code -->
    <%
        // Setting Content-Security-Policy header
        response.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' https://trusted.com");
        
        // Alternative formats
        response.setHeader('Content-Security-Policy', "default-src 'self'");
        response.setHeader("content-security-policy", "default-src 'self'");
    %>
    
    <h2>Benefits of Content Security Policy:</h2>
    <ul>
        <li>Prevents XSS attacks by controlling which resources can be loaded</li>
        <li>Restricts inline scripts and styles</li>
        <li>Controls which domains can serve resources to your page</li>
        <li>Provides reporting capabilities for violations</li>
    </ul>
    
    <h2>Common CSP Directives:</h2>
    <ul>
        <li><code>default-src</code>: Default policy for loading content</li>
        <li><code>script-src</code>: Valid sources for JavaScript</li>
        <li><code>style-src</code>: Valid sources for stylesheets</li>
        <li><code>img-src</code>: Valid sources for images</li>
        <li><code>connect-src</code>: Valid targets for fetch, XHR, WebSocket</li>
        <li><code>font-src</code>: Valid sources for fonts</li>
        <li><code>frame-src</code>: Valid sources for frames</li>
        <li><code>report-uri</code>: URL where violations should be reported</li>
    </ul>
</body>
</html>
