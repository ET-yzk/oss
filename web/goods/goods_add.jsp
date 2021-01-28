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
    <title>商品添加</title>
</head>
<style>
    form{
        width: 700px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid black;
    }
    div{
        padding: 5px 0;
    }
    label{
        display: inline-block;
        width: 100px;
        margin-right: 40px;
        text-align: right;
    }
    span{
        color: #FF0000;
        font-size:12px
    }
    .inputText{
        display: inline-block;
        width: 260px;
        margin-right: 20px;
    }
</style>

<script>
    // 商品名
    function SPMonblus(){
        var name=document.getElementById("GName");
        if(name.value==""){
            document.getElementById('SPMerror').innerText="请输入商品名";
        }
        else {
            document.getElementById('SPMerror').innerText ="";
        }
    }
    function SPMonfocu(){
        document.getElementById('SPMerror').innerText = "";
    }
    // 库存
    function KConblus(){
        var repertory=document.getElementById("repertory");

        if(repertory.value==""){
            document.getElementById('KCerror').innerText="请输入库存";
        }
        else if (repertory.value/1 < 0) {
            document.getElementById('KCerror').innerText="库存需大于等于零";
        }
        else {
            document.getElementById('KCerror').innerText ="";
        }
    }
    function KConfocu(){
        document.getElementById('KCerror').innerText = "";
    }

    // 进价
    function JJonblus(){
        var PPrice=document.getElementById("PPrice");

        if(PPrice.value==""){
            document.getElementById('JJerror').innerText="请输入进价";
        }
        else if(PPrice.value/1 < 1){
            document.getElementById('JJerror').innerText="进价需大于零";
        }
        else {
            document.getElementById('JJerror').innerText ="";
        }
    }
    function JJonfocu(){
        document.getElementById('JJerror').innerText ="";
    }

    // 售价
    function SJonblus(){
        var SPrice=document.getElementById("SPrice");
        var PPrice=document.getElementById("PPrice");

        if(SPrice.value==""){
            document.getElementById('SJerror').innerText="请输入进价";
        }
        else if(SPrice.value/1 < 1){
            document.getElementById('SJerror').innerText="进价需大于零";
        }
        else if (SPrice.value/1 < PPrice.value/1) {
            document.getElementById('SJerror').innerText="注意，售价小于进价，这不合理";
        }
        else {
            document.getElementById('SJerror').innerText ="";
        }
    }
    function SJonfocu(){
        document.getElementById('SJerror').innerText ="";
    }

    // 商品简介
    function SPJJonblus(){
        var introduce=document.getElementById("introduce");
        if(introduce.value==""){
            document.getElementById('SPJJerror').innerText="请输入商品简介";
        }
        else {
            document.getElementById('SPJJerror').innerText ="";
        }
    }
    function SPJJonfocu(){
        document.getElementById('SPJJerror').innerText = "";
    }

    //发货地址 待精确
    function FHDZonblus(){
        var address=document.getElementById("GAddress");
        if(address.value==""){
            document.getElementById('FHDZerror').innerText="请输入发货地址";
        }
        else {
            document.getElementById('FHDZerror').innerText ="";
        }
    }
    function FHDZonfocu(){
        document.getElementById('FHDZerror').innerText = "";
    }

</script>

<body>
<h3 align="center">商品添加</h3>
<form action="<c:url value='/GoodsServlet'/>" method="post">
    <input type="hidden" name="method" value="add">
    <table border="0" align="center" width="45%" style="margin-left: 110px">
        <div>
            <label>商品名</label>
            <input type="text" id="GName" name="GName" className="inputText" placeholder="请输入商品名" onFocus="YHMonfocu()"
                   onBlur="SPMonblus()"/>
            <span id="SPMerror">
        </span>
        </div>
        <div>
            <label>商品类别</label>
            <select name="kid">
                <option value="00">==默认值==</option>
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
            </select>
        </div>
        <div>
            <label>库存</label>
            <input type="text" id="repertory" name="repertory" className="inputText" placeholder="请输入商品库存" onFocus="KConfocu()"
                   onBlur="KConblus()"/>
            <span id="KCerror">
        </span>
        </div>
        <div>
            <label>进价</label>
            <input type="PPrice" id="PPrice" name="PPrice" className="inputText" placeholder="请确认进价" onFocus="JJonfocu()"
                   onBlur="JJonblus()"/>
            <span id="JJerror">
        </span>
        </div>
        <div>
            <label>售价</label>
            <input type="SPrice" id="SPrice" name="SPrice" className="inputText" placeholder="请确认售价" onFocus="SJonfocu()"
                   onBlur="SJonblus()"/>
            <span id="SJerror">
        </span>
        </div>
        <div>
            <label>促销</label>
            <input type="radio" name="promotion" value="n" checked="true"/>否
            <input type="radio" name="promotion" value="y"/>是
            <span id="XBerror">
        </span>
        </div>

        <div>
            <label>状态</label>
            <select name="GStatus">
                <option value="">==请选择状态==</option>
                <option value="在售">在售</option>
                <option value="售罄">售罄</option>
                <option value="下架">下架</option>
            </select>
            <span id="statuserror">
        </span>
        </div>
        <div>
            <label>图片</label>
            <input type="file" id="picture" name="picture"/>
            <span id="TPerror">
        </span>
        </div>
        <div>
            <label>商品简介</label>
            <textarea rows="2" cols="30" name="introduce" id="introduce" onFocus="SPJJonfocu()" onBlur="SPJJonblus()" placeholder="请输入商品简介"></textarea>
            <span id="SPJJerror">
        </span>
            <td>
                <label id="introduceError" class="error">&nbsp;</label>
            </td>
        </div>
        <div>
            <label>发货地址</label>
            <textarea rows="2" cols="30" name="GAddress" id="GAddress" onFocus="FHDZonfocu()" onBlur="FHDZonblus()" placeholder="请输入发货地址"></textarea>
            <span id="FHDZerror">
        </span>
            <td>
                <label id="addressError" class="error">&nbsp;</label>
            </td>
        </div>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="submit"/>
                <input type="reset" name="reset"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
