<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 23.05.16
  Time: 1:06
  To change this template use File | Settings | File Templates.
--%>
<form:form method="POST" class="update_company_form" modelAttribute="company"
           action="${pageContext.request.contextPath}/company/update" cssStyle="display: none">
    <table>
        <tr>
            <td><form:label path="name">Название компании</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="comment">Комментарий</form:label></td>
            <td><form:input path="comment"/></td>
        </tr>
        <tr>
            <td><form:label path="color">Цвет</form:label></td>
            <td><form:input path="color"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
</form:form>