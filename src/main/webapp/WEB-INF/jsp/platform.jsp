<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/platform.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/platform.js"></script>
    <title>platform</title>
</head>

<body>
<jsp:include page="common/menu.jsp"/>

<button id="show_update_platform_form" class="btn btn-success">Добавить площадку</button>

<jsp:include page="form/platform.jsp"/>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>Название</th>
        <th>Сайт</th>
        <%--<th>Размещено Тендеров</th>--%>
        <th>Действия</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="platform" items="${platformList}">
        <tr data-id="${platform.id}">
            <td class="platform_name">${platform.name}</td>
            <td class="platform_site"><a href="${platform.site}" target="_blank">${platform.site}</a></td>
            <%--<td class="platform_tenders">${fn:length(platform.tenderSet)}</td>--%>
            <td>
                <span class="glyphicon glyphicon-edit edit_platform_btn"></span>
                <a href="${pageContext.request.contextPath}/platform/${platform.id}/delete"
                   onclick="if(!confirm('Вы действительно хотите удалить платформу <c:out
                           value="${platform.name}"/>?')) return false;">
                    <span class="glyphicon glyphicon-remove"></span>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>