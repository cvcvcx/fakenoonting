package com.fakenoonting.www.util.upload.controller;

import com.fakenoonting.www.util.upload.service.UploadService;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;



@Controller
@Slf4j
@RequestMapping("util/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;
    
    // 업로드 시킨 파일 저장 경로 - servlet context에서 같은 name으로 설정(빈 객체 등록)
    @Resource(name = "uploadPath")
    String uploadPath;
    
    // 이미지, 영상 파일 업로드(Ajax)  
    // 여러 개의 이미지 파일 처리가능 (배열)
    // 사이트에서 사용하는 모든 곳에서 사용 되는 사진 업로드 가능
    @PostMapping(value = "/uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<ImgItemVO>> uploadAjax(MultipartFile[] uploadFile) throws IOException {

        log.info("uploadAjaxPost 요청 진행 중...");

        // 파일 형식 체크 (올린 각 파일들이 이미지인지)
        ResponseEntity<List<ImgItemVO>> result = uploadService.checkFileType(uploadFile);

        // 업로드 날짜 생성
        String datePath = uploadService.makeFileDate(uploadPath);
        
        // 업로드 날짜에 따른 파일 객체 생성
        File savePath = uploadService.makeFileObject(uploadPath, datePath);    
        
        // ImageVO 값 세팅, 업로드, 업로드 시 보이는 작은 이미지 생성
        List<ImgItemVO> productImgs = uploadService.setValueImageVO(uploadFile, savePath, datePath);

        result = new ResponseEntity<>(productImgs, HttpStatus.OK);
        
        return result;

    }

    // 업로드 후 결과물 디스플레이
    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName) throws IOException {
    	
        File file = new File(uploadPath+fileName);
        ResponseEntity<byte[]> result = null;
        
        HttpHeaders header = new HttpHeaders();
        
        try {
        	// 디스플레이를 위해 Http 헤더에 업로드 파일의 Mime 데이터를 추가
            header.add("Content-type",Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);        	
        } catch (IOException e) {
        	e.printStackTrace();
        }
        
        return result;
    }
    
    // 업로드 상태 이미지 삭제
    @PostMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName, String type){
    	
    	log.info("삭제 파일 : " + fileName);
    	log.info("삭제 파일 타입 : " + type);
    	
        File file = null;

        try {
            file = new File(uploadPath+ URLDecoder.decode(fileName,"UTF-8"));
            file.delete();
            String originFileName = file.getAbsolutePath().replace("s_","");
            file= new File(originFileName);
            file.delete();
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("fail",HttpStatus.NOT_IMPLEMENTED);
        }
        return new ResponseEntity<String>("success", HttpStatus.OK);

    }

}
