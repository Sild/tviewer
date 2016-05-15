<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 10.05.16
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">TViewer</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="home"><a href="${pageContext.request.contextPath}/">Профиль</a></li>
            <li class="tender"><a href="${pageContext.request.contextPath}/tender">Тендеры</a></li>
            <li class="company"><a href="${pageContext.request.contextPath}/company">Компании</a></li>
            <li class="platform"><a href="${pageContext.request.contextPath}/platform">Платформы</a></li>
        </ul>
    </div>
</nav>
