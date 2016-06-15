<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: sild
  Date: 15.06.16
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>

<div id="pagination" align="center" style="background-color: rgba(135, 197, 222, 0.46); border-radius: 20px;">
    <c:if test="${page > 1}">
        <a href="#" data-page="${page - 1}" class="pn prev">Предыдущая</a>
    </c:if>

    <c:forEach begin="1" end="${maxPage}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <a href='#' data-page="${i.index}">${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${page + 1 <= maxPage}">
        <a href='#' data-page="${page + 1}" class="pn next">Следующая</a>
    </c:if>
</div>