<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Avoid Java Declarations Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: Java declaration used inside JSP -->
    <%! 
        int counter = 0;                      // VIOLATION: Class-level variable
        public String getGreeting(String name) {  // VIOLATION: Java method in JSP
            return "Hello, " + name;
        }
    %>
    <p><%= getGreeting("Keerthana") %></p>    <!-- VIOLATION: Uses declared method -->

    <!-- ✅ COMPLIANT: Java logic moved to controller/helper -->
    <!-- Controller:
        String greeting = greetingService.getGreeting("Keerthana");
        request.setAttribute("greeting", greeting);
    -->
    <p>${greeting}</p>

</body>
</html>
