<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>主页</title>
</head>
<frameset rows="20%,*">
    <frame src="<c:url value='/admin_top.jsp'/>" name="top"/>
    <frame src="<c:url value='/welcome.jsp'/>" name="main"/>
<%--    <frame src="<c:url value='/login.jsp'/>" name="welcome"/>--%>
</frameset>
</html>
