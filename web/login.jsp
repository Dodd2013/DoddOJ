<%--
  Created by IntelliJ IDEA.
  User: Dodd
  Date: 2015/7/4
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <meta name="description" content="login">
  <meta name="author" content="Dodd">

  <title>登录|DoddOJ</title>

  <!-- Bootstrap core CSS -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/signin.css" rel="stylesheet">
</head>

<body>
<% if(session.getAttribute("loginId")!=null){response.setContentType("text/html; charset=gb2312");response.sendRedirect("/loginInfo.jsp");} %>
<div class="container" id="mainContainer">
  <form class="form-signin" method="post" action="/login">
    <h2 class="form-signin-heading">登录</h2>
    <% if(request.getAttribute("errorinfo")!=null){
      out.print("<div class=\"alert alert-danger\" role=\"alert\">"+request.getAttribute("errorinfo")+"</div>");
    } %>
    <label for="inputEmail" class="sr-only">帐号（准考证号）</label>
    <input type="text" id="inputEmail" class="form-control" name="ID" placeholder="帐号（准考证号）" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" name="PassWord" class="form-control" placeholder="密码" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <p class="text-right">没有帐号？点击<a href="signin.jsp">注册</a></p>
  </form>

</div> <!-- /container -->
<jsp:include page="toolpage/footer.jsp"></jsp:include>
</body>
</html>
