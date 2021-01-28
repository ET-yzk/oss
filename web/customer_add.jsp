<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/22
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户添加</title>
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
<!--
    JavaScript校验要求：
    1.每一项都必须填写内容或者做出选择，不能存在空项；+++++++++


    2.用户名：只能包含英文字母和下划线，长度为6-18个字符；++++++++


    3.密码：必须包含英文字母大小写和数字，长度不能少于6个字符；++++++
    4.确认密码：必须与密码相同；


    5.联系电话：确保手机号码的有效性；+++++++++
    6.电子邮箱：确保电子邮箱的有效性；+++++++++

    7.如果用户没有按照以上要求输入信息，则当光标离开该项时，在该项的右侧用红色字体给出相应的提示信息。++++++
-->
<script>
    // 用户名
    function YHMonblus(){
        var username=document.getElementById("username");
        // var reN =/^\d{6,18}$/;
        // var re = /^[a-zA-Z_]{6,18}$/;
        if(username.value==""){
            document.getElementById('YHMerror').innerText="请输入用户名";
        }
        else if(username.value.length < 2 ||username.value.length > 18){
            console.log(username.value);
            document.getElementById('YHMerror').innerText="格式错误,长度应为2-18个字符";
        }
        // else if(!re.test(username.value)){
        //
        //     document.getElementById('YHMerror').innerText="格式错误,只能包含英文字母和下划线";
        // }
        else {
            document.getElementById('YHMerror').innerText ="";
        }
    }
    function YHMonfocu(){
        document.getElementById('YHMerror').innerText = "";
    }
    // 密码
    function MMonblus(){
        var password=document.getElementById("password");
        var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
        // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(password.value==""){
            document.getElementById('MMerror').innerText="请输入密码";
        }
        else if(password.value.length < 6 || password.value.length > 12){
            document.getElementById('MMerror').innerText="格式错误,,密码长度应为6-12位";
        }
        else if(!re.test(password.value)){
            document.getElementById('MMerror').innerText="格式错误,必须包含英文字母大小写和数字";
        }
        else {
            document.getElementById('MMerror').innerText ="";
        }
    }
    function MMonfocu(){
        document.getElementById('MMerror').innerText = "";
    }

    // 确认密码
    function QRMMonblus(){
        var password=document.getElementById("password");
        var confirmPassword=document.getElementById("confirmPassword");
        if(confirmPassword.value==""){
            document.getElementById('QRMMerror').innerText="请输入确认密码";
        }
        else if(password.value != confirmPassword.value){
            document.getElementById('QRMMerror').innerText="两次密码输入不一致";
        }
        else {
            document.getElementById('QRMMerror').innerText ="";
        }
    }
    function QRMMonfocu(){
        document.getElementById('QRMMerror').innerText = "";
    }

    // 账号
    function ZHonblus(){
        var account=document.getElementById("CAccount");
        var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
        // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(account.value==""){
            document.getElementById('ZHerror').innerText="请输入账号";
        }
        else if(account.value.length < 6 || account.value.length > 12){
            document.getElementById('ZHerror').innerText="格式错误,账号长度应为6-12位";
        }
        else if(!re.test(account.value)){
            document.getElementById('ZHerror').innerText="格式错误,必须包含英文字母大小写和数字";
        }
        else {
            document.getElementById('ZHerror').innerText ="";
        }
    }
    function ZHonfocu(){
       document.getElementById('ZHerror').innerText ="";
    }


    // 联系电话
    function LXDHonblus(){
        var phone=document.getElementById("CPhone");
        var re = /^[1][356789][0-9]{9}$/;//^1\d{10}$
        if(phone.value==""){
            document.getElementById('LXDHerror').innerText="请输入联系电话";
        }
        else if(!re.test(phone.value)){
            document.getElementById('LXDHerror').innerText="电话格式输入错误";
        }
        else {
            document.getElementById('LXDHerror').innerText ="";
        }
    }
    function LXDHonfocu(){
        document.getElementById('LXDHerror').innerText = "";
    }
    // // 电子邮箱
    // function DZYXonblus(){
    //     var email=document.getElementById("email");
    //     var re= /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
    //     if(email.value==""){
    //         document.getElementById('DZYXerror').innerText="请输入电子邮箱";
    //     }
    //     else if(!re.test(email.value)){
    //         document.getElementById("DZYXerror").innerHTML="邮箱格式不正确";
    //     }
    //     else {
    //         document.getElementById('DZYXerror').innerText ="";
    //     }
    // }
    // function DZYXonfocu(){
    //     document.getElementById('DZYXerror').innerText = "";
    // }
    //生日 待精确

    // function isdate(matchArray){
    //     var intDay = matchArray[3];
    //     var intMonth = matchArray[2];
    //     var intYear = matchArray[1];
    //
    //     if(isNaN(intYear)||isNaN(intMonth)||isNaN(intDay)) return false;
    //     if(intMonth>12||intMonth<1) return false;
    //     if ( intDay<1||intDay>31)return false;
    //     if((intMonth==4||intMonth==6||intMonth==9||intMonth==11)&&(intDay>30)) return false;
    //     if(intMonth==2){
    //         if(intDay>29) return false;
    //         if((((intYear%100==0)&&(intYear%400!=0))||(intYear%4!=0))&&(intDay>28))return false;
    //     }
    //     return true;
    // }
    function SRonblus(){
        var bir=document.getElementById("birthday");
        var re = /^([0-9]{4})-([0-1][0-9])-([0-3][0-9])$/;
        if(bir.value==""){
            document.getElementById('SRerror').innerText="请输入生日";
        }
        else if(!re.test(bir.value)){
            document.getElementById('SRerror').innerText="生日输入错误";
        }
        else {
            document.getElementById('SRerror').innerText ="";
        }
        // var matchArray=(bir.value()).match(/^([0-9]{4})-([0-1][0-9])-([0-3][0-9])$/);
        // if(matchArray==null){
        //     document.getElementById('SRerror').innerText="请输入生日";
        // }
        // else if (!isdate((matchArray))){
        //     document.getElementById('SRerror').innerText="生日格式输入错误";
        // }
        // else {
        //     document.getElementById('SRerror').innerText ="";
        // }
    }
    function SRonfocu(){
        document.getElementById('SRerror').innerText = "";
    }

    //收货地址 待精确
    function SHDZonblus(){
        var address=document.getElementById("CAddress");
        if(address.value==""){
            document.getElementById('SHDZerror').innerText="请输入收货地址";
        }
        else {
            document.getElementById('SHDZerror').innerText ="";
        }
    }
    function SHDZonfocu(){
        document.getElementById('SHDZerror').innerText = "";
    }

