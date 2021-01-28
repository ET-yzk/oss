<%--
  Created by IntelliJ IDEA.
  User: 15817
  Date: 2021/1/26
  Time: 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<input type="button" value="登入" onclick="MsgBox()"/>
<script language="JavaScript">
    var yearObj = null;
    var monthObj = null;
    var dayObj = null;

    function showBirthDay() {
        yearObj = document.tableForm.selectYear;
        monthObj = document.tableForm.selectMonth;
        dayObj = document.tableForm.selectDay;
        //清空年份下拉列表的数据
        yearObj.options.length = 0;
        monthObj.options.length = 0;
        dayObj.options.length = 0;
        for(var i = 1900; i < 2012; i++) {
            //$("<option value="+i+">"+i+"</option>").appendTo(yearObj);
            var year = new Option(i,i);
            yearObj.options.add(year);
        }
        for(var i = 1; i <= 12; i++) {
            var month = new Option(i,i);
            monthObj.options.add(month);
        }
        for(var i = 1; i <= 31; i++) {
            var day = new Option(i,i);
            dayObj.options.add(day);
        }

    }

    //当月份改变时，日期也会随着改变。
    function changeMonth() {

        yearObj = document.tableForm.selectYear;
        monthObj = document.tableForm.selectMonth;
        dayObj = document.tableForm.selectDay;

        dayObj.options.length = 0;
        var month = monthObj.value;
        var year = yearObj.value;
        //如果是4，6，9，11月，就有30天
        if(month == 4 || month == 6 || month == 9 || month == 11){
            for(var i = 1; i <= 30; i++) {
                var day = new Option(i,i);
                dayObj.options.add(day);
            }
        }
        //如果是2月，则
        else if(month == 2) {
            if((year%4==0 && year%100!=0) || year%400==0) {
                for(var i = 1; i <= 29; i++) {
                    var day = new Option(i,i);
                    dayObj.options.add(day);
                }
            }else {
                for(var i = 1; i <= 28; i++) {
                    var day = new Option(i,i);
                    dayObj.options.add(day);
                }
            }
        }
        //其他月份都是31天
        else {
            for(var i = 1; i <= 31; i++) {
                var day = new Option(i,i);
                dayObj.options.add(day);
            }
        }
    }

    function MsgBox() {
        // var text = document.getElementById("login").value();
        alert("登入成功");
        window.open('frame.jsp');
        window.close();
    }
</script>
<!--引用JS代码以达到弹出对话框目的 结束-->
</script>
<td height="40" align="right">出生年月：</td>
<td><select name="selectYear" id="selectYear" onChange="changeMonth()">

</select>
    年
    <select name="selectMonth" id="selectMonth" onChange="changeMonth()">

    </select>
    月
    <select name="selectDay" id="selectDay">

    </select>
    日</td>
</body>
</html>
