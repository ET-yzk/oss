package servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import domain.Customer;
import domain.PageBean;
import service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;


public class CustomerServlet extends BaseServlet {

    private final CustomerService customerService = new CustomerService();

    public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Customer customer = CommonUtils.toBean(request.getParameterMap(), Customer.class);

//        customer.getAll();
        customerService.add(customer);


        if (customer.check()) {
            request.setAttribute("msg", "恭喜，成功添加客户");
        }
        else {
            request.setAttribute("msg", "添加客户失败，请重试");
        }

        return "/msg.jsp";
    }

    public String register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Customer customer = CommonUtils.toBean(request.getParameterMap(), Customer.class);

//        customer.getAll();
        customerService.register(customer);

        if (customer.check()) {
            request.setAttribute("msg", "恭喜，注册成功");
        }
        else {
            request.setAttribute("msg", "注册失败，请重试");
        }

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

        PageBean<Customer> pb = customerService.findAll(pc, pr);
        pb.setUrl(getUrl(request));

        request.setAttribute("pb", pb);

        return "/customer_list.jsp";
    }

    private int getPc(HttpServletRequest request) {
        String value = request.getParameter("pc");
        if (value == null || value.trim().isEmpty()) {
            return 1;
        }
        return Integer.parseInt(value);
    }

    public String preEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        Customer customer = customerService.find(cid);

        request.setAttribute("customer", customer);

        return "/customer_edit.jsp";
    }

    public String edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Customer customer = CommonUtils.toBean(request.getParameterMap(), Customer.class);

//        System.out.println(customer.getCPwd());

        customerService.edit(customer);

        request.setAttribute("msg", "恭喜，编辑客户成功");
        return "/msg.jsp";
    }

    public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cid = request.getParameter("cid");

        customerService.delete(cid);

        request.setAttribute("msg", "恭喜，删除客户成功");

        return "/msg.jsp";
    }

    public String query(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Customer customer = CommonUtils.toBean(request.getParameterMap(), Customer.class);

//        customer.getAll();
//        System.out.println(URLDecoder.decode(getUrl(request), "UTF-8"));
        // 为了解决request.getParameterMap()传回中文的解码问题
        if (URLDecoder.decode(getUrl(request), "UTF-8").split("&CSex=")[1].split("&CPhone=").length > 1) {
            customer.setCSex(URLDecoder.decode(getUrl(request), "UTF-8").split("&CSex=")[1].split("&CPhone=")[0]);
        }

        if (URLDecoder.decode(getUrl(request), "UTF-8").split("&CName=")[1].split("&CSex=").length > 1) {
            customer.setCName(URLDecoder.decode(getUrl(request), "UTF-8").split("&CName=")[1].split("&CSex=")[0]);
        }

        customer = encoding(customer);

//        customer.getAll();

        int pc = getPc(request);
        int pr = 10;


        PageBean<Customer> pb = customerService.query(customer, pc, pr);

        pb.setUrl(getUrl(request));

        request.setAttribute("pb", pb);
        return "/customer_list.jsp";

    }

    private Customer encoding(Customer customer) throws UnsupportedEncodingException {

        String name = customer.getCName();
        String gender = customer.getCSex();
        String phone = customer.getCPhone();
        String account = customer.getCAccount();
        String address = customer.getCAddress();
        String birthday = customer.getBirthday();
        String pwd = customer.getCPwd();
//        String balance = customer.getBalance();

        if (name != null && !name.trim().isEmpty()) {
//            name = new String(name.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setCName(name);
        }
        if (gender != null && !gender.trim().isEmpty()) {
//            gender = new String(gender.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
//            System.out.println(gender);
            customer.setCSex(gender);
        }
        if (phone != null && !phone.trim().isEmpty()) {
            phone = new String(phone.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setCPhone(phone);
        }
        if (account != null && !account.trim().isEmpty()) {
            account = new String(account.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setCAccount(account);
        }
        if (address != null && !address.trim().isEmpty()) {
            address = new String(address.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setCAddress(address);
        }
        if (pwd != null && !pwd.trim().isEmpty()) {
            pwd = new String(pwd.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setCPwd(pwd);
        }
        if (birthday != null && !birthday.trim().isEmpty()) {
            birthday = new String(birthday.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            customer.setBirthday(birthday);
        }

        return customer;
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

