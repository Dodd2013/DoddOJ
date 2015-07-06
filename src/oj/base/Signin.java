package oj.base;

import oj.database.DAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Dodd on 2015/7/5.
 */
public class Signin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("ID");
        String pawd=req.getParameter("PassWord");
        String repawd=req.getParameter("rePassWord");
        String nick=req.getParameter("nick");
        String school=req.getParameter("school");
        String email=req.getParameter("email");
        String checke = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern regex = Pattern.compile(checke);
        Matcher matcher = regex.matcher(email);
        boolean check=false;
        if(id==null||pawd.equals("")||repawd.equals("")||nick==null||school==null||email==null){
            req.setAttribute("errorinfo","发生了什么，我也不知道了！(+﹏+)~狂晕~~~");
        }else if(id.length()<4||id.length()>16){
            req.setAttribute("errorinfo","你的帐号长度有点奇怪！ 4-16位 ●▽●");
        }else if(!pawd.equals(repawd)){
            System.out.print(pawd+"   "+repawd);
            req.setAttribute("errorinfo", "嘿，你两遍密码不一样啊！︿(￣︶￣)︽(￣︶￣)︿飞.飞.飞.");
        }else if(pawd.length()<4||pawd.length()>20){
            req.setAttribute("errorinfo","密码不要太短也不要太长哦 o(∩_∩)o  4-20位！");
        }else if(nick.length()>20){
            req.setAttribute("errorinfo","昵称太长，别逗我~>_<~+");
        }else if(nick.length()<2){
            req.setAttribute("errorinfo","昵称太短，这可是VIP特权哦(*^__^*) 嘻嘻");
        }else if(school.length()==0){
            req.setAttribute("errorinfo","你是不是蓝翔毕业的！！");
        }else if (!matcher.matches()){
            req.setAttribute("errorinfo","请写正确的邮箱啊，喂！");
        }else {                    //注册成功
            check=true;
            HttpSession session=req.getSession();
            String ip=req.getRemoteAddr();
            DAO.Signin(id, pawd, ip, nick, school, email);
            session.setAttribute("loginId",id);
            RequestDispatcher view=req.getRequestDispatcher("home.jsp");
            view.forward(req,resp);
        }
        if (!check){
            RequestDispatcher view=req.getRequestDispatcher("signin.jsp");
            view.forward(req,resp);

        }

    }
}
