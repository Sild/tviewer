<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 03.06.16
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<form:form method="POST" class="update_platform_form" modelAttribute="platform"
           action="${pageContext.request.contextPath}/platform/update" cssStyle="display: none">
    <table class="table table-sm">
        <tr>
            <td>Название</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Сайт</td>
            <td><form:input path="site"/></td>
        </tr>
    </table>
    <form:hidden path="id"/>
</form:form>