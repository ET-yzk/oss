<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 align="center">编辑客户</h3>
<form action="<c:url value='/CustomerServlet'/>" method="post" >
    <input type="hidden" name="method" value="edit"/>
<%--    <input type="hidden" name="CAccount" value="${customer.CAccount}"/>--%>
    <input type="hidden" name="cid" value="${customer.cid}"/>
<%--    <input type="hidden" name="balance" value="${customer.balance}"/>--%>
<%--    <input type="hidden" name="CPwd" value="${customer.CPwd}"/>--%>

    <table border="0" align="center" width="40%" style="margin-left: 100px">
        <tr>
            <td width="100px">客户ID</td>
            <td width="40%">
                <input type="text" name="Cid" value="${customer.cid}" readonly>*只读
            </td>
        </tr>
        <tr>
            <td width="100px">客户名称</td>
            <td width="40%">
                <input type="text" name="CName" value="${customer.CName}"/>
            </td>
            <td align="left">
                <label id="nameError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td width="100px">客户账号</td>
            <td width="40%">
                <input type="text" name="CAccount" value="${customer.CAccount}">
            </td>
            <td>
                <label id="accountError" class="error">&nbsp;</label>
            </td>
        </tr>
        </tr>
        <tr>
            <td>客户性别</td>
            <td>
                <input type="radio" name="CSex" value="男" id="male" <c:if test="${customer.CSex eq '男'}">checked="checked"</c:if>/>
                <label for="male">男</label>
                <input type="radio" name="CSex" value="女" id="female" <c:if test="${customer.CSex eq '女'}">checked="checked"</c:if> />
                <label for="female">女</label>
            </td>
            <td>
                <label id="genderError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>手机</td>
            <td>
                <input type="text" name="CPhone" id="CPhone" value="${customer.CPhone}"/>
            </td>
            <td>
                <label id="phoneError" class="error">&nbsp;</label>
            </td>
        </tr>
<%--        <tr>--%>
<%--            <td>账号</td>--%>
<%--            <td>--%>
<%--                <input type="text" name="CPhone" id="CAccount" value="${customer.CAccount}"/>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <label id="accountError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
        <tr>
            <td>新密码</td>
            <td>
                <input type="text" name="CPwd" id="CPwd"/>
            </td>
            <td>
                <label id="pwdError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>生日</td>
            <td>
                <input type="text" name="birthday" id="birthday" value="${customer.birthday}"/>
            </td>
            <td>
                <label id="pbirError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>收货地址</td>
            <td>
                <textarea rows="5" cols="30" name="CAddress" id="CAddress">${customer.CAddress}</textarea>
            </td>
            <td>
                <label id="addressError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="submit" value="编辑客户"/>
                <input type="reset" name="reset"/>
            </td>
        </tr>
    </table>
</form>


</body>
</html>
