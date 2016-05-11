<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/modify_entity_form.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
    <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"
            integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/company.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/company.css">
    <title>company</title>
</head>

<body>
<jsp:include page="menu.jsp"/>

<button id="show_add_entity_form" class="btn btn-success">add new</button>

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


<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
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
        <tr>
            <td class="company_id">${company.id}</td>

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
                <button class="edit_entity_btn btn btn-warning">Edit</button>
                <a href="${pageContext.request.contextPath}/company/${company.id}/delete"
                   onclick="if(!confirm('Do you really want to delete company with id = ${company.id}?')) return false;">
                    <button class="btn btn-danger">Delete</button>
                </a>


            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>