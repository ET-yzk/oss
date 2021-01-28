package domain;

public class Goods {
    private String gid;
    private String kid;
    private String picture;
    private String gName;
    private String promotion;
    private String saleNum;
    private String gAddress;
    private String sPrice;
    private String gStatus;
    private String introduce;
    private String pPrice;
    private String repertory;

    public void getAll() {
        System.out.println(getIntroduce() + getPPrice() + getSPrice() +
                getPicture() + getKid() + getRepertory() +
                getGStatus() + getPromotion() + getGid() +
                getGAddress() + getSaleNum() + getGName());
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPPrice() {
        return pPrice;
    }

    public void setPPrice(String pPrice) {
        this.pPrice = pPrice;
    }

    public String getRepertory() {
        return repertory;
    }

    public void setRepertory(String repertory) {
        this.repertory = repertory;
    }

    public String getKid() {
        return kid;
    }

    public void setKid(String kid) {
        this.kid = kid;
    }

    public String getGName() {
        return gName;
    }

    public void setGName(String gName) {
        this.gName = gName;
    }

    public String getGAddress() {
        return gAddress;
    }

    public void setGAddress(String gAddress) {
        this.gAddress = gAddress;
    }

    public String getSPrice() {
        return sPrice;
    }

    public void setSPrice(String sPrice) {
        this.sPrice = sPrice;
    }

    public String getGStatus() {
        return gStatus;
    }

    public void setGStatus(String gStatus) {
        this.gStatus = gStatus;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public String getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(String saleNum) {
        this.saleNum = saleNum;
    }

}
