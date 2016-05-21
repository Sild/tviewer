<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<html>

<head>
    <jsp:include page="common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tender.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/select_autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/tender.js"></script>
    <title>tender</title>
</head>

<body>
<jsp:include page="common/menu.jsp"/>

<div class="control-panel">
    <input type="button" id="show_update_tender_form" class="btn btn-success" value="Добавить тендер"/>


    <form method="GET" action="${pageContext.request.contextPath}/tender/filter">

        <div class="input-group">
            <input type="text" class="form-control" name="number" placeholder="Номер" value="${numberFilter}">
        <span class="input-group-btn">
          <button class="btn btn-secondary glyphicon glyphicon-search" type="submit"></button>
        </span>
        </div>
    </form>

</div>

<form:form method="POST" class="update_tender_form" modelAttribute="tender"
           action="${pageContext.request.contextPath}/tender/update" cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td><form:label path="number">Номер</form:label></td>
            <td><form:input path="number"/></td>
        </tr>
        <tr>
            <td><form:label path="owner">Заказчик</form:label></td>
            <td><form:select path="owner" items="${companyList}" itemLabel="name" itemValue="id"/>
            </td>
        </tr>

        <tr>
            <td><form:label path="sum">Сумма</form:label></td>
            <td><form:input path="sum"/></td>
        </tr>
        <tr>
            <td><form:label path="currency">Валюта</form:label></td>
            <td><form:select path="currency" items="${CurrencyType}"/></td>
        </tr>
        <tr>
            <td><form:label path="state">Состояние</form:label></td>
            <td><form:select path="state" items="${TenderState}" itemLabel="value"/></td>

        </tr>
        <tr>
            <td><form:label path="direction">Направление</form:label></td>
            <td><form:input path="direction"/></td>
        </tr>
        <tr>
            <td><form:label path="nomenclature">Номенклатура</form:label></td>
            <td><form:input path="nomenclature"/></td>
        </tr>
        <tr>
            <td><form:label path="comment">Комментарий</form:label></td>
            <td><form:input path="comment"/></td>
        </tr>
        <tr>
            <td><form:label path="tradeForm">Формат</form:label></td>
            <td><form:input path="tradeForm"/></td>
        </tr>
        <tr>
            <td><form:label path="startDate">Начало</form:label></td>
            <td><form:input class="datepicker" path="startDate"/></td>
        </tr>
        <tr>
            <td><form:label path="endDate">Окончание</form:label></td>
            <td><form:input class="datepicker" path="endDate"/></td>
        </tr>
        <tr>
            <td><form:label path="platform">Площадка</form:label></td>
            <td><form:select path="platform" items="${platformList}" itemLabel="name" itemValue="id"/>
            </td>
        </tr>
        <tr>
            <td><form:label path="liked">Избранное</form:label></td>
            <td><form:checkbox path="liked"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
</form:form>

<table class="table table-striped table-bordered table-sm tablesorter">
    <thead class="thead-inverse">
    <tr>
        <th>Номер</th>
        <th>Площадка</th>
        <th>Участники</th>
        <th>Сумма</th>
        <th>Валюта</th>
        <th>Состояние</th>
        <th>Направление</th>
        <th>Номенклатура</th>
        <th>Комментарии</th>
        <th>Форма торгов</th>
        <th>Начало</th>
        <th>Окончание</th>
        <th>Заказчик</th>
        <th>Избранное</th>
        <th>Действия</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="tender" items="${tenderList}">
        <tr class="tender-info" data-id="${tender.id}">
            <td class="tender_number">${tender.number}</td>
            <td class="tender_platform"><a href="${pageContext.request.contextPath}/platform/${tender.platform.id}"
                                           target="_blank">${tender.platform.name}</a></td>

            <td class="tender_member_count"><a
                    href="${pageContext.request.contextPath}/tender/${tender.id}/detail">посмотреть ${fn:length(tender.memberSet)}</a>
            </td>

            <td class="tender_sum"><fmt:formatNumber
                    value="${tender.sum}"
                    /></td>
            <td class="tender_currency">${tender.currency}</td>
            <td class="tender_state">${tender.state.getValue()}</td>
            <td class="tender_direction">${tender.direction}</td>
            <td class="tender_nomenclature">${tender.nomenclature}</td>
            <td class="tender_comment">${tender.comment}</td>
            <td class="tender_trade_form">${tender.tradeForm}</td>
            <td class="tender_start_date"><fmt:formatDate value="${tender.startDate}" type="both"
                                                          pattern="dd-MM-yyyy"/></td>
            <td class="tender_end_date"><fmt:formatDate value="${tender.endDate}" type="both"
                                                        pattern="dd-MM-yyyy"/></td>
            <td class="tender_owner"><a href="${pageContext.request.contextPath}/company/${tender.owner.id}/detail"
                                        target="_blank">${tender.owner.name}</a></td>
            <td class="tender_liked">
                <input type="checkbox" disabled
                        <c:if test="${tender.liked}">
                            checked
                        </c:if>
                        />
            </td>


            <td>
                <button class="edit_tender_btn btn btn-warning">Редактировать</button>
                <a href="${pageContext.request.contextPath}/tender/${tender.id}/delete"
                   onclick="if(!confirm('Вы действительно хотите удалить тендер ${tender.number}?')) return false;">
                    <button class="btn btn-danger">Удалить</button>
                </a>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>