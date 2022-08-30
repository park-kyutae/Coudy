package kr.spring.company.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.sql.Date;

public class CompanyVO {
    private int com_num;
    private int mem_num;
    @NotEmpty
    private String com_name;
    @NotEmpty
    private String com_title;
    @NotEmpty
    private String com_career;
    @NotEmpty
    private String com_pay;
    @NotEmpty
    private String com_edu;
    @NotEmpty
    private String com_time;
    @NotEmpty
    private String com_emptype;
    private String com_tag;
    @Size(min = 5,max = 5)
    private int com_zipcode;
    private String com_address1;
    private String com_address2;
    private Date com_schedule;
    private String com_part;
    private String com_filename;
    private Byte[] com_photo;
    private String com_comTitle;
    private String com_comContent;
    private int com_hit;

    public int getCom_num() {
        return com_num;
    }

    public void setCom_num(int com_num) {
        this.com_num = com_num;
    }

    public int getMem_num() {
        return mem_num;
    }

    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
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

    public String getCom_career() {
        return com_career;
    }

    public void setCom_career(String com_career) {
        this.com_career = com_career;
    }

    public String getCom_pay() {
        return com_pay;
    }

    public void setCom_pay(String com_pay) {
        this.com_pay = com_pay;
    }

    public String getCom_edu() {
        return com_edu;
    }

    public void setCom_edu(String com_edu) {
        this.com_edu = com_edu;
    }

    public String getCom_time() {
        return com_time;
    }

    public void setCom_time(String com_time) {
        this.com_time = com_time;
    }

    public String getCom_emptype() {
        return com_emptype;
    }

    public void setCom_emptype(String com_emptype) {
        this.com_emptype = com_emptype;
    }

    public String getCom_tag() {
        return com_tag;
    }

    public void setCom_tag(String com_tag) {
        this.com_tag = com_tag;
    }

    public int getCom_zipcode() {
        return com_zipcode;
    }

    public void setCom_zipcode(int com_zipcode) {
        this.com_zipcode = com_zipcode;
    }

    public String getCom_address1() {
        return com_address1;
    }

    public void setCom_address1(String com_address1) {
        this.com_address1 = com_address1;
    }

    public String getCom_address2() {
        return com_address2;
    }

    public void setCom_address2(String com_address2) {
        this.com_address2 = com_address2;
    }

    public Date getCom_schedule() {
        return com_schedule;
    }

    public void setCom_schedule(Date com_schedule) {
        this.com_schedule = com_schedule;
    }

    public String getCom_part() {
        return com_part;
    }

    public void setCom_part(String com_part) {
        this.com_part = com_part;
    }

    public String getCom_filename() {
        return com_filename;
    }

    public void setCom_filename(String com_filename) {
        this.com_filename = com_filename;
    }

    public Byte[] getCom_photo() {
        return com_photo;
    }

    public void setCom_photo(Byte[] com_photo) {
        this.com_photo = com_photo;
    }

    public String getCom_comTitle() {
        return com_comTitle;
    }

    public void setCom_comTitle(String com_comTitle) {
        this.com_comTitle = com_comTitle;
    }

    public String getCom_comContent() {
        return com_comContent;
    }

    public void setCom_comContent(String com_comContent) {
        this.com_comContent = com_comContent;
    }

    public int getCom_hit() {
        return com_hit;
    }

    public void setCom_hit(int com_hit) {
        this.com_hit = com_hit;
    }

    @Override
    public String toString() {
        return "CompanyVO{" +
                "com_num=" + com_num +
                ", mem_num=" + mem_num +
                ", com_name='" + com_name + '\'' +
                ", com_title='" + com_title + '\'' +
                ", com_career='" + com_career + '\'' +
                ", com_pay='" + com_pay + '\'' +
                ", com_edu='" + com_edu + '\'' +
                ", com_time='" + com_time + '\'' +
                ", com_emptype='" + com_emptype + '\'' +
                ", com_tag='" + com_tag + '\'' +
                ", com_zipcode=" + com_zipcode +
                ", com_address1='" + com_address1 + '\'' +
                ", com_address2='" + com_address2 + '\'' +
                ", com_schedule=" + com_schedule +
                ", com_part='" + com_part + '\'' +
                ", com_filename='" + com_filename + '\'' +
                ", com_comTitle='" + com_comTitle + '\'' +
                ", com_comContent='" + com_comContent + '\'' +
                ", com_hit=" + com_hit +
                '}';
    }
}
