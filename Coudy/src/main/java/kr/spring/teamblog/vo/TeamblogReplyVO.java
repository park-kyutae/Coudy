package kr.spring.teamblog.vo;

public class TeamblogReplyVO {
	private int team_re_num;
	private String team_re_content;
	private String team_re_date;
	private String team_re_mdate;
	private String team_re_ip;
	private int team_num;
	private int mem_num;
	
	private String id;

	public int getTeam_re_num() {
		return team_re_num;
	}

	public void setTeam_re_num(int team_re_num) {
		this.team_re_num = team_re_num;
	}

	public String getTeam_re_content() {
		return team_re_content;
	}

	public void setTeam_re_content(String team_re_content) {
		this.team_re_content = team_re_content;
	}

	public String getTeam_re_date() {
		return team_re_date;
	}

	public void setTeam_re_date(String team_re_date) {
		this.team_re_date = team_re_date;
	}

	public String getTeam_re_mdate() {
		return team_re_mdate;
	}

	public void setTeam_re_mdate(String team_re_mdate) {
		this.team_re_mdate = team_re_mdate;
	}

	public String getTeam_re_ip() {
		return team_re_ip;
	}

	public void setTeam_re_ip(String team_re_ip) {
		this.team_re_ip = team_re_ip;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
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
		return "TeamblogReplyVO [team_re_num=" + team_re_num + ", team_re_content=" + team_re_content
				+ ", team_re_date=" + team_re_date + ", team_re_mdate=" + team_re_mdate + ", team_re_ip=" + team_re_ip
				+ ", team_num=" + team_num + ", mem_num=" + mem_num + ", id=" + id + "]";
	}
	
	
}
