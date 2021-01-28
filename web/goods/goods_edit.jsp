<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/24
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 align="center">编辑商品</h3>
<form action="<c:url value='/GoodsServlet'/>" method="post" >
    <input type="hidden" name="method" value="edit"/>
    <input type="hidden" name="gid" value="${goods.gid}"/>
    <input type="hidden" name="picture" value="${goods.picture}"/>
    <input type="hidden" name="introduce" value="${goods.introduce}"/>
    <input type="hidden" name="PPrice" value="${goods.PPrice}"/>
<%--    <input type="hidden" name="repertory" value="${goods.repertory}"/>--%>
    <input type="hidden" name="saleNum" value="${goods.saleNum}"/>

    <table border="0" align="center" width="40%" style="margin-left: 100px">
        <tr>
            <td width="100px">商品ID</td>
            <td width="40%">
                <input type="text" name="Gid" value="${goods.gid}" readonly>*只读
            </td>
        </tr>
        <tr>
            <td width="100px">商品名称</td>
            <td width="40%">
                <input type="text" name="GName" value="${goods.GName}"/>
            </td>
            <td align="left">
                <label id="nameError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td width="100px">库存</td>
            <td width="40%">
                <input type="text" name="repertory" value="${goods.repertory}">
            </td>
            <td>
                <label id="repertoryError" class="error">&nbsp;</label>
            </td>
        </tr>
        </tr>
        <tr>
            <tr>
                <td>商品类别</td>
                <td>
                    <select name="kid">
                        <option value="${goods.kid}">==默认值==</option>
                        <option value="01">零食类</option>
                        <option value="02">甜点类</option>
                        <option value="03">上衣类</option>
                        <option value="04">裤子类</option>
                        <option value="05">袜子类</option>
                        <option value="06">鞋子类</option>
                        <option value="07">电脑类</option>
                        <option value="08">鼠标类</option>
                        <option value="00">不详</option>
                    </select>
                </td>
            </tr>
        </tr>
        <tr>
            <td>促销</td>
            <td>
                <input type="radio" name="promotion" value="y" id="male" <c:if test="${goods.promotion eq 'y'}">checked="checked"</c:if>/>
                <label for="male">是</label>
                <input type="radio" name="promotion" value="n" id="female" <c:if test="${goods.promotion eq 'n'}">checked="checked"</c:if> />
                <label for="female">否</label>
            </td>
            <td>
                <label id="promotionError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>图片</td>
            <td>
                <input type="file" name="picture" id="picture" value="${goods.picture}"/>
            </td>
            <td>
                <label id="fileError" class="error">&nbsp;</label>
            </td>
        </tr>

        <tr>
        <tr>
            <td>状态</td>
            <td>
                <input type="text" name="GStatus" id="GStatus" value="${goods.picture}"/>
            </td>
            <td>
                <label id="statusError" class="error"> </label>
            </td>
        </tr>
        <tr>
            <td>售价</td>
            <td>
                <input type="text" name="SPrice" id="SPrice" value="${goods.SPrice}"/>
            </td>
            <td>
                <label id="SPriceError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>简介</td>
            <td>
                <textarea rows="5" cols="30" name="introduce" id="introduce">${goods.introduce}</textarea>
            </td>
            <td>
                <label id="introduceError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td>发货地</td>
            <td>
                <textarea rows="5" cols="30" name="GAddress" id="GAddress">${goods.GAddress}</textarea>
            </td>
            <td>
                <label id="addressError" class="error">&nbsp;</label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="submit" value="编辑商品"/>
                <input type="reset" name="reset"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
