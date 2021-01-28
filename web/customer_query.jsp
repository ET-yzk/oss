<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/23
  Time: 08：12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@RequestMapping(value = "/a2",produces = {"text/html;charset=UTF-8"})%>--%>
<html>
<head>
    <title>查询客户</title>
</head>
<body>
    <h3 align="center">客户高级搜索</h3>
    <form action="<c:url value="/CustomerServlet"/>" method="get">
        <input type="hidden" name="method" value="query">
        <table border="0" align="center" width="40%" style="margin-left: 100px">
            <tr>
                <td width="100px">客户名称</td>
                <td width="40%">
                    <input type="text" name="CName"/>
                </td>
            </tr>
            <tr>
                <td>客户性别</td>
                <td>
                    <select name="CSex">
                        <option value="">==请选择性别==</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
            </tr>
            <tr>
            <td>手机号码</td>
            <td>
                <input type="text" name="CPhone"/>
            </td>
            </tr>
            <tr>
                <td>账号</td>
                <td>
                    <input type="text" name="CAccount"/>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>

                    <input type="submit" value="搜索"/>
                    <input type="reset" value="重置"/>
                </td>
            </tr>

        </table>
    </form>

</body>
</html>
