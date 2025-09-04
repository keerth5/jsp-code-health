<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mobile Responsive Design Example</title>
    <!-- ✅ COMPLIANT: Viewport meta tag for responsive design -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Responsive CSS */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px;
        }
        
        .responsive-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        img {
            max-width: 100%;
            height: auto;
        }
        
        /* Media queries for different screen sizes */
        @media (max-width: 768px) {
            .responsive-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
        }
        
        @media (max-width: 480px) {
            .responsive-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Mobile Responsive Design Example</h1>
    
    <h2>Responsive Design Features</h2>
    <ul>
        <li>Viewport meta tag for proper scaling</li>
        <li>Fluid grid layout using CSS Grid</li>
        <li>Responsive images that scale with their containers</li>
        <li>Media queries for different screen sizes</li>
        <li>Flexible units (%, em, rem) instead of fixed pixels</li>
    </ul>
    
    <h2>Sample Responsive Grid</h2>
    <div class="responsive-grid">
        <div class="card">
            <h3>Card 1</h3>
            <p>This card will resize based on screen width.</p>
        </div>
        <div class="card">
            <h3>Card 2</h3>
            <p>The grid layout adjusts automatically.</p>
        </div>
        <div class="card">
            <h3>Card 3</h3>
            <p>On mobile, cards stack vertically.</p>
        </div>
        <div class="card">
            <h3>Card 4</h3>
            <p>Responsive design improves user experience.</p>
        </div>
    </div>
    
    <h2>Responsive Image Example</h2>
    <img src="placeholder-image.jpg" alt="Responsive image example">
    
    <h2>Best Practices for Mobile-First Design</h2>
    <ol>
        <li>Always include the viewport meta tag</li>
        <li>Design for mobile first, then expand for larger screens</li>
        <li>Use relative units and flexible layouts</li>
        <li>Test on multiple devices and screen sizes</li>
        <li>Optimize images and resources for mobile</li>
        <li>Consider touch interactions and button sizes</li>
    </ol>
</div>

<%-- Example of non-responsive page (for demonstration only) --%>
<%-- 
<html>
<head>
    <title>Non-Responsive Page</title>
    <!-- ❌ VIOLATION: Missing viewport meta tag -->
    <style>
        .fixed-width-container {
            width: 960px;  /* Fixed width, not responsive */
            margin: 0 auto;
        }
        .fixed-column {
            width: 300px;  /* Fixed width columns */
            float: left;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <div class="fixed-width-container">
        <div class="fixed-column">Column 1</div>
        <div class="fixed-column">Column 2</div>
        <div class="fixed-column">Column 3</div>
    </div>
</body>
</html>
--%>

</body>
</html>
