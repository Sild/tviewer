<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/platform.js"></script>
    <title>platform</title>
</head>

<body>
<jsp:include page="common/menu.jsp"/>

<button id="show_update_platform_form" class="btn btn-success">Добавить площадку</button>

<form:form method="POST" class="update_platform_form" modelAttribute="platform"
           action="${pageContext.request.contextPath}/platform/update"  cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td>Название</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Сайт</td>
            <td><form:input path="site"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
</form:form>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>site</th>
        <th>tenders</th>
        <th>actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="platform" items="${platformList}">
        <tr>
            <td class="platform_id">${platform.id}</td>
            <td class="platform_name">${platform.name}</td>
            <td class="platform_site"><a href="${platform.site}" target="_blank">${platform.site}</a></td>
            <td class="platform_tenders">${fn:length(platform.tenderSet)}</td>
            <td>
                <button class="edit_platform_btn btn btn-warning">Редактировать</button>
                <a href="${pageContext.request.contextPath}/platform/${platform.id}/delete"
                   onclick="if(!confirm('Do you really want to delete platform with id = ${platform.id}?')) return false;">
                    <button class="btn btn-danger">Удалить</button>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>