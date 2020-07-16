<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>
    <jsp:include page="../common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender_detail.css">


    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/select_autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender_detail.js"></script>
    <title>tender</title>
</head>

<body>
<jsp:include page="../common/menu.jsp"/>

<h2>Тендер</h2>
<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>Номер</th>
        <th>Заказчик</th>
        <th>Площадка</th>
        <th>Сумма</th>
        <th>Валюта</th>
        <th>Состояние</th>
        <th>Направление</th>
        <th>Нуменклатура</th>
        <th>Комментарий</th>
        <th>формат торгов</th>
        <th>начало</th>
        <th>завершение</th>
        <th>избранное</th>
    </tr>
    </thead>
    <tbody>
    <tr class="tender-info">
        <td class="tender_number">${tender.number}</td>
        <td class="tender_owner"><a
                href="${pageContext.request.contextPath}/company/${tender.owner.id}/detail" target="_blank">${tender.owner.name} </a>
        </td>
        <td class="tender_platform"><a href="${pageContext.request.contextPath}/platform/${tender.platform.id}"
                                       target="_blank">${tender.platform.name}</a></td>
        <td class="tender_sum"><fmt:formatNumber
                value="${tender.sum}"
                /></td>
        <td class="tender_currency">${tender.currency}</td>
        <td class="tender_state">${tender.state.value}</td>
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


<h2>Участники</h2>
<button id="show_update_member_form" class="btn btn-success">Добавить участника</button>

<jsp:include page="../form/member.jsp"/>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>Название</th>
        <th>Допущен</th>
        <th id="offer-order">Предложение</th>
        <th>Победитель</th>
        <th>Комментарий</th>
        <th>Подал</th>
        <th>Отозвал</th>
        <th>Действия</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${tender.memberSet}">
        <tr class="member-info
        <c:if test="${member.winner}">
                    winner
                    </c:if>" data-id="${member.id}">
            <td class="member_company"><a
                    href="${pageContext.request.contextPath}/company/${member.company.id}/detail" target="_blank">${member.company.name}</a>
            </td>
            <td class="member_allowed">
                <input type="checkbox" disabled
                        <c:if test="${member.allowed}">
                            checked
                        </c:if>
                        />
            </td>
            <td class="member_offer"><fmt:formatNumber
                    value="${member.offer}"
                    /></td>
            <td class="member_winner">
                <input type="checkbox" disabled
                        <c:if test="${member.winner}">
                            checked
                        </c:if>
                        />
            </td>
            <td class="member_comment">${member.comment}</td>
            <td class="member_submitDate"><fmt:formatDate value="${member.submitDate}" type="both"
                                                          pattern="dd-MM-yyyy"/></td>
            <td class="member_withdrowDate"><fmt:formatDate value="${member.withdrowDate}" type="both"
                                                            pattern="dd-MM-yyyy"/></td>
            <td>
                <span class="glyphicon glyphicon-edit edit_entity_btn"></span>
                <a href="${pageContext.request.contextPath}/member/${member.id}/delete"
                   onclick="if(!confirm('Вы действительно хотите удалить участника <c:out
                           value="${member.company.name}"/>?')) return false;">
                    <span class="glyphicon glyphicon-remove"></span>
                </a>
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>
<jsp:include page="../form/company.jsp"/>
</body>
</html>