package kr.spring.techblog.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class TechblogVO {
	private int tech_num;
	@NotEmpty
	private String tech_title;
	@NotEmpty
	private String tech_name;
	private Date tech_date;
	private Date tech_modifydate;
	private byte[] tech_photo;
	private String tech_photoname;
	@NotEmpty
	private String tech_content;
	private int tech_hit;
	@NotEmpty
	private String tech_category;
	@NotEmpty
	private String tech_tag;
	private int mem_num;
	
	private String id;
	private byte[] photo;//프로필 사진
	private String photo_name;//프로필 사진명
	
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

	//파일 업로드 처리
	public void setUpload(MultipartFile upload)
	                              throws IOException{
		//MultipartFile -> byte[] 변환
		setTech_photo(upload.getBytes());
		//파일명 구하기
		setTech_photoname(upload.getOriginalFilename());
	}
	
	public int getTech_num() {
		return tech_num;
	}

	public void setTech_num(int tech_num) {
		this.tech_num = tech_num;
	}

	public String getTech_title() {
		return tech_title;
	}

	public void setTech_title(String tech_title) {
		this.tech_title = tech_title;
	}

	public String getTech_name() {
		return tech_name;
	}

	public void setTech_name(String tech_name) {
		this.tech_name = tech_name;
	}

	public Date getTech_date() {
		return tech_date;
	}

	public void setTech_date(Date tech_date) {
		this.tech_date = tech_date;
	}

	public Date getTech_modifydate() {
		return tech_modifydate;
	}

	public void setTech_modifydate(Date tech_modifydate) {
		this.tech_modifydate = tech_modifydate;
	}

	public byte[] getTech_photo() {
		return tech_photo;
	}

	public void setTech_photo(byte[] tech_photo) {
		this.tech_photo = tech_photo;
	}

	public String getTech_photoname() {
		return tech_photoname;
	}

	public void setTech_photoname(String tech_photoname) {
		this.tech_photoname = tech_photoname;
	}

	public String getTech_content() {
		return tech_content;
	}

	public void setTech_content(String tech_content) {
		this.tech_content = tech_content;
	}

	public int getTech_hit() {
		return tech_hit;
	}

	public void setTech_hit(int tech_hit) {
		this.tech_hit = tech_hit;
	}

	public String getTech_category() {
		return tech_category;
	}

	public void setTech_category(String tech_category) {
		this.tech_category = tech_category;
	}

	public String getTech_tag() {
		return tech_tag;
	}

	public void setTech_tag(String tech_tag) {
		this.tech_tag = tech_tag;
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
		return "TechblogVO [tech_num=" + tech_num + ", tech_title=" + tech_title + ", tech_name=" + tech_name
				+ ", tech_date=" + tech_date + ", tech_modifydate=" + tech_modifydate + ", tech_photoname="
				+ tech_photoname + ", tech_content=" + tech_content + ", tech_hit=" + tech_hit + ", tech_category="
				+ tech_category + ", tech_tag=" + tech_tag + ", mem_num=" + mem_num + ", id=" + id + "]";
	}
}
