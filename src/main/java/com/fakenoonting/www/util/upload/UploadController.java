package com.fakenoonting.www.util.upload;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
@Slf4j
@RequestMapping("util/upload")
public class UploadController {

    //servlet context에 설정되어있음(빈 객체 등록)
    @Resource(name = "uploadPath")
    String uploadPath;
    //Post 요청이 왔을때 여러 파일이여도 모두 처리할 수 있게끔 배열처리
    //현재 업로드 요청이 있었을 때를 폴더로 삼아서 저장하도록 한다.

    //만약, 프로필 같은 사진을 업로드 한다고 해도, 여기로 요청만 보내진다면 서버로 저장할 수 있음
    //상품 후기 글도 마찬가지
    @PostMapping(value = "/uploadImage", produces = "text/plain;charset=utf-8")
    public void uploadAjax(MultipartFile[] uploadFile){

        log.info("uploadAjaxPost요청 진행중...");
        String uploadFolder = uploadPath;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        String datePath = str.replace("-", File.separator);

        File savePath = new File(uploadFolder, datePath);

        if(savePath.exists() == false){
            savePath.mkdirs();
        }

        for(MultipartFile multipartFile: uploadFile){
            String uploadFileName = multipartFile.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            uploadFileName = uuid+"_"+uploadFileName;
            log.info("multipartFile.getName" + multipartFile.getOriginalFilename());

            File saveFile = new File(savePath,uploadFileName);

            try {
                multipartFile.transferTo(saveFile);
                File thumbnailFile = new File(savePath,"s_"+uploadFileName);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


    }


}
