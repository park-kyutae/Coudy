package kr.spring.techblog.vo;

public class TechblogReplyVO {
	private int tech_re_num;
	private String tech_re_content;
	private String tech_re_date;
	private String tech_re_modifydate;
	private int tech_num;
	private int mem_num;
	
	private String id;

	public int getTech_re_num() {
		return tech_re_num;
	}

	public void setTech_re_num(int tech_re_num) {
		this.tech_re_num = tech_re_num;
	}

	public String getTech_re_content() {
		return tech_re_content;
	}

	public void setTech_re_content(String tech_re_content) {
		this.tech_re_content = tech_re_content;
	}

	public String getTech_re_date() {
		return tech_re_date;
	}

	public void setTech_re_date(String tech_re_date) {
		this.tech_re_date = tech_re_date;
	}

	public String getTech_re_modifydate() {
		return tech_re_modifydate;
	}

	public void setTech_re_modifydate(String tech_re_modifydate) {
		this.tech_re_modifydate = tech_re_modifydate;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TechblogReplyVO [tech_re_num=" + tech_re_num + ", tech_re_content=" + tech_re_content
				+ ", tech_re_date=" + tech_re_date + ", tech_re_modifydate=" + tech_re_modifydate + ", tech_num="
				+ tech_num + ", mem_num=" + mem_num + ", id=" + id + "]";
	}
}
