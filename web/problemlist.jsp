<%--
  Created by IntelliJ IDEA.
  User: Dodd
  Date: 2015/7/5
  Time: 15:39
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
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/home.css" rel="stylesheet">
  <title>题目|DoddOJ</title>
  <script>
    $(document).ready(function(){
        $(".navbar-nav li").removeClass("active");
      $("#problempage").addClass("active");
    })
  </script>
</head>
<body>
<jsp:include page="toolpage/navbartop.jsp"></jsp:include>
<%! String type;%>
<%

  if(request.getParameter("type")!=null){
  type=request.getParameter("type");
    if(type.equals("1"))type="编程题";
    else if(type.equals("2"))type="结果填空";
    else if (type.equals("3"))type="代码填空";
    else type="编程题";
}else {
  type="编程题";
}%>
<div class="container" id="mainContainer">
  <div class="row">
      <h1 style="margin-bottom: 0px;"><%=type%></h1>
    <hr>
  </div>
  <div class="row">
  </div>
</div>
<jsp:include page="toolpage/footer.jsp"></jsp:include>
</body>
</html>
