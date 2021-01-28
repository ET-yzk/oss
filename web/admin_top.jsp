<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- 他的作用是为本页面所有的表单和超链接指定显示内容的框架-->
    <base target="main">
    <title>My JSP 'top_admin.jsp' starting page</title>
</head>
<body style="text-align: center;">
    <h1>在线购物管理系统</h1>
    <a href="<c:url value='/customer_add.jsp'/>">添加客户</a>
    <a href="<c:url value='/CustomerServlet?method=findAll'/>">查询客户</a>
    <a href="<c:url value='/customer_query.jsp'/>">客户高级搜索</a>
    <a>&nbsp;&nbsp;||&nbsp;&nbsp;</a>
    <a href="<c:url value='/goods/goods_add.jsp'/>">添加商品</a>
    <a href="<c:url value='/GoodsServlet?method=findAll'/>">查询商品</a>
    <a href="<c:url value='/goods/goods_query.jsp'/>">商品高级搜索</a>
    <a>&nbsp&nbsp;||&nbsp&nbsp;</a>
    <a href="<c:url value='/goods/shopping.jsp'/>">购买商品</a>

</body>
</html>
