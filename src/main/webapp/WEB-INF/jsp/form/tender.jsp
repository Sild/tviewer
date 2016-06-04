<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 03.06.16
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<form:form method="POST" class="update_tender_form" modelAttribute="tender"
           action="${pageContext.request.contextPath}/tender/update" cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td><form:label path="number">Номер</form:label></td>
            <td><form:input path="number" required="required"/></td>
        </tr>
        <tr>
            <td><form:label path="owner">Заказчик</form:label> <a class="add_company_fast" style="cursor: pointer;color: #337ab7;" href="#">добавить</a></td>
            <td>
                <form:select path="owner">
                    <form:option value="" label="Select ..."/>
                    <form:options items="${companyList}" itemLabel="name" itemValue="id"/>
                </form:select>
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