package kr.spring.company.vo;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

public class CompanyResumeVO {
    private int resume_num;
    private Date reg_date;
    @NotEmpty
    private byte[] uploadfile;
    @NotEmpty
    private String filename;
    private int mem_num;
    private int com_num;
    private String mem_name;


    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }

    public void setUpload(MultipartFile upload)
            throws IOException {
        //MultipartFile -> byte[] 변환
        setUploadfile(upload.getBytes());
        //파일명 구하기
        setFilename(upload.getOriginalFilename());
    }

    public int getResume_num() {
        return resume_num;
    }

    public void setResume_num(int resume_num) {
        this.resume_num = resume_num;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public byte[] getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(byte[] uploadfile) {
        this.uploadfile = uploadfile;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
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

    @Override
    public String toString() {
        return "CompanyResumeVO{" +
                "resume_num=" + resume_num +
                ", reg_date=" + reg_date +
                ", filename='" + filename + '\'' +
                ", mem_num=" + mem_num +
                ", com_num=" + com_num +
                '}';
    }
}
