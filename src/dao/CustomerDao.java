package dao;

import MD5_InEncrypt.ChangeToMD5;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import domain.Customer;
import domain.PageBean;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao
{
    private final QueryRunner qr = new TxQueryRunner();

    public void add(Customer c) {
        try {
            c.setCid(CommonUtils.uuid());
            c.setBalance("0");
            String sql = "insert into Customer values(?,?,?,?,?,?,?,?,?)";
            Object[] params = {c.getCid(), c.getCName(), c.getCPhone(),
                    c.getCAccount(), ChangeToMD5.stringToMD5(c.getCPwd()), c.getCAddress(), c.getBalance(), c.getCSex(),c.getBirthday()};
//            c.getAll();
            qr.update(sql, params);
        }catch (Exception e)
        {
            System.out.println("创建用户出错啦");
            System.out.println(e.getMessage());
//            throw new RuntimeException(e);
        }
    }

    public void register(Customer c) {
        try {
            c.setCid(CommonUtils.uuid());
            c.setBalance("0");
            String sql = "insert into Customer values(?,?,?,?,?,?,?,?,?)";
            Object[] params = {c.getCid(), c.getCName(), c.getCPhone(),
                    c.getCAccount(), ChangeToMD5.stringToMD5(c.getCPwd()), c.getCAddress(), c.getBalance(), c.getCSex(),c.getBirthday()};
//            c.getAll();
            qr.update(sql, params);
        }catch (Exception e)
        {
            System.out.println("创建用户出错啦");
            System.out.println(e.getMessage());
//            throw new RuntimeException(e);
        }
    }

    public PageBean<Customer> findAll(int pc, int pr) {
        try{
            /*
             * 1.需要创建pageBean对象pb
             * 2.设置pb的pc和pr
             * 3.得到tr，设置给pb
             * 4.得到beanList设置给pb
             * 5.最后返回给pb
             */
            PageBean<Customer> pb=new PageBean<>();
            pb.setPc(pc);
            pb.setPr(pr);

            String sql="select count(*) from Customer";
            Number number= qr.query(sql,new ScalarHandler<>());

            int tr=number.intValue();
            pb.setTr(tr);

            sql="select * from Customer order by CName limit ?,?";
            Object[] params={(pc-1)*pr,pr};
            List<Customer> beanList = qr.query(sql,new BeanListHandler<>(Customer.class),params);

            pb.setBeanList(beanList);

            return pb;
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public Customer find(String cid) {
        try {
            String sql = "select * from Customer where Cid=? order by CName";
            return qr.query(sql, new BeanHandler<>(Customer.class), cid);
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public void edit(Customer customer) {
        try{
            String sql="update Customer set CName=?,CSex=?,CPhone=?,CAccount=?,CPwd=?,CAddress=?,Birthday=? where Cid=?";
            Object[] params={customer.getCName(),customer.getCSex(),customer.getCPhone(),customer.getCAccount(),ChangeToMD5.stringToMD5(customer.getCPwd()),customer.getCAddress(),customer.getBirthday(),customer.getCid()};
//            System.out.println(customer.getCPwd());
//            customer.getAll();
            qr.update(sql,params);
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public void delete(String cid) {
        try {
            String sql = "delete from Customer where Cid=?";

            qr.update(sql, cid);
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public PageBean<Customer> query(Customer customer,int pc,int pr) {


        try {
            PageBean<Customer> pb=new PageBean<>();
            pb.setPc(pc);
            pb.setPr(pr);

            StringBuilder cntSql = new StringBuilder("select count(*) from Customer ");
            StringBuilder whereSql=new StringBuilder(" where 1=1 "); // 这个where待优化
            List<Object> params = new ArrayList<>();

            String name = customer.getCName();
            if (name != null && !name.trim().isEmpty()) {
                whereSql.append("and CName like ?");
                params.add("%"+name+"%");
            }

            String gender = customer.getCSex();
            if (gender != null && !gender.trim().isEmpty()) {
                whereSql.append("and CSex=?");
                params.add(gender);
            }

            String phone = customer.getCPhone();
            if (phone != null && !phone.trim().isEmpty()) {
                whereSql.append("and CPhone like ?");
                params.add("%"+phone+"%");
            }

            String account = customer.getCAccount();
            if (account != null && !account.trim().isEmpty()) {
                whereSql.append("and CAccount like ?");
                params.add("%"+account+"%");
            }

            String address = customer.getCAddress();
            if (address != null && !address.trim().isEmpty()) {
                whereSql.append("and CAddress like ?");
                params.add("%"+address+"%");
            }

            String birthday = customer.getBirthday();
            if (birthday != null && !birthday.trim().isEmpty()) {
                whereSql.append("and Birthday like ?");
                params.add("%"+birthday+"%");
            }

            String pwd = customer.getCPwd();
            if (pwd != null && !pwd.trim().isEmpty()) {
                whereSql.append("and CPwd like ?");
                params.add("%"+pwd+"%");
            }



            Number num=qr.query(cntSql.append(whereSql).toString(),new ScalarHandler<>(),params.toArray());

            int tr=num.intValue();
            pb.setTr(tr);

            StringBuilder sql=new StringBuilder("select * from Customer ");

            params.add((pc-1)*pr);
            params.add(pr);

            List<Customer> beanList=qr.query(sql.append(whereSql).append(" limit ?,?").toString(), new BeanListHandler<>(Customer.class),params.toArray());
            pb.setBeanList(beanList);

            return pb;
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }

    }
}
