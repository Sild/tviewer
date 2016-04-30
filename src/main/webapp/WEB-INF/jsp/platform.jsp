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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/platform.css">
    <title>platform</title>
</head>

<body>
<h1>Existing Platforms</h1>
<button id="show_add_platform_div">add new</button>

<div style="display: none" id="add_platform_div">
    <form:form method="POST" modelAttribute="platform" action="${pageContext.request.contextPath}/platform/add">
        <table class="table table-sm">
            <thead class="thead-inverse">
            <tr>
                <th>Name</th>
                <th>Comment</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><form:input path="name"/></td>
                <td><form:input path="site"/></td>
                </td>
                <td><input type="submit" value="Add"/></td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>

<div style="display: none" id="edit_platform_div">
    <form:form method="POST" modelAttribute="platform" action="${pageContext.request.contextPath}/platform/edit">
        <table class="table table-sm">
            <thead class="thead-inverse">
            <tr>
                <th>Name</th>
                <th>Comment</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><form:input path="name"/></td>
                <td><form:input path="site"/></td>
                <td>
                    <input type="submit" value="Save"/>
                    <input type="button" value="Cancel" id="cancel_edit_platform_div"/>
                </td>
            </tr>
            </tbody>
        </table>
        <form:hidden path="id"/>
    </form:form>
</div>

<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>site</th>
        <th>actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="platform" items="${platformList}">
        <tr>
            <td class="platform_id">${platform.id}</td>
            <td class="platform_name">${platform.name}</td>
            <td class="platform_site">${platform.site}</td>
            <td>
                <button class="edit_platform_btn">Edit</button>
                <a href="${pageContext.request.contextPath}/platform/delete/${platform.id}">Delete</a><br/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2><a href="${pageContext.request.contextPath}/">Home</a></h2>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/platform.js"></script>
</body>
</html>