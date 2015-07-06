package oj.base;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import oj.database.DAO;
/**
 * Created by Dodd on 2015/7/4.
 */
public class Login extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("ID");
        String pswd=req.getParameter("PassWord");
        int flag=DAO.LoginIn(id,pswd);                 //检验密码
        if(flag==1){
            HttpSession session=req.getSession();
            if(id!=null)session.setAttribute("loginId",id);
            RequestDispatcher view=req.getRequestDispatcher("home.jsp");
            view.forward(req,resp);
        }else if(flag==2){
            req.setAttribute("errorinfo","密码错误！！！！");
            RequestDispatcher view=req.getRequestDispatcher("login.jsp");
            view.forward(req,resp);
        }else if(flag==3){
            req.setAttribute("errorinfo","账户不存在！！！！");
            RequestDispatcher view=req.getRequestDispatcher("login.jsp");
            view.forward(req,resp);
        }else if(flag==4){
            req.setAttribute("errorinfo","数据库连接错误！！！！");
            RequestDispatcher view=req.getRequestDispatcher("login.jsp");
            view.forward(req,resp);
        }else{
            req.setAttribute("errorinfo","未知错误！！！！");
            RequestDispatcher view=req.getRequestDispatcher("login.jsp");
            view.forward(req,resp);
        }

    }
}
