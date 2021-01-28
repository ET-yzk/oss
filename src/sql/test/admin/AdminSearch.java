package sql.test.admin;

import java.sql.*;

import static sql.test.init.InitVar.*;
import static sql.test.init.InitVar.DB_PWD;

class AdminSearch {
    void ASearch() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs;
        try{
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,DB_USR,DB_PWD);

            // 执行查询
            System.out.println(" 实例化Statement对象...");
            stmt = conn.createStatement();
            String sql = "SELECT 商品编号, 商品状态, 商品销量 FROM user";
            rs = stmt.executeQuery(sql);

            // 展开结果集数据库
            while(rs.next()){
                // 通过字段检索
                String id  = rs.getString("商品编号");
                String name = rs.getString("商品状态");
                String phone = rs.getString("商品销量");

                // 输出数据
                System.out.print("ID: " + id);
                System.out.print(", 管理员姓名: " + name);
                System.out.print(", 电话: " + phone);
                System.out.print("\n");
            }
            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }
}
