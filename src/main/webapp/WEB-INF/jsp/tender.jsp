<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
    <%@include file="/WEB-INF/html/lib_include/datepicker.html" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender.js"></script>
    <title>tender</title>
</head>

<body>
<jsp:include page="menu.jsp" />

<button id="show_add_tender_div" class="btn btn-success">add new</button>

<form:form method="POST" class="add_entity_form" modelAttribute="tender"
           action="${pageContext.request.contextPath}/tender/add">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>owner</th>
            <th>platform</th>
            <th>sum</th>
            <th>state</th>
            <th>direction</th>
            <th>nomenclature</th>
            <th>comment</th>
            <th>trade form</th>
            <th>start time</th>
            <th>end time</th>
            <th>liked</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <form:select path="owner">
                    <form:option value="Select..."/>
                    <form:options items="${companyList}" itemValue="id" itemLabel="name"/>
                </form:select>
            </td>
            <td>
                <form:select path="platform">
                    <form:option value="Select..."/>
                    <form:options items="${platformList}" itemValue="id" itemLabel="name"/>
                </form:select>
            </td>
            <td><form:input size="10" path="sum"/></td>
            <td>
                <form:select path="state" items="${TenderState}"/>
            </td>
            <td><form:input size="10" path="direction"/></td>
            <td><form:input size="10" path="nomenclature"/></td>
            <td><form:input size="10" path="comment"/></td>
            <td><form:input size="10" path="tradeForm"/></td>
            <td><form:input class="datepicker startDate" size="10" path="startDate"/></td>
            <td><form:input class="datepicker endDate" size="10" path="endDate"/></td>
            <td><form:checkbox path="liked"/></td>
            <td><input type="submit" class="btn btn-default" value="Add"/></td>
        </tr>
        </tbody>
    </table>
</form:form>

<form:form method="POST" class="edit_entity_form" modelAttribute="tender"
           action="${pageContext.request.contextPath}/tender/edit">
    <table class="table table-sm">
        <thead class="thead-inverse">
        <tr>
            <th>owner</th>
            <th>platform</th>
            <th>sum</th>
            <th>state</th>
            <th>direction</th>
            <th>nomenclature</th>
            <th>comment</th>
            <th>trade form</th>
            <th>start time</th>
            <th>end time</th>
            <th>liked</th>
            <th>actions</th>
        </tr>
        </thead>
        <tbody>
        <tr>

            <td>
                <form:select path="owner" items="${companyList}" itemLabel="name" itemValue="id"/>
            </td>
            <td>
                <form:select path="platform" items="${platformList}" itemLabel="name" itemValue="id"/>
            </td>
            <td><form:input size="10" path="sum"/></td>
            <td>
                <form:select path="state" items="${TenderState}"/>
            </td>
            <td><form:input size="10" path="direction"/></td>
            <td><form:input size="10" path="nomenclature"/></td>
            <td><form:input size="10" path="comment"/></td>
            <td><form:input size="10" path="tradeForm"/></td>
            <td><form:input size="10" class="datepicker startDate" path="startDate"/></td>
            <td><form:input size="10" class="datepicker endDate" path="endDate"/></td>
            <td><form:checkbox path="liked"/></td>
            <td>
                <input type="submit" class="btn btn-default" value="Save"/>
                <input type="button" class="btn btn-default" value="Cancel" id="cancel_edit_tender_div"/>
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
        <th>owner</th>
        <th>platform</th>
        <th>sum</th>
        <th>state</th>
        <th>direction</th>
        <th>nomenclature</th>
        <th>comment</th>
        <th>trade form</th>
        <th>start time</th>
        <th>end time</th>
        <th>liked</th>
        <th>members</th>
        <th>actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tender" items="${tenderList}">
        <tr class="tender-info">
            <td class="tender_id">${tender.id}</td>
            <td class="tender_owner"><a href="${pageContext.request.contextPath}/company/${tender.owner.id}/detail"
                                        target="_blank">${tender.owner.name}</a></td>
            <td class="tender_platform"><a href="${pageContext.request.contextPath}/platform/${tender.platform.id}"
                                           target="_blank">${tender.platform.name}</a></td>
            <td class="tender_sum">${tender.sum}</td>
            <td class="tender_state">${tender.state}</td>
            <td class="tender_direction">${tender.direction}</td>
            <td class="tender_nomenclature">${tender.nomenclature}</td>
            <td class="tender_comment">${tender.comment}</td>
            <td class="tender_trade_form">${tender.tradeForm}</td>
            <td class="tender_start_timestamp"><fmt:formatDate value="${tender.startDate}" type="both"
                                                               pattern="dd-MM-yyyy"/></td>
            <td class="tender_end_timestamp"><fmt:formatDate value="${tender.endDate}" type="both"
                                                             pattern="dd-MM-yyyy"/></td>
            <td class="tender_liked">
                <input type="checkbox" disabled
                        <c:if test="${tender.liked}">
                            checked
                        </c:if>
                        />
            </td>
            <td class="tender_member_count"><a href="${pageContext.request.contextPath}/tender/${tender.id}/detail">${fn:length(tender.memberSet)}</a></td>

            <td>
                <button  class="edit_tender_btn btn btn-warning">Edit</button>
                <a href="${pageContext.request.contextPath}/tender/${tender.id}/delete"  onclick="if(!confirm('Do you really want to delete tender with id = ${tender.id}?')) return false;"><button  class="btn btn-danger">Delete</button></a>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>