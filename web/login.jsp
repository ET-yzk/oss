<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/24
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <style type="text/css">
        form {
            width: 100%;
            height: 700px;
            margin-top: 0px;
            background: #008B8B;
        }

        div {
            display: inline-block;
            padding-top: 80px;
            padding-right: 20px;

        }

        h3 {
            font-family: "微软雅黑";
            font-size: 40px;
            color: black;
        }

        #log {
            color: blue;
        }
    </style>
</head>
<body>
<script language="JavaScript">
    function MsgBox() {
        // var text = document.getElementById("login").value();
        alert("登入成功");
        window.open('frame.jsp');
        window.close();
    }
</script>
<%--<form action="<c:url value="/CustomerServlet"/>" method="get">--%>
<%--    <input type="hidden" name="method" value="login">--%>
<form name="login">
    <center>
        <div>
            <h1>
                优享&emsp;欢迎您！
            </h1>
            <p>
                用户名:<input type="text"/>
            </p>
            <p>
                密&emsp;码:<input type="password"/>
            </p>
            <p>
                身&emsp;份：
                <input type="radio" name="identity" value="admin" />管理员
                <input type="radio" name="identity" value="customer" checked="true"/>客户
            </p>
            <p>
<%--                <input id=log type="submit" value="登录"/>--%>
    <input type="button" value="登录" onclick="MsgBox()"/>
<%--    <input type="button" name="Submit" onclick="window.open('frame.jsp')" value="登录">--%>
            </p>
            <p>
                还没有账号？<a href="/register.jsp">立即注册</a>
            </p>
        </div>
    </center>
</form>
</body>
</html>