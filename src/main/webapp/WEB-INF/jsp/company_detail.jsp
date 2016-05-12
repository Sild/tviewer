<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <%@include file="/WEB-INF/html/lib_include/hightchart.html" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/company_detail.js"></script>
    <title>company</title>
</head>


</head>


<body>

<jsp:include page="common/menu.jsp" />


<h2>${company.name}</h2>
<input type="hidden" name="winCount" value="${winCount}"/>
<input type="hidden" name="looseCount" value="${looseCount}"/>
<input type="hidden" name="totalCount" value="${totalCount}"/>

<div id="company_member_statistic_div" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


<h3>Tenders ( ${fn:length(company.tenderSet)} )</h3>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
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
        <th>member count</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tender" items="${company.tenderSet}">
        <tr class="tender-info">
            <td class="tender_id">
                <a href="${pageContext.request.contextPath}/tender/${tender.id}/detail"
                   target="_blank">${tender.id}</a>

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
            <td class="tender_member_count">${fn:length(tender.memberSet)}</td>

        </tr>
    </c:forEach>
    </tbody>
</table>



<h3>Member ( ${winCount}/${totalCount}, rate ~= ${winRate}% )</h3>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>Tender</th>
        <th>offer</th>
        <th>winner</th>
        <th>comment</th>
        <th>submit_time</th>
        <th>withdrow_time</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${company.memberSet}">

        <tr class="member-info" style="background-color: ${member.company.color}">
            <td class="member_id">${member.id}</td>
            <td class="member_tender"><a href="${pageContext.request.contextPath}/tender/${member.tender.id}/detail">${member.tender.id}</a></td>
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
        </tr>

    </c:forEach>
    </tbody>
</table>

</body>
</html>
