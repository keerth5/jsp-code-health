<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Use StringBuffer Example</title>
</head>
<body>

<!-- ❌ VIOLATION: String concatenation in loops -->
<%
    // ❌ VIOLATION: Using += for string concatenation in for loop
    String result = "";
    for (int i = 0; i < 100; i++) {
        result += "Item " + i + ", ";
    }
    out.println(result);
    
    // ❌ VIOLATION: String concatenation in while loop
    String output = "";
    int counter = 0;
    while (counter < 50) {
        output += "Counter: " + counter + "\n";
        counter++;
    }
    
    // ❌ VIOLATION: Multiple concatenations in loop
    String data = "";
    for (int j = 0; j < 20; j++) {
        data += "Start";
        data += j;
        data += "End";
    }
%>

<!-- ✅ COMPLIANT: Using StringBuffer/StringBuilder -->
<%
    // ✅ COMPLIANT: Use StringBuilder for efficient concatenation
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < 100; i++) {
        sb.append("Item ").append(i).append(", ");
    }
    out.println(sb.toString());
    
    // ✅ COMPLIANT: StringBuffer for thread-safe operations
    StringBuffer buffer = new StringBuffer();
    for (int k = 0; k < 50; k++) {
        buffer.append("Value: ").append(k).append("\n");
    }
%>

</body>
</html>
