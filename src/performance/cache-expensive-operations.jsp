<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cache Expensive Operations Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Expensive operations in loops -->
<%
    // ❌ VIOLATION: Math operations in for loop
    for (int i = 0; i < 100; i++) {
        double sqrt = Math.sqrt(i);
        double pow = Math.pow(i, 2);
        double random = Math.random();
        double abs = Math.abs(i);
        double log = Math.log(i + 1);
        double exp = Math.exp(i);
        out.println("Value: " + sqrt);
    }
    
    // ❌ VIOLATION: Network operations in while loop
    int count = 0;
    while (count < 10) {
        // Simulated expensive operations
        count++;
    }
%>

<!-- ✅ COMPLIANT: Cache expensive operations outside loops -->
<%
    // ✅ COMPLIANT: Calculate once, use many times
    double cachedSqrt = Math.sqrt(144);
    double cachedPow = Math.pow(12, 2);
    
    for (int i = 0; i < 100; i++) {
        out.println("Cached value: " + cachedSqrt);
    }
%>

</body>
</html>
