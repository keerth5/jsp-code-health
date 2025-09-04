<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Minimize Object Creation Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Object creation in loops -->
<%
    // ❌ VIOLATION: Creating new objects in for loop
    for (int i = 0; i < 100; i++) {
        Date newDate = new Date();
        String newString = new String("Hello");
        ArrayList newList = new ArrayList();
        HashMap newMap = new HashMap();
        out.println("Created object: " + newDate);
    }
    
    // ❌ VIOLATION: Object creation in while loop
    int count = 0;
    while (count < 50) {
        StringBuilder sb = new StringBuilder();
        Vector v = new Vector();
        count++;
    }
%>

<!-- ✅ COMPLIANT: Minimize object creation -->
<%
    // ✅ COMPLIANT: Create objects once, reuse
    Date sharedDate = new Date();
    StringBuilder reusableBuilder = new StringBuilder();
    
    for (int i = 0; i < 100; i++) {
        reusableBuilder.setLength(0); // Reset instead of creating new
        reusableBuilder.append("Value: ").append(i);
        out.println(reusableBuilder.toString());
    }
%>

</body>
</html>
