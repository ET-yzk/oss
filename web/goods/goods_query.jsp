<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/24
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询商品</title>
</head>
<body>
<h3 align="center">商品高级搜索</h3>
<form action="<c:url value="/GoodsServlet"/>" method="get">
    <input type="hidden" name="method" value="query">
<%--    <input type="hidden" name="gid" value="${goods.gid}"/>--%>
<%--    <input type="hidden" name="picture" value="${goods.picture}"/>--%>
<%--    <input type="hidden" name="introduce" value="${goods.introduce}"/>--%>
<%--    <input type="hidden" name="PPrice" value="${goods.PPrice}"/>--%>
<%--    <input type="hidden" name="SPrice" value="${goods.SPrice}"/>--%>
<%--    <input type="hidden" name="repertory" value="${goods.repertory}"/>--%>
<%--    <input type="hidden" name="promotion" value="${goods.GAddress}"/>--%>
<%--    <input type="hidden" name="saleNum" value="${goods.saleNum}"/>--%>

    <table border="0" align="center" width="40%" style="margin-left: 100px">
        <tr>
            <td width="100px">商品名称</td>
            <td width="40%">
                <input type="text" name="GName"/>
            </td>
        </tr>
        <tr>
            <td>商品类别</td>
            <td>
                <select name="kid">
                    <option value="">==请选择类别==</option>
                    <option value="01">零食类</option>
                    <option value="02">甜点类</option>
                    <option value="03">上衣类</option>
                    <option value="04">裤子类</option>
                    <option value="05">袜子类</option>
                    <option value="06">鞋子类</option>
                    <option value="07">电脑类</option>
                    <option value="08">鼠标类</option>
                    <option value="09">书籍类</option>
                    <option value="10">水果类</option>
                    <option value="00">不详</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>促销</td>
            <td>
                <input type="radio" name="promotion" value="y" id="male" <c:if test="${goods.promotion eq 'y'}">checked="checked"</c:if>/>
                <label for="male">是</label>
                <input type="radio" name="promotion" value="n" id="female" <c:if test="${goods.promotion eq 'n'}">checked="checked"</c:if> />
                <label for="female">否</label>
            </td>
        </tr>
        <tr>
        <tr>
            <td>状态</td>
            <td>
                <select name="GStatus">
                    <option value="">==请选择状态==</option>
                    <option value="在售">在售</option>
                    <option value="售罄">售罄</option>
                    <option value="下架">下架</option>
                </select>
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
