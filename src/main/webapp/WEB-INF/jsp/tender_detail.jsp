<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender_detail.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.js"></script>
    <%@include file="/WEB-INF/html/lib_include/datepicker.html" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender_detail.js"></script>
    <title>tender detail</title>
</head>

<body>
<h2>Tender</h2>


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
    </tr>
    </thead>
    <tbody>
    <tr class="tender-info">
        <td class="tender_id">${tender.id}</td>
        <td class="tender_owner">${tender.owner.name}</td>
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
    </tr>
    <tr>

    </tr>

    </tbody>
</table>
<h2>Members</h2>
<button id="show_add_entity_form">add member</button>
<form:form method="POST" class="add_entity_form" modelAttribute="member"
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
                    <form:option value="Select..."/>
                    <form:options items="${companyList}" itemLabel="name" itemValue="id"/>
                </form:select>
            </td>
            <td><form:input size="10" path="offer"/></td>
            <td>
                <form:checkbox path="winner"/>
            </td>
            <td><form:input size="10" path="comment"/></td>
            <td><form:input size="10" class="datepicker submitDate" path="submitDate"/></td>
            <td><form:input size="10" class="datepicker withdrowDate" path="withdrowDate"/></td>
            <td><input type="submit" value="Add"/></td>
        </tr>
        </tbody>
    </table>
    <form:hidden path="tender" value="${tender.id}"/>
</form:form>

<form:form method="POST" class="edit_entity_form" modelAttribute="member"
           action="${pageContext.request.contextPath}/member/edit">
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
                <form:select path="company" items="${companyList}" itemLabel="name" itemValue="id"/>
            </td>
            <td><form:input size="10" path="offer"/></td>
            <td>
                <form:checkbox path="winner"/>
            </td>
            <td><form:input size="10" path="comment"/></td>
            <td><form:input size="10" class="datepicker submitDate" path="submitDate"/></td>
            <td><form:input size="10" class="datepicker withdrowDate" path="withdrowDate"/></td>
            <td>
                <input type="submit" value="Save"/>
                <input type="button" value="Cancel" id="cancel_edit_entity_form"/>
            </td>
        </tr>
        </tbody>
    </table>
    <form:hidden path="id"/>
    <form:hidden path="tender" value="${tender.id}"/>
</form:form>


<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>company</th>
        <th>offer</th>
        <th>winner</th>
        <th>comment</th>
        <th>submit_time</th>
        <th>withdrow_time</th>
        <th>actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${tender.memberList}">

        <tr class="member-info" style="background-color: ${member.company.color}">
            <td class="member_id">${member.id}</td>
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
            <td class="member_submit_timestamp"><fmt:formatDate value="${member.submitDate}" type="both"
                                                                pattern="dd-MM-yyyy"/></td>
            <td class="member_widthdrow_timestamp"><fmt:formatDate value="${member.withdrowDate}" type="both"
                                                                   pattern="dd-MM-yyyy"/></td>
            <td>
                <button class="edit_entity_btn">Edit</button>
                <a href="${pageContext.request.contextPath}/member/delete/${member.id}">Delete</a><br/>
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>

<p><a href="${pageContext.request.contextPath}/tender">Tenders</a></p>

<p><a href="${pageContext.request.contextPath}/">Home</a></p>

</body>
</html>