package kr.spring.notice.vo;

import java.sql.Date;

public class NoticeFavVO {
	private int notice_fav_num;
	private Date notice_fav_date;
	private int notice_num;
	private int mem_num;
	public int getNotice_fav_num() {
		return notice_fav_num;
	}
	public void setNotice_fav_num(int notice_fav_num) {
		this.notice_fav_num = notice_fav_num;
	}
	public Date getNotice_fav_date() {
		return notice_fav_date;
	}
	public void setNotice_fav_date(Date notice_fav_date) {
		this.notice_fav_date = notice_fav_date;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "NoticeFavVO [notice_fav_num=" + notice_fav_num + ", notice_fav_date=" + notice_fav_date
				+ ", notice_num=" + notice_num + ", mem_num=" + mem_num + "]";
	}
	
	
}
