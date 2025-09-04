<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.script.ScriptEngine" %>
<%@ page import="javax.script.ScriptEngineManager" %>
<html>
<head>
    <title>Avoid Eval-like Functions Example</title>
</head>
<body>

<h2>Avoid Eval-like Functions Example</h2>

<!-- ❌ VIOLATION: Using ScriptEngine.eval() -->
<%
    // VIOLATION: Using ScriptEngine to evaluate arbitrary code
    ScriptEngine engine = new ScriptEngineManager().getEngineByName("javascript");
    String userScript = request.getParameter("script");
    if (userScript != null) {
        try {
            Object result = engine.eval(userScript);  // VIOLATION: Evaluating user input
            out.println("Script result: " + result);
        } catch (Exception e) {
            out.println("Error executing script: " + e.getMessage());
        }
    }
%>

<!-- ❌ VIOLATION: Using Runtime.exec() -->
<%
    // VIOLATION: Using Runtime.exec to execute system commands
    String command = "ls -la";
    try {
        Process process = Runtime.getRuntime().exec(command);  // VIOLATION: Executing system commands
        out.println("Command executed");
    } catch (Exception e) {
        out.println("Error executing command: " + e.getMessage());
    }
%>

<!-- ❌ VIOLATION: Using ProcessBuilder -->
<%
    // VIOLATION: Using ProcessBuilder to execute system commands
    try {
        ProcessBuilder processBuilder = new ProcessBuilder("ls", "-la");
        Process process = processBuilder.start();  // VIOLATION: Starting external process
        out.println("Process started");
    } catch (Exception e) {
        out.println("Error starting process: " + e.getMessage());
    }
%>

<!-- ✅ COMPLIANT: Safe alternatives -->
<div>
    <h3>Safe Alternatives:</h3>
    <ul>
        <li>Use predefined functionality instead of evaluating code</li>
        <li>Use a security manager to restrict permissions</li>
        <li>Use a whitelist of allowed commands</li>
        <li>Validate and sanitize all inputs</li>
    </ul>
</div>

</body>
</html>
