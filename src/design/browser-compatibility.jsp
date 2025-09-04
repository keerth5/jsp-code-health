<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Browser Compatibility Example</title>
    <!-- ✅ COMPLIANT: Modern meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h2>Browser Compatibility Example</h2>

<!-- ❌ VIOLATION: Using deprecated HTML tags -->
<center>This text is centered using deprecated tag</center>

<!-- ❌ VIOLATION: Using font tag -->
<font color="red" size="5">This text uses deprecated font tag</font>

<!-- ❌ VIOLATION: Using marquee tag -->
<marquee>This text is scrolling using deprecated marquee tag</marquee>

<!-- ❌ VIOLATION: Using applet tag -->
<applet code="HelloWorld.class" width="320" height="120">
    Java applet that displays "Hello, World!"
</applet>

<!-- ❌ VIOLATION: Using bgsound tag -->
<bgsound src="sound.mp3" loop="infinite">

<!-- ❌ VIOLATION: Using document.write -->
<script>
    document.write("This text was written using document.write()");
</script>

<!-- ✅ COMPLIANT: Modern alternatives -->
<div style="text-align: center;">This text is centered using CSS</div>

<p style="color: red; font-size: 18px;">This text uses CSS for styling</p>

<div class="scroll-container" style="overflow: auto; white-space: nowrap;">
    This text can be scrolled using CSS
</div>

<script>
    // Modern DOM manipulation
    const container = document.createElement('div');
    container.textContent = 'This text was added using modern DOM methods';
    document.body.appendChild(container);
</script>

<div>
    <h3>Best Practices for Browser Compatibility:</h3>
    <ul>
        <li>Use modern HTML5 elements and CSS3 properties</li>
        <li>Avoid deprecated tags and attributes</li>
        <li>Test across multiple browsers and devices</li>
        <li>Use feature detection instead of browser detection</li>
        <li>Consider using polyfills for newer features</li>
    </ul>
</div>

</body>
</html>
