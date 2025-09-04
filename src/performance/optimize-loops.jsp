<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Optimize Loops Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Nested loops -->
<%
    // ❌ VIOLATION: Nested for loops
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            out.println("i: " + i + ", j: " + j);
        }
    }
    
    // ❌ VIOLATION: Multiple levels of nesting
    for (int a = 0; a < 5; a++) {
        for (int b = 0; b < 5; b++) {
            for (int c = 0; c < 5; c++) {
                out.println("Triple nested: " + a + "," + b + "," + c);
            }
        }
    }
    
    // ❌ VIOLATION: for loop inside while loop
    int counter = 0;
    while (counter < 5) {
        for (int k = 0; k < 3; k++) {
            out.println("Mixed nesting: " + counter + "," + k);
        }
        counter++;
    }
%>

<!-- ✅ COMPLIANT: Optimized loops -->
<%
    // ✅ COMPLIANT: Single loop
    for (int i = 0; i < 100; i++) {
        out.println("Single loop: " + i);
    }
    
    // ✅ COMPLIANT: Sequential loops instead of nested
    for (int x = 0; x < 10; x++) {
        out.println("First loop: " + x);
    }
    
    for (int y = 0; y < 10; y++) {
        out.println("Second loop: " + y);
    }
%>

</body>
</html>
