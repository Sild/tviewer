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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender_detail.css">
    <title>Tender Detail</title>
</head>

<body>
<h1>Tender id = ${tender.id}</h1>
<button id="show_add_member_div">add member</button>

<div style="display: none" id="add_member_div">
    <form:form method="POST" modelAttribute="member"
               action="${pageContext.request.contextPath}/member/add">
        <table class="table table-sm">
            <thead class="thead-inverse">
            <tr>
                <th>company</th>
                <th>offer</th>
                <th>winner</th>
                <th>comment</th>
                <th>submit</th>
                <th>withdrow</th>
                <th>actions</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <form:select path="company">
                        <c:forEach items="${companyList}" var="company">
                            <form:option value="${company.id}" label="${company.name}"/>
                        </c:forEach>
                    </form:select>
                </td>
                <td><form:input path="offer"/></td>
                <td>
                    <form:checkbox path="winner"/>
                </td>
                <td><form:input path="comment"/></td>
                <td><form:input path="submitTimestamp"/></td>
                <td><form:input path="withdrowTimestamp"/></td>
                <td><input type="submit" value="Add"/></td>
            </tr>
            </tbody>
        </table>
        <form:hidden path="tender" />
    </form:form>
</div>

<div style="display: none" id="edit_member_div">
    <form:form method="POST" modelAttribute="member" action="${pageContext.request.contextPath}/member/edit">
        <table class="table table-sm">
            <thead class="thead-inverse">
            <tr>
                <th>company</th>
                <th>offer</th>
                <th>winner</th>
                <th>comment</th>
                <th>submit</th>
                <th>withdrow</th>
                <th>actions</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <form:select path="company">
                        <c:forEach items="${companyList}" var="company">
                            <form:option value="${company.id}" label="${company.name}"/>
                        </c:forEach>
                    </form:select>
                </td>
                <td><form:input path="offer"/></td>
                <td>
                    <form:checkbox path="winner"/>
                </td>
                <td><form:input path="comment"/></td>
                <td><form:input path="submitTimestamp"/></td>
                <td><form:input path="withdrowTimestamp"/></td>
                <td><input type="submit" value="Add"/></td>
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
            <a href="${pageContext.request.contextPath}/platform/delete/${platform.id}">Delete</a><br/>
        </td>
    </tr>
    <tr>

    </tr>

    </tbody>
</table>

<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>company</th>
        <th>offer</th>
        <th>winner</th>
        <th>comment</th>
        <th>submit_time</th>
        <th>widthdrow_time</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${tender.memberList}">

        <tr class="member-info">
            <td class="member_company">${member.company.name}</td>
            <td class="member_offer">${member.offer}</td>
            <td class="member_winner">
                <input type="checkbox" disabled
                        <c:if test="${member.winner}">
                            checked
                        </c:if>
                        />
            </td>
            <td class="member_comment">${member.comment}</td>
            <td class="member_submit_timestamp">${member.submit_timestamp}</td>
            <td class="member_widthdrow_timestamp">${member.widthdrow_timestamp}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2><a href="${pageContext.request.contextPath}/">Home</a></h2>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender_detail.js"></script>
</body>
</html>