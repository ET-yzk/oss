package servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import domain.Goods;
import domain.PageBean;
import service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

// 函数后的response不可删去！
public class GoodsServlet extends BaseServlet {

    private final GoodsService goodsService = new GoodsService();

    public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Goods goods= CommonUtils.toBean(request.getParameterMap(), Goods.class);

        goodsService.add(goods);

        request.setAttribute("msg", "恭喜，成功添加商品");

        return "/msg.jsp";
    }

    public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         * 1.获取页面传递的pc
         * 2.给定pr的值
         * 3.使用pc和pr调用service方法，得到pageBean，保存到request域
         * 4.转发到list.jsp
         */
        /*
         *  1.得到pc
         *   如果pc参数不存在，说明pc＝1
         *   如果pc参数存在，需要转换成int类型
         */
        int pc = getPc(request);

        int pr = 10;//给定pr的值，每页10行纪录

        PageBean<Goods> pb = goodsService.findAll(pc, pr);
        pb.setUrl(getUrl(request));

        request.setAttribute("pb", pb);

        return "/goods/goods_list.jsp";
    }

    public String shopping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         * 1.获取页面传递的pc
         * 2.给定pr的值
         * 3.使用pc和pr调用service方法，得到pageBean，保存到request域
         * 4.转发到list.jsp
         */
        /*
         *  1.得到pc
         *   如果pc参数不存在，说明pc＝1
         *   如果pc参数存在，需要转换成int类型
         */
        int pc = getPc(request);

        int pr = 10;//给定pr的值，每页10行纪录

        PageBean<Goods> pb = goodsService.findAll(pc, pr);
        pb.setUrl(getUrl(request));

        request.setAttribute("pb", pb);

        return "/goods/shopping.jsp";
    }

    private int getPc(HttpServletRequest request) {
        String value = request.getParameter("pc");
        if (value == null || value.trim().isEmpty()) {
            return 1;
        }
        return Integer.parseInt(value);
    }

    public String preEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gid = request.getParameter("gid");
        Goods goods = goodsService.find(gid);

        request.setAttribute("goods", goods);

        return "/goods/goods_edit.jsp";
    }

    public String edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Goods goods = CommonUtils.toBean(request.getParameterMap(), Goods.class);

//        goods.getAll();
        goodsService.edit(goods);

        request.setAttribute("msg", "恭喜，编辑商品成功");
        return "/msg.jsp";
    }

    public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String gid = request.getParameter("gid");

//        System.out.println(gid);
        goodsService.delete(gid);

        request.setAttribute("msg", "恭喜，删除商品成功");

        return "/msg.jsp";
    }

    public String query(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Goods goods = CommonUtils.toBean(request.getParameterMap(), Goods.class);

//        goods.getAll();
        if (URLDecoder.decode(getUrl(request), "UTF-8").split("GName=")[1].split("&Kid=").length > 1) {
            goods.setGName(URLDecoder.decode(getUrl(request), "UTF-8").split("GName=")[1].split("&Kid=")[0]);
        }
//        goods.setIntroduce(java.net.URLDecoder.decode(URLDecoder.decode(getUrl(request), "UTF-8"), "UTF-8").split("&introduce=")[1].split("&PPrice=")[0]);
//        goods.setGAddress(java.net.URLDecoder.decode(URLDecoder.decode(getUrl(request), "UTF-8"), "UTF-8").split("&GAddress=")[1].split("&GName=")[0]);
        if (URLDecoder.decode(getUrl(request), "UTF-8").split("&GStatus=").length > 1) {
            goods.setGStatus(URLDecoder.decode(getUrl(request), "UTF-8").split("&GStatus=")[1]);
        }

        goods = encoding(goods);

//        goods.getAll();

        int pc = getPc(request);
        int pr = 10;


        PageBean<Goods> pb = goodsService.query(goods, pc, pr);

        pb.setUrl(getUrl(request));

        request.setAttribute("pb", pb);
        return "/goods/goods_list.jsp";

    }

    private Goods encoding(Goods goods) throws UnsupportedEncodingException {
        String gName = goods.getGName();
        String gid = goods.getGid();
        String kid = goods.getKid();
//        String picture = goods.getPicture();
//        String introduce = goods.getIntroduce();
//        String pPrice = goods.getPPrice();
//        String repertory = goods.getRepertory();
        String promotion = goods.getPromotion();
//        String saleNum = goods.getSaleNum();
//        String gAddress = goods.getGAddress();
//        String sPrice = goods.getSPrice();
        String gStatus = goods.getGStatus();

        if (kid != null && !kid.trim().isEmpty()) {
            kid = new String(kid.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            goods.setKid(kid);
        }

//        if (picture != null && !picture.trim().isEmpty()) {
//            picture = new String(picture.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setPicture(picture);
//        }
//        if (introduce != null && !introduce.trim().isEmpty()) {
////            introduce = new String(introduce.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setIntroduce(introduce);
//        }
//        if (pPrice != null && !pPrice.trim().isEmpty()) {
//            pPrice = new String(pPrice.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setPPrice(pPrice);
//        }
//        if (repertory != null && !repertory.trim().isEmpty()) {
//            repertory = new String(repertory.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setRepertory(repertory);
//        }

        if (gid != null && !gid.trim().isEmpty()) {
            gid = new String(gid.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            goods.setGid(gid);
        }
        if (gName != null && !gName.trim().isEmpty()) {
//            gName = new String(gName.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            goods.setGName(gName);
        }
        if (promotion != null && !promotion.trim().isEmpty()) {
            promotion = new String(promotion.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            goods.setPromotion(promotion);
        }
//        if (saleNum != null && !saleNum.trim().isEmpty()) {
//            saleNum = new String(saleNum.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setSaleNum(saleNum);
//        }
//        if (gAddress != null && !gAddress.trim().isEmpty()) {
////            gAddress = new String(gAddress.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setGAddress(gAddress);
//        }
//        if (sPrice != null && !sPrice.trim().isEmpty()) {
//            sPrice = new String(sPrice.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            goods.setSPrice(sPrice);
//        }
        if (gStatus != null && !gStatus.trim().isEmpty()) {
//            gStatus = new String(gStatus.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            goods.setGStatus(gStatus);
        }

        return goods;
    }

    private String getUrl(HttpServletRequest request) {
        String contextPath = request.getContextPath();
        String servletPath = request.getServletPath();
        String queryString = request.getQueryString();

        if (queryString.contains("&pc=")) {
            int index = queryString.lastIndexOf("&pc=");
            queryString = queryString.substring(0, index);
        }

        return contextPath + servletPath + "?" + queryString;
    }
}
