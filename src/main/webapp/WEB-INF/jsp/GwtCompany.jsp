<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/GwtCompany.css">
    <title>GWT Example</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gwtcompany/gwtcompany.nocache.js"></script>
</head>
<body>
<iframe src="javascript:''" id="__gwt_historyFrame" tabIndex='-1' style="position:absolute;width:0;height:0;border:0"></iframe>
<noscript>
    <div style="width: 22em; position: absolute; left: 50%; margin-left: -11em; color: red; background-color: white; border: 1px solid red; padding: 4px; font-family: sans-serif">
        Your web browser must have JavaScript enabled
        in order for this application to display correctly.
    </div>
</noscript>

<h1>Добавление компании с помощью GWT</h1>

<table align="center">
    <tr>
        <td  style="font-weight:bold;">Заполните данные компании</td>
    </tr>
    <tr>
        <td>Название</td>
        <td id="nameContainer"></td>
    </tr>
    <tr>
        <td>Цвет</td>
        <td id="colorContainer"></td>
    </tr>
    <tr>
        <td>Комментарий</td>
        <td id="commentContainer"></td>
    </tr>
    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/company">все компании</a>
        </td>
        <td id="addContainer"></td>
    </tr>
</table>
</body>
</html>
