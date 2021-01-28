package domain;

public class Notice {
    private String nid;
    private String nContent;
    private String nTime;
    private String aid;

    public String getNid() {
        return nid;
    }

    public void setNid(String nid) {
        this.nid = nid;
    }

    public String getnContent() {
        return nContent;
    }

    public void setnContent(String nContent) {
        this.nContent = nContent;
    }

    public String getnTime() {
        return nTime;
    }

    public void setnTime(String nTime) {
        this.nTime = nTime;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }
}
