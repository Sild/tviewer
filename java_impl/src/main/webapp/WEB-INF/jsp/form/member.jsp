<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 03.06.16
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<form:form method="POST" class="update_member_form" modelAttribute="member"
           action="${pageContext.request.contextPath}/member/update" cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td>Компания <a class="add_company_fast" style="cursor: pointer;color: #337ab7;" herf="#">добавить</a></td>
            <td>
                <form:select path="company">
                    <form:option value="" label="Select ..."/>
                    <form:options items="${companyList}" itemLabel="name" itemValue="id"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>Допущен</td>
            <td><form:checkbox path="allowed"/></td>
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