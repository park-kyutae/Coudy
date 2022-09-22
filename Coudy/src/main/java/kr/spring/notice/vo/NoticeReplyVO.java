package kr.spring.notice.vo;

public class NoticeReplyVO {
	private int notice_re_num;
	private String notice_re_content;
	private String notice_re_date;
	private String notice_re_mdate;
	private String notice_re_ip;
	private int notice_num;
	private int mem_num;
	
	private String id;

	public int getNotice_re_num() {
		return notice_re_num;
	}

	public void setNotice_re_num(int notice_re_num) {
		this.notice_re_num = notice_re_num;
	}

	public String getNotice_re_content() {
		return notice_re_content;
	}

	public void setNotice_re_content(String notice_re_content) {
		this.notice_re_content = notice_re_content;
	}

	public String getNotice_re_date() {
		return notice_re_date;
	}

	public void setNotice_re_date(String notice_re_date) {
		this.notice_re_date = notice_re_date;
	}

	public String getNotice_re_mdate() {
		return notice_re_mdate;
	}

	public void setNotice_re_mdate(String notice_re_mdate) {
		this.notice_re_mdate = notice_re_mdate;
	}

	

	public String getNotice_re_ip() {
		return notice_re_ip;
	}

	public void setNotice_re_ip(String notice_re_ip) {
		this.notice_re_ip = notice_re_ip;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "NoticeReplyVO [notice_re_num=" + notice_re_num + ", notice_re_content=" + notice_re_content
				+ ", notice_re_date=" + notice_re_date + ", notice_re_mdate=" + notice_re_mdate + ", notice_re_ip="
				+ notice_re_ip + ", notice_num=" + notice_num + ", mem_num=" + mem_num + ", id=" + id + "]";
	}

	
	
	
}
