package kr.spring.notice.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_num;
	@NotEmpty
	private String notice_title;
	@NotEmpty
	private String notice_content;
	private int notice_hit;
	private Date notice_reg_date;
	private Date notice_modify_date;
	private byte[] notice_uploadfile;
	private String notice_filename;
	private String notice_ip;
	private int mem_num;
	
	
	/*private int study_num;
	
	public int getStudy_num() {
		return study_num;
	}

	public void setStudy_num(int study_num) {
		this.study_num = study_num;
	}*/

	private String id;
	private byte[] photo;//프로필 사진
	private String photo_name;//프로필 이름
	
	//파일 업로드 처리
	public void setUpload(MultipartFile upload)throws IOException{
		setNotice_uploadfile(upload.getBytes());
		setNotice_filename(upload.getOriginalFilename());
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}

	public Date getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public Date getNotice_modify_date() {
		return notice_modify_date;
	}

	public void setNotice_modify_date(Date notice_modify_date) {
		this.notice_modify_date = notice_modify_date;
	}

	public byte[] getNotice_uploadfile() {
		return notice_uploadfile;
	}

	public void setNotice_uploadfile(byte[] notice_uploadfile) {
		this.notice_uploadfile = notice_uploadfile;
	}

	public String getNotice_filename() {
		return notice_filename;
	}

	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}

	public String getNotice_ip() {
		return notice_ip;
	}

	public void setNotice_ip(String notice_ip) {
		this.notice_ip = notice_ip;
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
	

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	/*@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_hit=" + notice_hit + ", notice_reg_date=" + notice_reg_date
				+ ", notice_modify_date=" + notice_modify_date + ", notice_filename=" + notice_filename + ", notice_ip="
				+ notice_ip + ", mem_num=" + mem_num + ", study_num=" + study_num + ", id=" + id + ", photo_name="
				+ photo_name + "]";
	}*/

	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_hit=" + notice_hit + ", notice_reg_date=" + notice_reg_date
				+ ", notice_modify_date=" + notice_modify_date + ", notice_filename=" + notice_filename + ", notice_ip="
				+ notice_ip + ", mem_num=" + mem_num + ", id=" + id + ", photo_name=" + photo_name + "]";
	}
	
	



}
