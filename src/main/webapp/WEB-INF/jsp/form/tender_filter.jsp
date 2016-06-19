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
<form:form method="GET" id="tender_filter_form" action="${pageContext.request.contextPath}/tender/filter"
           modelAttribute="tender_filter">
    <div class="input-group">
        <form:input path="number" type="text" class="form-control" placeholder="Номер" value="${TenderFilter.number}"/>
        <form:input path="member" type="text" class="form-control" placeholder="Участник"
                    value="${TenderFilter.member}"/>
        <form:input path="owner" id="owner_filter" type="text" class="form-control" placeholder="Заказчик"
                    value="${TenderFilter.owner}"/>
        <form:select path="state" class="form-control" id="state_filter">
            <form:option value="" label="Статус"/>
            <c:forEach items='${TenderState}' var='state'>
                <c:choose>
                    <c:when test="${state eq TenderFilter.state}">
                        <form:option value="${state}" selected="true" label="${state.value}"/>
                    </c:when>
                    <c:otherwise>
                        <form:option value="${state}" label="${state.value}"/>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
        <span>
          <button class="btn btn-secondary search-btn glyphicon glyphicon-search" type="submit"></button>
        </span>
        <span>
        <a href="${pageContext.request.contextPath}/tender/filter?liked=true"><input type="button"
                                                                                     value="Избранное"></a>
        </span>
    </div>


</form:form>