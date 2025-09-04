<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Avoid Deep Nesting Example</title>
</head>
<body>

<!-- ❌ VIOLATION: Deep div nesting (5+ levels) -->
<div class="level1">
    <div class="level2">
        <div class="level3">
            <div class="level4">
                <div class="level5">
                    <p>Too deeply nested!</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ❌ VIOLATION: Deep table nesting -->
<table>
    <tr>
        <td>
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>Deeply nested table</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!-- ❌ VIOLATION: Deep form nesting -->
<form>
    <div>
        <fieldset>
            <div>
                <div>
                    <input type="text" />
                </div>
            </div>
        </fieldset>
    </div>
</form>

<!-- ❌ VIOLATION: Deep list nesting -->
<ul>
    <li>
        <ul>
            <li>
                <ul>
                    <li>
                        <ul>
                            <li>Too deep!</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
</ul>

<!-- ❌ VIOLATION: Deep JSTL nesting -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${condition1}">
        <c:choose>
            <c:when test="${condition2}">
                <c:choose>
                    <c:when test="${condition3}">
                        <p>Too deeply nested!</p>
                    </c:when>
                </c:choose>
            </c:when>
        </c:choose>
    </c:when>
</c:choose>

<!-- ❌ VIOLATION: Deep forEach nesting -->
<c:forEach var="item1" items="${list1}">
    <c:forEach var="item2" items="${list2}">
        <c:forEach var="item3" items="${list3}">
            <c:forEach var="item4" items="${list4}">
                <p>Too many nested loops!</p>
            </c:forEach>
        </c:forEach>
    </c:forEach>
</c:forEach>

<!-- ✅ COMPLIANT: Shallow nesting -->
<div class="container">
    <div class="content">
        <p>Good nesting level</p>
    </div>
</div>

</body>
</html>
