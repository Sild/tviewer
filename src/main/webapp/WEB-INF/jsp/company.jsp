<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/modify_entity_form.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/company.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/company.css">
    <title>company</title>
</head>

<body>
<jsp:include page="menu.jsp"/>

<button id="show_add_entity_form" class="btn btn-success">add new</button>

<form:form method="POST" class="add_entity_form" modelAttribute="company"
           action="${pageContext.request.contextPath}/company/add">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>Name</th>
            <th>Comment</th>
            <th>Color</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="comment"/></td>
            <td><form:input path="color"/>
            </td>
            <td><input type="submit" class="btn btn-default" value="Add"/></td>
        </tr>
        </tbody>
    </table>
</form:form>

<form:form method="POST" class="edit_entity_form" modelAttribute="company"
           action="${pageContext.request.contextPath}/company/edit">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>Name</th>
            <th>Comment</th>
            <th>Color</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="comment"/></td>
            <td><form:input path="color"/>
            </td>
            <td>
                <input type="submit" class="btn btn-default" value="Save"/>
                <input type="button" class="btn btn-default" value="Cancel" id="cancel_edit_entity_form"/>
            </td>
        </tr>
        </tbody>
    </table>
    <form:hidden path="id"/>
</form:form>

<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>comment</th>
        <th>color</th>
        <th>actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="company" items="${companyList}">
        <tr>


            <td class="company_id">${company.id}</td>
            <td class="company_name"><a
                    href="${pageContext.request.contextPath}/company/${company.id}/detail">${company.name}</a>
            </td>
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