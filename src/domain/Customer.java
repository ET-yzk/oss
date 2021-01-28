package domain;

public class Customer
{
    private String id;
    private String name;
    private String phone;
    private String account;
    private String pwd;
    private String address;
    private String balance;
    private String sex;
    private String birthday;

    public String getCid() {
        return id;
    }

    public void setCid(String id) {
        this.id = id;
    }

    public String getCName() {
        return name;
    }

    public void setCName(String name) {
        this.name = name;
    }

    public String getCSex() {
        return sex;
    }

    public void setCSex(String sex) {
        this.sex = sex;
    }

    public String getCPhone() {
        return phone;
    }

    public void setCPhone(String phone) {
        this.phone = phone;
    }

    public String getCAccount() {
        return account;
    }

    public void setCAccount(String account) {
        this.account = account;
    }

    public String getCPwd() {
        return pwd;
    }

    public void setCPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getCAddress() {
        return address;
    }

    public void setCAddress(String address) {
        this.address = address;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void getAll () {
        System.out.println(getCid() + getCAddress() + getBirthday() + getCPwd() + getBalance() + getCPhone() + getCAccount() + getCName() + getCSex());
    }

    public boolean check(){// 待实现
        return true;
    }
}
