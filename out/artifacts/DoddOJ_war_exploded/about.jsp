<%--
  Created by IntelliJ IDEA.
  User: Dodd
  Date: 2015/7/5
  Time: 14:35
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
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/home.css" rel="stylesheet">
  <title>关于DoddOJ</title>
  <script>
    $(document).ready(function(){
      $(".navbar-nav li").removeClass("active");
      $("#aboutpage").addClass("active");
    })
  </script>
</head>
<body>
<jsp:include page="toolpage/navbartop.jsp"></jsp:include>
<div class="container" id="mainContainer">
  <div class="row">
    <h1>关于DoddOJ</h1>
    <hr/>
  </div>
  <div class="row">
    <article>
      <h3>相关说明</h3>
      <p>本系统采用HUSTOJ开源评判内核，用jsp做前端，经过改造后更符合蓝桥模式，在后期将加入更多功能！！</p>
      <h3>编译环境</h3>
      <p>c/c++: Centos gcc/g++<br>java:jdk1.7</p>
      <h3>制作人员</h3>
      <p>目前只有我自己╭∩╮(︶︿︶)╭∩╮</p>
      <h3>联系方式</h3>
      <p><a href="emailto:Dodd@Dodd2014.com">Dodd@Dodd2014.com</a></p>
    </article>
  </div>
</div>
<jsp:include page="toolpage/footer.jsp"></jsp:include>
</body>
</html>
