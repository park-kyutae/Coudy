package kr.spring.view;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component //자동보관되게
public class ImageView extends AbstractView{


	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		byte[] file = (byte[])model.get("imageFile"); 		//File에서 byte[]로 바꿔줌
		String filename = (String)model.get("filename"); 		//새로 넣어준 줄
								
		//확장자 체크     star.jpg 라면 .jpg를 추출해 확장자를 알아낸다다
		String ext = filename.substring(filename.lastIndexOf("."));
		
		if(ext.equalsIgnoreCase(".gif")) { //대소문자 무시
			ext= "image/gif";
		}else if(ext.equalsIgnoreCase(".png")) {
			ext = "image/png";
		}else {
			ext = "image/jpeg";
		}
		
		response.setContentType(ext);//다운로드가 아니니까 컨텐트 타입명시?
		response.setContentLength(file.length); 				//(int)file.length() 바꿔줌
		
		String fileName = new String(
				filename.getBytes("utf-8"),"iso-8859-1");	 	//file.getName() -> filename
		
		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		InputStream input = null; 								//FileInputStream -> inputStream
		try {
			input = new ByteArrayInputStream(file); // FileInputStream(file) -> ByteArrayInputStream(file)
			IOUtils.copy(input, out); 				//FileCopyUtils.copy(fis, out); -> IOUtils.copy(input, out);
			out.flush();			
		}finally {
			//if(fis!=null)try {fis.close();}catch(IOException ex) {} 지워줌
			if(out!=null) out.close();
			if(input!=null) input.close();
		}
	} //여기까지 처리하면 boardController로 감

}
