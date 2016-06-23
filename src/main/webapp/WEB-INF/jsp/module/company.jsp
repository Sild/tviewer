<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <jsp:include page="../common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/company.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/company.js"></script>
    <title>${module}</title>
</head>

<body>
<jsp:include page="../common/menu.jsp"/>

<div class="control-panel">
    <input type="button" id="show_add_entity_form" class="btn btn-success" value="Добавить компанию"/>


    <form method="GET" action="${pageContext.request.contextPath}/${module}/filter">

        <div class="input-group">
            <input type="text" class="form-control" name="name" placeholder="Название" value="${nameFilter}">
        <span class="input-group-btn">
          <button class="btn btn-secondary glyphicon glyphicon-search" type="submit"></button>
        </span>
        </div>
    </form>

</div>
<jsp:include page="../form/company.jsp"/>

<c:if test="${maxPage gt 1}">
    <jsp:include page="../common/paginator.jsp"/>
</c:if>
<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>Название</th>
        <th>Поданные тендеры</th>
        <th>Участвовали в</th>
        <th>Комментарий</th>
        <th>Цвет</th>
        <th>Действия</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="company" items="${companyList}">
        <tr data-id="${company.id}">
            <td class="company_name"><a
                    href="${pageContext.request.contextPath}/company/${company.id}/detail">${company.name}</a>
            </td>
            <td class="company_tenders">${fn:length(company.tenderSet)}</td>
            <td class="company_participations">${fn:length(company.memberSet)}</td>
            <td class="company_comment">${company.comment}</td>
            <td>
                <div class="company_color" style="background-color: ${company.color}; width: 30px;">&nbsp;</div>
            </td>
            <td>
                <span class="glyphicon glyphicon-edit edit_entity_btn"></span>
                <a href="${pageContext.request.contextPath}/company/${company.id}/delete"
                   onclick="if(!confirm('Вы действительно ходите удалить компанию <c:out
                           value="${company.name}"/>?')) return false;">
                    <span class="glyphicon glyphicon-remove"></span>
                </a>


            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>