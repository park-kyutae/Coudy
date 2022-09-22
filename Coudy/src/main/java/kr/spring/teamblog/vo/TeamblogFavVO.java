package kr.spring.teamblog.vo;

import java.sql.Date;

public class TeamblogFavVO {
	private int team_fav_num;
	private Date team_fav_date;
	private int team_num;
	private int mem_num;
	public int getTeam_fav_num() {
		return team_fav_num;
	}
	public void setTeam_fav_num(int team_fav_num) {
		this.team_fav_num = team_fav_num;
	}
	public Date getTeam_fav_date() {
		return team_fav_date;
	}
	public void setTeam_fav_date(Date team_fav_date) {
		this.team_fav_date = team_fav_date;
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
	@Override
	public String toString() {
		return "TeamblogFavVO [team_fav_num=" + team_fav_num + ", team_fav_date=" + team_fav_date + ", team_num="
				+ team_num + ", mem_num=" + mem_num + "]";
	}
	
	
}
