<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="color:green;" align="center">${msg}</h1>
<input type="button" name="Submit" onclick="javascript:history.go(-1);" value="继续该操作">
<input type="button" name="Submit" onclick="window.location.href = 'frame.jsp'" value="返回到首页">
</body>
</html>
