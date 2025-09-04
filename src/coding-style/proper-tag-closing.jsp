<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Proper Tag Closing Example</title>
</head>
<body>

    <!-- ❌ VIOLATION: <p> tag not closed -->
    <p>Welcome, ${userName}               <!-- VIOLATION -->

    <!-- ❌ VIOLATION: <div> not closed, and <ul> closed before <li> -->
    <div>
        <ul>
            <li>Item 1
            <li>Item 2
        </ul>                             <!-- VIOLATION: <li> tags not closed properly -->
    <!-- Missing </div> -->               <!-- VIOLATION -->

    <!-- ❌ VIOLATION: Improper self-closing <br> -->
    <br>                                  <!-- VIOLATION: Should be <br /> for XHTML -->

    <!-- ✅ COMPLIANT: All tags properly closed -->
    <p>Welcome, ${userName}</p>

    <div>
        <ul>
            <li>Item A</li>
            <li>Item B</li>
        </ul>
    </div>

    <br />

    <!-- ✅ COMPLIANT: <img> and <input> properly self-closed -->
    <img src="logo.png" alt="Logo" />
    <input type="text" name="username" />

</body>
</html>
