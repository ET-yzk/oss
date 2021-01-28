package dao;

import Utils.DateTime;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import domain.Goods;
import domain.PageBean;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDao {
    private final QueryRunner qr = new TxQueryRunner();

    public void add(Goods g) {
        try {
            g.setGid(CommonUtils.uuid());

            g.setSaleNum("0");

            String sql = "insert into Goods values(?,?,?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {g.getGid(), g.getKid(),g.getGName(), g.getPromotion(),
                    g.getRepertory(), g.getSaleNum(), g.getPicture(), g.getIntroduce(),
                    g.getGAddress(), g.getPPrice(), g.getSPrice(), g.getGStatus()};
//            g.getAll();
            qr.update(sql, params);
        }catch (Exception e)
        {
//            return false;
            throw new RuntimeException(e);
        }
//        return true;
    }

    public boolean buy(Goods g, String cid, String gNum) {
        try {
            String sql1 = "select * from Goods where Gid=?";
            g =  qr.query(sql1, new BeanHandler<>(Goods.class), g);

            String oStatus = "付款";
            String remarks = "";

            String sql2 = "insert into Orders values(?,?,?,?,?,?,?,?)";
            Object[] params = {CommonUtils.uuid(), DateTime.gainTime(), cid,
                    g.getGid(), gNum, oStatus, remarks, getFare()};

            qr.update(sql2, params);
        }catch (Exception e)
        {
            return false;
//            throw new RuntimeException(e);
        }
        return true;
    }

    public String getFare() {
        //填写运费生成方式
        return "5";
    }

    public boolean addCart(String gid, String iNum) {
        try {
            String sql = "insert into ShopCart values(?,?,?)";
            Object[] params = {CommonUtils.uuid(), gid, iNum};

            qr.update(sql, params);
        }catch (Exception e)
        {
            return false;
//            throw new RuntimeException(e);
        }
        return true;
    }

    public PageBean<Goods> findAll(int pc, int pr) {
        try{
            /*
             * 1.需要创建pageBean对象pb
             * 2.设置pb的pc和pr
             * 3.得到tr，设置给pb
             * 4.得到beanList设置给pb
             * 5.最后返回给pb
             */
            PageBean<Goods> pb=new PageBean<>();
            pb.setPc(pc);
            pb.setPr(pr);

            String sql="select count(*) from Goods";
            Number number= qr.query(sql,new ScalarHandler<>());

            int tr=number.intValue();
            pb.setTr(tr);

            sql="select * from Goods order by GName limit ?,?";
            Object[] params={(pc-1)*pr,pr};
            List<Goods> beanList = qr.query(sql,new BeanListHandler<>(Goods.class),params);

            pb.setBeanList(beanList);

            return pb;
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public Goods find(String gid) {
        try {
            String sql = "select * from Goods where gid=?";
            return qr.query(sql, new BeanHandler<>(Goods.class), gid);
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public String sumOrder(Goods g, String cid) {
        //订单数量
        try {
            String numStr = "select count(*) from Orders where Cid=? and Gid=?";
            Object[] param = {cid,g.getGid()};
            Number GNum = null;
            GNum = qr.query(numStr, new ScalarHandler<>(), param);

            return String.valueOf(GNum.intValue() + 1);
        } catch (SQLException throwables) {
            return "-1";
//            throwables.printStackTrace();
        }
    }

    public void edit(Goods goods) {
        try{
            String sql="update Goods set Kid=?,GName=?,Promotion=?,Repertory=?,SaleNum=?," +
                    "Picture=?,Introduce=?,GAddress=?,PPrice=?,SPrice=?,GStatus=? where Gid=?";
            Object[] params={goods.getKid(),goods.getGName(),goods.getPromotion(),goods.getRepertory(),
                    goods.getSaleNum(),goods.getPicture(),goods.getIntroduce(), goods.getGAddress(),
                    goods.getPPrice(),goods.getSPrice(),goods.getGStatus(), goods.getGid()};

            qr.update(sql,params);
        }catch (Exception e)
        {
//            return false;
            throw new RuntimeException(e);
        }
//        return true;
    }

    public void delete(String gid) {
        try {
            String sql = "delete from Goods where Gid=?";

            qr.update(sql, gid);
        }catch (Exception e)
        {
//            return false;
            throw new RuntimeException(e);
        }
//        return true;
    }

    public PageBean<Goods> query(Goods goods,int pc,int pr) {


        try {
            PageBean<Goods> pb=new PageBean<>();
            pb.setPc(pc);
            pb.setPr(pr);

            StringBuilder cntSql = new StringBuilder("select count(*) from Goods ");
            StringBuilder whereSql=new StringBuilder(" where 1=1 "); // 这个where待优化
            List<Object> params = new ArrayList<>();

//            String pPrice = goods.getPPrice();
//            if (pPrice != null && !pPrice.trim().isEmpty()) {
//                whereSql.append("and PPrice like ?");
//                params.add("%"+pPrice+"%");
//            }
//
//            String introduce = goods.getIntroduce();
//            if (introduce != null && !introduce.trim().isEmpty()) {
//                whereSql.append("and Introduce like ?");
//                params.add("%"+introduce+"%");
//            }

//            String picture = goods.getPicture();
//            if (picture != null && !picture.trim().isEmpty()) {
//                whereSql.append("and Picture like ?");
//                params.add("%"+picture+"%");
//            }

//            String repertory = goods.getRepertory();
//            if (repertory != null && !repertory.trim().isEmpty()) {
//                whereSql.append("and Repertory like ?");
//                params.add("%"+repertory+"%");
//            }

            String gid = goods.getGid();
            if (gid != null && !gid.trim().isEmpty()) {
                whereSql.append("and Gid like ?");
                params.add("%"+gid+"%");
            }

            String gName = goods.getGName();
            if (gName != null && !gName.trim().isEmpty()) {
                whereSql.append("and GName like ?");
                params.add("%"+gName+"%");
            }

//            String gAddress = goods.getGAddress();
//            if (gAddress != null && !gAddress.trim().isEmpty()) {
//                whereSql.append("and GAddress=?");
//                params.add("%"+gAddress+"%");
//            }

            String kid = goods.getKid();
            if (kid != null && !kid.trim().isEmpty()) {
                whereSql.append("and Kid like ?");
                params.add("%"+kid+"%");
            }

            String promotion = goods.getPromotion();
            if (promotion != null && !promotion.trim().isEmpty()) {
                whereSql.append("and Promotion = ?");
                params.add(promotion);
            }

//            String saleNum = goods.getSaleNum();
//            if (saleNum != null && !saleNum.trim().isEmpty()) {
//                whereSql.append("and SaleNum like ?");
//                params.add("%"+saleNum+"%");
//            }

            String gStatus = goods.getGStatus();
            if (gStatus != null && !gStatus.trim().isEmpty()) {
                whereSql.append("and GStatus like ?");
                params.add("%"+gStatus+"%");
            }

//            String sPrice = goods.getSPrice();
//            if (sPrice != null && !sPrice.trim().isEmpty()) {
//                whereSql.append("and SPrice like ?");
//                params.add("%"+sPrice+"%");
//            }


//            System.out.println(whereSql);
            Number num=qr.query(cntSql.append(whereSql).toString(),new ScalarHandler<>(),params.toArray());

            int tr=num.intValue();
            pb.setTr(tr);

            StringBuilder sql=new StringBuilder("select * from Goods ");

            params.add((pc-1)*pr);
            params.add(pr);

            List<Goods> beanList=qr.query(sql.append(whereSql).append(" limit ?,?").toString(), new BeanListHandler<>(Goods.class),params.toArray());
            pb.setBeanList(beanList);

            return pb;
        }catch (Exception e)
        {
            throw new RuntimeException(e);
        }

    }
}
