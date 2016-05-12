<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/company.js"></script>
    <title>company</title>
</head>

<body>
<jsp:include page="common/menu.jsp"/>

<button id="show_add_entity_form" class="btn btn-success">Добавить компанию</button>

<form:form method="POST" class="update_company_form" modelAttribute="company"
           action="${pageContext.request.contextPath}/company/update" cssStyle="display: none">
    <table>
        <tr>
            <td><form:label path="name">Название компании</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="comment">Комментарий</form:label></td>
            <td><form:input path="comment"/></td>
        </tr>
        <tr>
            <td><form:label path="color">Цвет</form:label></td>
            <td><form:input path="color"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
</form:form>


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
                <button class="edit_entity_btn btn btn-warning">Редактировать</button>
                <a href="${pageContext.request.contextPath}/company/${company.id}/delete"
                   onclick="if(!confirm('Вы действительно ходите удалить компанию <c:out value="${company.name}" />?')) return false;">
                    <button class="btn btn-danger">Удалить</button>
                </a>


            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>