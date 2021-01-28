package Demo;

import MD5_InEncrypt.ChangeToMD5;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;
import dao.CustomerDao;
import domain.Customer;
import domain.PageBean;
import org.apache.commons.dbutils.QueryRunner;

import java.util.List;


public class Demo
{
    public static void main(String[] args) {
//        CustomerDao customerDao = new CustomerDao();
//
//        for (Customer c: customerDao.findAll(1, 10).getBeanList()) {
//            c.getAll();
//        }

        System.out.println(ChangeToMD5.stringToMD5("e10adc3949ba59abbe56e057f20f883e"));
//        for (int i = 31; i < 40; i++) {
//            Customer customer = new Customer();
//            customer.setId(CommonUtils.uuid());
//            customer.setName("customer" + i);
//            customer.setGender(i % 2 == 0 ? "m" : "f");
//            customer.setPhone("134769967" + i);
//
//            String resultString = ChangeToMD5.stringToMD5("12345" + i);
//            customer.setPwd(resultString);
//            customer.setCAddress("hangzhou");
//            customer.setBirthday("2002-4-" + (i - 20));
//            customer.setAccount("0001" + i);
//            customer.setBalance("0");
//            customerDao.add(customer);
//        }
    }
}
