package kr.spring.techblog.vo;

public class TechblogFavVO {
	private int tech_fav_num;
	private int tech_num;
	private int mem_num;
	
	public int getTech_fav_num() {
		return tech_fav_num;
	}
	public void setTech_fav_num(int tech_fav_num) {
		this.tech_fav_num = tech_fav_num;
	}
	public int getTech_num() {
		return tech_num;
	}
	public void setTech_num(int tech_num) {
		this.tech_num = tech_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "TechblogFavVO [tech_fav_num=" + tech_fav_num + ", tech_num=" + tech_num + ", mem_num=" + mem_num + "]";
	}
}
