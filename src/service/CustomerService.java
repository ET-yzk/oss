package service;

import dao.CustomerDao;
import domain.Customer;
import domain.PageBean;

public class CustomerService {
    CustomerDao customerDao=new CustomerDao();

    public void add(Customer customer)
    {
        customerDao.add(customer);
    }

    public void register(Customer customer)
    {
        customerDao.register(customer);
    }

    public PageBean<Customer> findAll(int pc,int pr)
    {
        return customerDao.findAll(pc,pr);
    }

    public Customer find(String cid)
    {
        return customerDao.find(cid);
    }

    public void edit(Customer customer) {

        customerDao.edit(customer);
    }

    public void delete(String account)
    {
        customerDao.delete(account);
    }

    public PageBean<Customer> query(Customer customer,int pc,int pr) {
        return customerDao.query(customer,pc,pr);
    }

}
