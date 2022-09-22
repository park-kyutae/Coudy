package kr.spring.company.vo;

public class CompanyScrapVO {
    private int scrap_num;
    private int mem_num;
    private int com_num;

    @Override
    public String toString() {
        return "CompanyScrapVO{" +
                "scrap_num=" + scrap_num +
                ", mem_num=" + mem_num +
                ", com_num=" + com_num +
                '}';
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
}
