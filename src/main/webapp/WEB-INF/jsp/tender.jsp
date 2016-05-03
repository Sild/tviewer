<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender.css">
    <title>platform</title>
</head>

<body>
<h1>Existing Tenders</h1>
<button id="show_add_tender_div">add new</button>

<div style="display: none" id="add_tender_div">
    <form:form method="POST" modelAttribute="tender" action="${pageContext.request.contextPath}/tender/add">
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
                <th></th>
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
                <td><form:input path="sum"/></td>
                <td>
                    <form:select path="state" items="${TenderState}"/>
                </td>
                <td><form:input path="direction"/></td>
                <td><form:input path="nomenclature"/></td>
                <td><form:input path="comment"/></td>
                <td><form:input path="tradeForm"/></td>
                <td><form:input path="startTimestamp"/></td>
                <td><form:input path="endTimestamp"/></td>
                <td><form:checkbox path="liked"/></td>
                <td><input type="submit" value="Add"/></td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>

<div style="display: none" id="edit_tender_div">
    <form:form method="POST" modelAttribute="tender" action="${pageContext.request.contextPath}/tender/edit">
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
                <td><form:input path="sum"/></td>
                <td>
                    <form:select path="state" items="${tenderStates}"/>
                </td>
                <td><form:input path="direction"/></td>
                <td><form:input path="nomenclature"/></td>
                <td><form:input path="comment"/></td>
                <td><form:input path="tradeForm"/></td>
                <td><form:input path="startTimestamp"/></td>
                <td><form:input path="endTimestamp"/></td>
                <td><form:input path="liked"/></td>
                <td>
                    <input type="submit" value="Save"/>
                    <input type="button" value="Cancel" id="cancel_edit_tender_div"/>
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
    <c:forEach var="tender" items="${tenderList}">
        <tr class="tender-info">
            <td class="tender_id">${tender.id}</td>
            <td class="tender_owner">${tender.owner.name}</td>
            <td class="tender_platform">${tender.platform.name}: ${tender.platform.site}</td>
            <td class="tender_sum">${tender.sum}</td>
            <td class="tender_state">${tender.state}</td>
            <td class="tender_direction">${tender.direction}</td>
            <td class="tender_nomenclature">${tender.nomenclature}</td>
            <td class="tender_comment">${tender.comment}</td>
            <td class="tender_trade_form">${tender.tradeForm}</td>
            <td class="tender_start_timestamp">${tender.startTimestamp}</td>
            <td class="tender_end_timestamp">${tender.endTimestamp}</td>
            <td class="tender_liked">
                <input type="checkbox" disabled
                        <c:if test="${tender.liked}">
                            checked
                        </c:if>
                        />
            </td>
            <td>
                <button class="edit_platform_btn">Edit</button>
                    <a href="${pageContext.request.contextPath}/tender/${tender.id}/detail">Detail</a><br/>
                <a href="${pageContext.request.contextPath}/tender/delete/${tender.id}">Delete</a><br/>
            </td>
        </tr>
        <%--<tr>--%>
                <%--<table class="table table-striped table-bordered table-sm">--%>
                    <%--<thead class="thead-inverse">--%>
                    <%--<tr>--%>
                        <%--<th>id</th>--%>
                        <%--<th>company</th>--%>
                        <%--<th>offer</th>--%>
                        <%--<th>winner</th>--%>
                        <%--<th>comment</th>--%>
                        <%--<th>submit_time</th>--%>
                        <%--<th>widthdrow_time</th>--%>
                    <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <%--<c:forEach var="member" items="${tender.memberList}">--%>
<%----%>
                        <%--<tr class="member-info">--%>
                            <%--<td class="member_id">${member.id}</td>--%>
                            <%--<td class="member_company">${member.company.name}</td>--%>
                            <%--<td class="member_offer">${member.offer}</td>--%>
                            <%--<td class="member_winner">${member.winner}</td>--%>
                            <%--<td class="member_comment">${member.comment}</td>--%>
                            <%--<td class="member_submit_timestamp">${member.submit_timestamp}</td>--%>
                            <%--<td class="member_widthdrow_timestamp">${member.widthdrow_timestamp}</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                    <%--</tbody>--%>
                <%--</table>--%>
        <%--</tr>--%>

    </c:forEach>
    </tbody>
</table>

<h2><a href="${pageContext.request.contextPath}/">Home</a></h2>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender.js"></script>
</body>
</html>