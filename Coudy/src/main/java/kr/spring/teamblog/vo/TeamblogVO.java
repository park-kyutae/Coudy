package kr.spring.teamblog.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class TeamblogVO {
	private int team_num;
	@NotEmpty
	private String team_title;
	@NotEmpty
	private String team_content;
	private int team_hit;
	private Date team_reg_date;
	private Date team_modify_date;
	private byte[] team_uploadfile;
	private String team_filename;
	private String team_ip;
	private int mem_num;
	
	private String id;
	private byte photo;
	private String photo_name;
	
	//파일 업로드 처리 
	public void setUpload(MultipartFile upload)throws IOException{
		setTeam_uploadfile(upload.getBytes());
		setTeam_filename(upload.getOriginalFilename());
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public String getTeam_title() {
		return team_title;
	}

	public void setTeam_title(String team_title) {
		this.team_title = team_title;
	}

	public String getTeam_content() {
		return team_content;
	}

	public void setTeam_content(String team_content) {
		this.team_content = team_content;
	}

	public int getTeam_hit() {
		return team_hit;
	}

	public void setTeam_hit(int team_hit) {
		this.team_hit = team_hit;
	}

	public Date getTeam_reg_date() {
		return team_reg_date;
	}

	public void setTeam_reg_date(Date team_reg_date) {
		this.team_reg_date = team_reg_date;
	}

	public Date getTeam_modify_date() {
		return team_modify_date;
	}

	public void setTeam_modify_date(Date team_modify_date) {
		this.team_modify_date = team_modify_date;
	}

	public byte[] getTeam_uploadfile() {
		return team_uploadfile;
	}

	public void setTeam_uploadfile(byte[] team_uploadfile) {
		this.team_uploadfile = team_uploadfile;
	}

	public String getTeam_filename() {
		return team_filename;
	}

	public void setTeam_filename(String team_filename) {
		this.team_filename = team_filename;
	}

	public String getTeam_ip() {
		return team_ip;
	}

	public void setTeam_ip(String team_ip) {
		this.team_ip = team_ip;
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

	public byte getPhoto() {
		return photo;
	}

	public void setPhoto(byte photo) {
		this.photo = photo;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	@Override
	public String toString() {
		return "TeamblogVO [team_num=" + team_num + ", team_title=" + team_title + ", team_content=" + team_content
				+ ", team_hit=" + team_hit + ", team_reg_date=" + team_reg_date + ", team_modify_date="
				+ team_modify_date + ", team_filename=" + team_filename + ", team_ip=" + team_ip + ", mem_num="
				+ mem_num + ", id=" + id + ", photo_name=" + photo_name + "]";
	}

	
	
}
