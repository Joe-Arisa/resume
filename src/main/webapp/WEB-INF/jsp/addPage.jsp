<%--
  Created by IntelliJ IDEA.
  User: 扬
  Date: 2020/8/22
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="/user/add">
        <input placeholder="姓名" type="text" name="username">
        <input type="password" name="pwd">
        <button type="submit">提交</button>
    </form>
</body>
</html>
