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

<jsp:include page="common/menu.jsp"/>

<h2>${company.name}</h2>
<input type="hidden" name="winCount" value="${winCount}"/>
<input type="hidden" name="looseCount" value="${looseCount}"/>
<input type="hidden" name="totalCount" value="${totalCount}"/>

<div id="company_member_statistic_div" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


<h3>Заказывали: ${fn:length(company.tenderSet)}</h3>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>номер</th>
        <th>площадка</th>
        <th>сумма</th>
        <th>состояние</th>
        <th>направление</th>
        <th>нуменклатура</th>
        <th>комментарий</th>
        <th>форма торогов</th>
        <th>подан</th>
        <th>завершен</th>
        <th>избранное</th>
        <th>участников</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tender" items="${company.tenderSet}">
        <tr class="tender-info">
            <td class="tender_id">
                <a href="${pageContext.request.contextPath}/tender/${tender.id}/detail"
                   target="_blank">${tender.number}</a>

            <td class="tender_platform"><a href="${pageContext.request.contextPath}/platform/${tender.platform.id}"
                                           target="_blank">${tender.platform.name}</a></td>
            <td class="tender_sum"><fmt:formatNumber
                    value="${tender.sum}"
                    /></td>
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


<h3>Участвовали: побед = ${winCount}, проигрышей = ${totalCount}. Выигрышей в %: ${winRate}</h3>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>тендер</th>
        <th>сумма тендера</th>
        <th>сумма победителя</th>
        <th>предложение</th>
        <th>победитель</th>
        <th>комментарий</th>
        <th>подал</th>
        <th>отозвал</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${company.memberSet}">

        <tr class="member-info" style="background-color: ${member.company.color}">
            <td class="member_tender"><a
                    href="${pageContext.request.contextPath}/tender/${member.tender.id}/detail">${member.tender.number}</a>
            </td>
            <td class="member_tender_sum"><fmt:formatNumber
                    value="${member.tender.sum}"
                    /></td>
            <td class="member_tender_winner_offer">
                <c:forEach var="tenderMember" items="${member.tender.memberSet}">
                    <c:if test="${tenderMember.winner}">
                        <fmt:formatNumber
                                value="${tenderMember.offer}"
                                />

                        (<fmt:formatNumber
                            value="${tenderMember.offer - member.tender.sum}"
                            />)
                    </c:if>
                </c:forEach>

            </td>
            <td class="member_offer"><fmt:formatNumber
                    value="${member.offer}"
                    /> (<fmt:formatNumber
                    value="${member.offer - member.tender.sum}"
                    />)</td>
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
