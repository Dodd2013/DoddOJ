<%--
  Created by IntelliJ IDEA.
  User: Dodd
  Date: 2015/7/5
  Time: 9:29
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

  <title>注册|DoddOJ</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/signin.css" rel="stylesheet">
</head>
<body>
<div class="container" id="mainContainer">
  <form class="form-signin" method="post" action="/signin">
    <h2 class="form-signin-heading">注册</h2>
    <% if(request.getAttribute("errorinfo")!=null){
      out.print("<div class=\"alert alert-danger\" role=\"alert\">"+request.getAttribute("errorinfo")+"</div>");
    } %>
    <label for="inputid" class="sr-only">帐号</label>
    <input type="text" id="inputid" class="form-control" name="ID" placeholder="帐号（准考证号）" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" name="PassWord" class="form-control" placeholder="密码" required>
    <label for="reinputPassword" class="sr-only">重复密码</label>
    <input type="password" id="reinputPassword" name="rePassWord" class="form-control" placeholder="重复密码" required>
    <label for="inputnick" class="sr-only">昵称</label>
    <input type="text" id="inputnick" name="nick" class="form-control" placeholder="昵称" required>
    <label for="inputschool" class="sr-only">学校</label>
    <input type="text" id="inputschool" name="school" class="form-control" placeholder="学校" required>
    <label for="inputemail" class="sr-only">邮箱</label>
    <input type="email" id="inputemail" name="email" class="form-control" placeholder="邮箱" required>
    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
    <p class="text-right">已有帐号？请戳<a href="login.jsp">登录</a></p>
  </form>
</div> <!-- /container -->
<jsp:include page="toolpage/footer.jsp"></jsp:include>
</body>
</html>
