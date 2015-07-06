<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Calendar cld = Calendar.getInstance();
    cld.setTime(new Date());
    int nian = cld.get(Calendar.YEAR);
    int yue = cld.get(Calendar.MONTH);
    int ri = cld.get(Calendar.DATE);
    int si = cld.get(Calendar.HOUR_OF_DAY);
    int fen = cld.get(Calendar.MINUTE);
    int miao = cld.get(Calendar.SECOND);
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">DoddOJ</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../index.jsp">DoddOJ</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active" id="homepage"><a href="../home.jsp">主页</a></li>
                <li class="dropdown" id="problempage">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">题目 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../problemlist.jsp?type=1">编程题</a></li>
                        <li><a href="../problemlist.jsp?type=2">结果填空</a></li>
                        <li><a href="../problemlist.jsp?type=3">代码填空</a></li>
                    </ul>
                </li>
                <li id="statuspage"><a href="#about" >状态</a></li>
                <li id="contestpage"><a href="#about" >比赛</a></li>
                <li id="rankpage"><a href="#about" >排名</a></li>
                <li  id="aboutpage"><a href="../about.jsp">关于DoddOJ</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a id="showDateTime" style="color: white;"><%=nian%>年<%=yue+1%>月<%=ri%>日 <%=si%>:<%=fen%>:<%=miao%></a></li>
                <% if(session.getAttribute("loginId")!=null){
                    out.print("<li><a class=\"active\" href=\"/loginInfo.jsp\">"+session.getAttribute("loginId")+"</a></li>");
                    out.print("<li><a href=\"/logout\">退出登录</a></li>");
                }else {
                    out.print("<li><a href=\"/login.jsp\">登录</a></li>");
                }%>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<script>
    var   y   =   "<%=nian%>";
    var   m   =   "<%=yue%>";
    var   d   =   "<%=ri%>";
    var   h   =   "<%=si%>";
    var   f   =   "<%=fen%>";
    var   s   =   "<%=miao%>";
    //这句很重要
    //转换成js的日期格式
    //在此处填写服务器当前时间
    var now = new Date(y,m,d,h,f,s);
    function CurentTime(){
        var mm = now.getMinutes();
        var ss = now.getTime() % 60000;ss = (ss - (ss % 1000)) / 1000;
        var clock = now.getHours() +':';
        if (mm < 10) clock += '0';
        clock += mm+':';
        if (ss < 10) clock += '0';
        return(clock + ss);
    }
    function refresh(){
        document.getElementById("showDateTime").innerHTML = now.getFullYear()+"年"+(now.getMonth()+1)+"月"+now.getDate()+"日 "+ CurentTime();now.setSeconds(now.getSeconds()+1);}
    setInterval('refresh()',1000);
</script>