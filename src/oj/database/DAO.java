package oj.database;

import oj.tool.MD5Util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Dodd on 2015/7/4.
 */
public class DAO {
    private static Connection conn = null;
    private static PreparedStatement pstmt=null;
    public static Connection getConnection(){
        try {
            if(conn==null||conn.isClosed()) {
                Context context = new InitialContext();
                DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
                conn = dataSource.getConnection();
            }else{
                return conn;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    public static void Signin(String id,String pawd ,String ip,String nick,String school,String email){
        getConnection();
        try{
            pstmt=conn.prepareStatement("INSERT INTO users VALUES(?,?,0,0,'N',?,NOW(), 1,1,?,NOW(),?,?,Null,NuLL)");
            pstmt.setString(1,id);
            pstmt.setString(2,email);
            pstmt.setString(3,ip);
            pstmt.setString(4,MD5Util.MD5(pawd));
            pstmt.setString(5,nick);
            pstmt.setString(6,school);
            pstmt.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static int LoginIn(String id,String pswd){     //1为正确 2为密码错误 3为账户不存在 4为数据库连接错误
        getConnection();
        try {
            pstmt=conn.prepareStatement("SELECT * FROM users WHERE user_id = ?");
            pstmt.setString(1,id);
            ResultSet res=pstmt.executeQuery();
            if(res.next()){
                if(res.getString("password").equals( MD5Util.MD5(pswd))){
                    pstmt=conn.prepareStatement("UPDATE users SET accesstime=NOW() WHERE user_id=?");
                    pstmt.setString(1,id);
                    pstmt.executeUpdate();
                    return 1;   //成功
                }else{
                    return 2;  //密码错误
                }
            }else{
                return 3;//不存在
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return 4;
    }
}
