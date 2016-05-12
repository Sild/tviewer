<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<html>

<head>
    <jsp:include page="common/head.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender_detail.js"></script>
    <title>tender</title>
</head>

<body>
<jsp:include page="common/menu.jsp"/>

<h2>Тендер</h2>
<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>Номер</th>
        <th>Заказчик</th>
        <th>Площадка</th>
        <th>Сумма</th>
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
        <td class="tender_id">${tender.id}</td>
        <td class="tender_number">${tender.number}</td>
        <td class="tender_owner"><a
                href="${pageContext.request.contextPath}/company/${tender.owner.id}/detail">${tender.owner.name}</a>
        </td>
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


<h2>Участники</h2>
<button id="show_update_member_form" class="btn btn-success">Добавить участника</button>

<form:form method="POST" class="update_member_form" modelAttribute="member"
           action="${pageContext.request.contextPath}/member/update" cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td>Компания</td>
            <td><form:select path="company">
                <form:option value="" label="Select ..."/>
                <form:options items="${companyList}" itemLabel="name" itemValue="id"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Предложение</td>
            <td><form:input path="offer"/></td>
        </tr>
        <tr>
            <td>Победитель</td>
            <td><form:checkbox path="winner"/></td>
        </tr>
        <tr>
            <td>Комменатирй</td>
            <td><form:input path="comment"/></td>
        </tr>
        <tr>
            <td>Подал</td>
            <td><form:input class="datepicker" path="submitDate"/></td>
        </tr>
        <tr>
            <td>Отозвал</td>
            <td><form:input class="datepicker" path="withdrowDate"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
    <form:hidden path="tender" value="${tender.id}"/>
</form:form>


<table class="table table-striped table-bordered table-sm">
    <thead class="thead-inverse">
    <tr>
        <th>id</th>
        <th>Название</th>
        <th>Предложение</th>
        <th>Победитель</th>
        <th>Комментарий</th>
        <th>Подал</th>
        <th>Отозвал</th>
        <th>Действия</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${tender.memberSet}">

        <tr class="member-info"> <!--style="background-color: ${member.company.color}"-->
            <td class="member_id">${member.id}</td>
            <td class="member_company"><a
                    href="${pageContext.request.contextPath}/company/${member.company.id}/detail">${member.company.name}</a>
            </td>
            <td class="member_offer">${member.offer}</td>
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

                <button class="edit_entity_btn btn btn-warning">Редактировать</button>
                <a href="${pageContext.request.contextPath}/member/${member.id}/delete"
                   onclick="if(!confirm('Do you really want to delete member with id = ${member.id}?')) return false;">
                    <button class="btn btn-danger">Удалить</button>
                </a>
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>

</body>
</html>