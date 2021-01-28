<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户列表</title>
</head>
<body>
    <h3 align="center" >客户列表</h3>
    <table border="1" width="80%" align="center">
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>性别</th>
            <th>号码</th>
            <th>账号</th>
            <th>地址</th>
            <th>生日</th>
            <th>操作</th>
        </tr>
        <jsp:useBean id="pb" scope="request" type="domain.PageBean"/>
        <c:forEach items="${pb.beanList}" var="cstm">
        <tr>

            <td>${cstm.cid}</td>
            <td>${cstm.CName}</td>
            <td>${cstm.CSex}</td>
            <td>${cstm.CPhone}</td>
            <td>${cstm.CAccount}</td>
            <td>${cstm.CAddress}</td>
            <td>${cstm.birthday}</td>

            <td>
                <a href="<c:url value='/CustomerServlet?method=preEdit&cid=${cstm.cid}'/> ">编辑</a>
                <a href="<c:url value='/CustomerServlet?method=delete&cid=${cstm.cid}'/> ">删除</a>
            </td>
        </tr>
        </c:forEach>
    </table>
<br/>
<center>

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

    <input type="button" name="Submit" onclick="window.location.href = 'customer_query.jsp'" value="返回搜索">
    <input type="submit" onclick="javascript:window.location.reload();" value="刷新" id="btnVCode" />

</center>

</body>
</html>
