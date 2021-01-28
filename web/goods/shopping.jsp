<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/25
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品列表</title>
</head>
<body>
<h3 align="center" >商品列表</h3>
<table border="1" width="70%" align="center">
    <tr>
        <th>商品名</th>
        <th>商品类别</th>
        <th>发货地址</th>
        <th>售价</th>
        <th>总销量</th>
        <th>促销</th>
        <th>状态</th>
        <th>操作</th>
    </tr>

    <%--    <jsp:useBean id="pb" scope="request" type="domain.PageBean"/>--%>
    <c:forEach items="${pb.beanList}" var="goods">
        <tr>

            <td>${goods.GName}</td>
            <td>
                <c:if test="${goods.kid eq '01'}">零食类</c:if>
                <c:if test="${goods.kid eq '02'}">甜点类</c:if>
                <c:if test="${goods.kid eq '03'}">上衣类</c:if>
                <c:if test="${goods.kid eq '04'}">裤子类</c:if>
                <c:if test="${goods.kid eq '05'}">袜子类</c:if>
                <c:if test="${goods.kid eq '06'}">鞋子类</c:if>
                <c:if test="${goods.kid eq '07'}">电脑类</c:if>
                <c:if test="${goods.kid eq '08'}">鼠标类</c:if>
                    <%--                <c:if test="${goods.kid eq '01'}">是</c:if>--%>
            </td>
            <td>${goods.GAddress}</td>
            <td>${goods.SPrice}</td>
            <td>${goods.saleNum}</td>
            <td>
                <c:if test="${goods.promotion eq 'y'}">是</c:if>
                <c:if test="${goods.promotion eq 'n'}">否</c:if>
            </td>
            <td>${goods.GStatus}</td>


            <td>
                <a href="<c:url value='/GoodsServlet?method=buy&gid=${goods.GName}'/> ">立即购买</a>
                <a href="<c:url value='/GoodsServlet?method=addCart&gid=${goods.GName}'/> ">加入购物车</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
<center>
    <h1>暂未开放</h1>
    <c:if test="${pb.tp==0}">
        第1页/共1页
    </c:if>
    <c:if test="${pb.tp!=0}">
        第${pb.pc}页/共${pb.tp}页
        <%--        防止无结果时出错--%>
        <a href="${pb.url}&pc=1">首页</a>
    </c:if>
    <c:if test="${pb.pc>1}">
        <a href="${pb.url}&pc=${pb.pc-1}">上一页</a>
    </c:if>

    <c:choose>
        <c:when test="${pb.tp<=10}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${pb.tp}"/>
        </c:when>
        <c:otherwise>
            <c:set var="begin" value="${pb.pc-5}"/>
            <c:set var="end" value="${pb.pc+4}"/>
            <%--头溢出--%>
            <c:if test="${begin<1}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="10"/>
            </c:if>
            <%--尾溢出--%>
            <c:if test="${end>pb.tp}">
                <c:set var="end" value="${pb.tp}"/>
                <c:set var="begin" value="${pb.tp-9}"/>
            </c:if>
        </c:otherwise>
    </c:choose>

    <%--循环遍历页码列表--%>
    <c:forEach var="i" begin="${begin}" end="${end}">
        <c:choose>
            <c:when test="${i eq pb.pc}">
                [${i}]
            </c:when>
            <c:otherwise>
                <a href="${pb.url}&pc=${i}">[${i}]</a>
            </c:otherwise>
        </c:choose>

    </c:forEach>


    <c:if test="${pb.pc<pb.tp}">
        <a href="${pb.url}&pc=${pb.pc+1}">下一页</a>
    </c:if>
    <c:if test="${pb.tp!=0}">
        <%--        防止无结果时出错--%>
        <a href="${pb.url}&pc=${pb.tp}">尾页</a>
    </c:if>

    <input type="button" name="Submit" onclick="window.location.href = '/goods/goods_query.jsp'" value="搜索商品">
    <input type="submit" onclick="javascript:window.location.reload();" value="刷新" id="btnVCode" />
</center>
</body>
</html>
