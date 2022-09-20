package kr.spring.study.chat.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Slf4j
@Component
public class FileStore {
//hash 중복 방

    @Value("${file.chat-dir}")
    private String dir;

    public void storeFile(MultipartFile multipartFile,String hash) throws IOException, NoSuchAlgorithmException {
        if (multipartFile.isEmpty()) {
            return;
        }

        String fullPath = dir+hash;
        multipartFile.transferTo(new File(fullPath));
    }


    private static String extractExt(String originalFilename) {
        int pos = originalFilename.lastIndexOf(".");
        return originalFilename.substring(pos + 1);
    }
    public static String getHash(MultipartFile multipartFile) throws NoSuchAlgorithmException, IOException {
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");

        byte[] dataByte = new byte[multipartFile.getBytes().length];

        InputStream inputStream = multipartFile.getInputStream();
        Integer nRead = 0;
        while ((nRead = inputStream.read(dataByte)) != -1) {
            messageDigest.update(dataByte,0,nRead);
        }

        byte[] mdBytes = messageDigest.digest();

        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < mdBytes.length; i++) {
            stringBuffer.append(Integer.toString((mdBytes[i] & 0xff) + 0x100, 16).substring(1));
        }

        String ext = extractExt(multipartFile.getOriginalFilename());
        return stringBuffer+"."+ext;
    }
}
