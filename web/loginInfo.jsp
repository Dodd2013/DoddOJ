<%--
  Created by IntelliJ IDEA.
  User: Dodd
  Date: 2015/7/5
  Time: 12:35
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
  <meta name="description" content="DoddOJ">
  <meta name="author" content="Dodd">
  <title>个人信息|DoddOJ</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/loginInfo.css">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<% if(session.getAttribute("loginId")==null){RequestDispatcher view= request.getRequestDispatcher("login.jsp"); request.setAttribute("errorinfo","你还没登录呀！");view.forward(request,response);}%>
<jsp:include page="./toolpage/navbartop.jsp"></jsp:include>
<div class="container" id="mainContainer">
  <div class="row">
    <div class="col-lg-4">
      <h1>欢迎你，<%= session.getAttribute("loginId")%></h1>
    </div>
  </div>
</div>
<jsp:include page="toolpage/footer.jsp"></jsp:include>
</body>
</html>
