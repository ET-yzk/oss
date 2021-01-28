package service;

import dao.GoodsDao;
import domain.Goods;
import domain.PageBean;

public class GoodsService {
    GoodsDao goodsDao =new GoodsDao();

    public void add(Goods goods)
    {
        goodsDao.add(goods);
    }

    public PageBean<Goods> findAll(int pc, int pr)
    {
        return goodsDao.findAll(pc,pr);
    }

    public Goods find(String gid)
    {
        return goodsDao.find(gid);
    }

    public void edit(Goods goods)
    {
        goodsDao.edit(goods);
    }

    public void delete(String gid)
    {
        goodsDao.delete(gid);
    }

    public PageBean<Goods> query(Goods goods,int pc,int pr) {
        return goodsDao.query(goods,pc,pr);
    }

    public void buy(Goods goods, String cid, String gNum) {
        goodsDao.buy(goods, cid, gNum);
    }

    public void addCart(String gid, String iNum) {
        goodsDao.addCart(gid, iNum);
    }
}
