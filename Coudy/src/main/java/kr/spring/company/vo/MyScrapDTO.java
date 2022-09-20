package kr.spring.company.vo;

import java.sql.Date;

public class MyScrapDTO {
    private int scrap_num;
    private int mem_num;
    private int com_num;
    private String com_name;
    private String com_title;
    private String com_tag;

    private Date com_schedule;

    public Date getCom_schedule() {
        return com_schedule;
    }

    public void setCom_schedule(Date com_schedule) {
        this.com_schedule = com_schedule;
    }

    public int getScrap_num() {
        return scrap_num;
    }

    public void setScrap_num(int scrap_num) {
        this.scrap_num = scrap_num;
    }

    public int getMem_num() {
        return mem_num;
    }

    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
    }

    public int getCom_num() {
        return com_num;
    }

    public void setCom_num(int com_num) {
        this.com_num = com_num;
    }

    public String getCom_name() {
        return com_name;
    }

    public void setCom_name(String com_name) {
        this.com_name = com_name;
    }

    public String getCom_title() {
        return com_title;
    }

    public void setCom_title(String com_title) {
        this.com_title = com_title;
    }

    public String getCom_tag() {
        return com_tag;
    }

    public void setCom_tag(String com_tag) {
        this.com_tag = com_tag;
    }

    @Override
    public String toString() {
        return "MyScrapDTO{" +
                "scrap_num=" + scrap_num +
                ", mem_num=" + mem_num +
                ", com_num=" + com_num +
                ", com_name='" + com_name + '\'' +
                ", com_title='" + com_title + '\'' +
                ", com_tag='" + com_tag + '\'' +
                '}';
    }
}
