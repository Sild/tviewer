<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/platform.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/platform.css">
    <title>platform</title>
</head>

<body>
<jsp:include page="menu.jsp"/>

<button id="show_add_entity_form" class="btn btn-success">add new</button>

<form:form method="POST" class="add_entity_form" modelAttribute="platform"
           action="${pageContext.request.contextPath}/platform/add">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>Name</th>
            <th>Site</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="site"/></td>
            </td>
            <td><input type="submit" class="btn btn-default" value="Add"/></td>
        </tr>
        </tbody>
    </table>
</form:form>

<form:form method="POST" class="edit_entity_form" modelAttribute="platform"
           action="${pageContext.request.contextPath}/platform/edit">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>Name</th>
            <th>Site</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><form:input path="name"/></td>
            <td><form:input path="site"/></td>
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
                <button class="edit_platform_btn btn btn-warning">Edit</button>
                <a href="${pageContext.request.contextPath}/platform/${tender.id}/delete"
                   onclick="if(!confirm('Do you really want to delete platform with id = ${platform.id}?')) return false;">
                    <button class="btn btn-danger">Delete</button>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>