</script>

<body>
<h3 align="center">客户添加</h3>
<form action="<c:url value='/CustomerServlet'/>" method="post">
    <input type="hidden" name="method" value="add">
    <table border="0" align="center" width="45%" style="margin-left: 110px">
        <div>
            <label>用户名</label>
            <input type="text" id="username" name="CName" className="inputText" placeholder="请输入用户名" onFocus="YHMonfocu()"
                   onBlur="YHMonblus()"/>
            <span id="YHMerror">
        </span>
        </div>
        <div>
            <label>账号</label>
            <input type="text" id="CAccount" name="CAccount" className="inputText" placeholder="请输入账号" onFocus="ZHonfocu()"
                   onBlur="ZHonblus()"/>
            <span id="ZHerror">
        </span>
        </div>
        <div>
            <label>密码</label>
            <input type="password" id="password" name="CPwd" className="inputText" placeholder="请输入密码" onFocus="MMonfocu()"
                   onBlur="MMonblus()"/>
            <span id="MMerror">
        </span>
        </div>
        <div>
            <label>确认密码</label>
            <input type="password" id="confirmPassword" name="pwdTmp" className="inputText" placeholder="请确认密码" onFocus="QRMMonfocu()"
                   onBlur="QRMMonblus()"/>
            <span id="QRMMerror">
        </span>
        </div>
        <div>
            <label>性别</label>
            <input type="radio" name="CSex" value="男" checked="true"/>男
            <input type="radio" name="CSex" value="女"/>女
            <span id="XBerror">
        </span>
        </div>

        <div>
            <label>联系电话</label>
            <input type="text" id="CPhone" name="CPhone" className="inputText" placeholder="请输入联系电话" onFocus="LXDHonfocu()"
                   onBlur="LXDHonblus()"/>
            <span id="LXDHerror">
        </span>
        </div>
        <div>
            <label>生日</label>
            <input type="text" id="birthday" name="birthday" className="inputText" placeholder="格式：YYYY-MM-DD" onFocus="SRonfocu()"
                   onBlur="SRonblus()"/>
            <span id="SRerror">
        </span>
        </div>
        <div>
            <label>收货地址</label>
            <textarea rows="5" cols="30" name="CAddress" id="CAddress" onFocus="SHDZonfocu()" onBlur="SHDZonblus()" placeholder="请输入收货地址"></textarea>
            <span id="SHDZerror">
        </span>
            <td>
                <label id="addressError" class="error">&nbsp;</label>
            </td>
        </div>

<%--        <div>--%>
<%--            <label>电子邮箱</label>--%>
<%--            <input type="email" id="email" className="inputText" placeholder="请输入您的电子邮箱" onFocus="DZYXonfocu()"--%>
<%--                   onBlur="DZYXonblus()"/>--%>
<%--            <span id="DZYXerror">--%>
<%--        </span>--%>
<%--        </div>--%>

<%--        <tr>--%>
<%--            <td width="100px">客户名称</td>--%>
<%--            <td width="40%">--%>
<%--                <input type="text" name="name"/>--%>
<%--            </td>--%>
<%--            <td align="left">--%>
<%--                <label id="nameError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>客户性别</td>--%>
<%--            <td>--%>
<%--                <input type="radio" name="CSex" value="male" id="male"/>--%>
<%--                <label for="male">男</label>--%>
<%--                <input type="radio" name="CSex" value="female" id="female"/>--%>
<%--                <label for="female">女</label>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <label id="genderError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>

<%--        <tr>--%>
<%--            <td>手机</td>--%>
<%--            <td>--%>
<%--                <input type="text" name="phone" id="phone"/>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <label id="phoneError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>密码</td>--%>
<%--            <td>--%>
<%--                <input type="text" name="pwd" id="pwd"/>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <label id="pwdError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>收货地址</td>--%>
<%--            <td>--%>
<%--                <textarea rows="5" cols="30" name="CAddress"></textarea>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <label id="addressError" class="error">&nbsp;</label>--%>
<%--            </td>--%>
<%--        </tr>--%>

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
