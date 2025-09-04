<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>Secure File Operations Example</title>
</head>
<body>

<!-- ❌ VIOLATION: File operations using user input directly -->
<%
    String filename = request.getParameter("filename");
    
    // ❌ VIOLATION: Creating File with user input
    File file = new File(filename);
    
    // ❌ VIOLATION: FileInputStream with user input
    FileInputStream fis = new FileInputStream(request.getParameter("path"));
    
    // ❌ VIOLATION: FileOutputStream with user input  
    FileOutputStream fos = new FileOutputStream(request.getParameter("outputPath"));
    
    // ❌ VIOLATION: FileReader with user input
    FileReader fr = new FileReader(request.getParameter("readPath"));
    
    // ❌ VIOLATION: FileWriter with user input
    FileWriter fw = new FileWriter(request.getParameter("writePath"));
%>

<form method="post">
    <input type="text" name="filename" placeholder="Enter filename" />
    <input type="text" name="path" placeholder="Enter path" />
    <input type="submit" value="Process File" />
</form>

<!-- ✅ COMPLIANT: Safe file operations -->
<%
    // ✅ COMPLIANT: Validate and sanitize file paths
    String safeFilename = "uploads/safe-file.txt";
    File safeFile = new File(safeFilename);
    
    // ✅ COMPLIANT: Use predefined paths
    String configPath = "/WEB-INF/config/app.properties";
    FileInputStream configStream = new FileInputStream(configPath);
%>

</body>
</html>
