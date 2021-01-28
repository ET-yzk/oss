package sql.test;

import java.sql.*;
import sql.test.init.InitVar;

public class JDBC_Test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        //注册驱动
        Class.forName(InitVar.JDBC_DRIVER);
        //创建连接
        Connection conn= DriverManager.getConnection
                (InitVar.DB_URL,InitVar.DB_USR,InitVar.DB_PWD);
        //得到执行sql语句的Statement对象
        Statement stmt=conn.createStatement();
        //执行sql语句，并返回结果
        ResultSet rs=stmt.executeQuery("select * from Customer where CAccount = 000102");
        //处理结果
        while (rs.next()) {
            for (int i = 1; i <= 5; i++) {
                System.out.print(rs.getString(i) + "\t");
            }
            System.out.println();
        }
        //关闭资源
        rs.close();
        stmt.close();
        conn.close();
    }
}
