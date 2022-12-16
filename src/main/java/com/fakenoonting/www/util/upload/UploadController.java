package com.fakenoonting.www.util.upload;

import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
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

    // 업로드 시킨 파일 저장 경로 - servlet context에서 같은 name으로 설정(빈 객체 등록)
    @Resource(name = "uploadPath")
    String uploadPath;
    
    // 이미지, 영상 파일 업로드(Ajax)  
    // 여러 개의 이미지 파일 처리가능 (배열)
    // 사이트에서 사용하는 모든 곳에서 사용 되는 사진 업로드 가능 / 상품 후기 글도 마찬가지
    @PostMapping(value = "/uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<ImgItemVO>> uploadAjax(MultipartFile[] uploadFile) throws IOException {

        log.info("uploadAjaxPost 요청 진행 중...");

    	// 올린 사진들이 이미지 사진인지를 각각 체크
    	for(MultipartFile multipartFile: uploadFile){
            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;
            // probeContentType는 MimeType을 얻어내는 메소드
            type = Files.probeContentType(checkfile.toPath());            
            
            // startsWith(문자, position) : 해당 위치부터 괄호 안의 문자로 시작하지 않으면 false 반환
            if(!type.startsWith("image")){
                List<ImgItemVO> imgs = null;
                return new ResponseEntity<>(imgs, HttpStatus.BAD_REQUEST);
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        String datePath = str.replace("-", "/");

        String uploadFolder = uploadPath;

        // File 객체에 파일이 들어갈 디렉토리 / 파일 이름 을 넣는다.
        File savePath = new File(uploadFolder, datePath);

        // File 객체가 존재하지 않으면 새로운 폴더를 생성해준다.
        if(savePath.exists() == false){
            savePath.mkdirs();
        }

        
        
        List<ImgItemVO> productImgs = new ArrayList<>();

        // ImageVO에 값 세팅 및 업로드 시 보이는 작은 이미지 생성
        for(MultipartFile multipartFile: uploadFile){

            ImgItemVO img = new ImgItemVO();

            String uploadFileName = multipartFile.getOriginalFilename();
            log.info("multipartFile.getName" + multipartFile.getOriginalFilename());

            img.setOrgImgName(uploadFileName);
            img.setUploadPath("/"+datePath);

            String uuid = UUID.randomUUID().toString();
            img.setImgUUID(uuid);

            uploadFileName = uuid+"_"+uploadFileName;

            File saveFile = new File(savePath,uploadFileName);

            // 업로드 시 보이는 작은 이미지 생성
            try {
                multipartFile.transferTo(saveFile);
                File thumbnailFile = new File(savePath,"s_"+uploadFileName);
                Thumbnails.of(saveFile)
                        .size(160,160)
                        .toFile(thumbnailFile);
            }catch (Exception e){
                e.printStackTrace();
            }
            
            // ImgItemVO List에 하나씩 넣는다
            productImgs.add(img);
        }
        
        ResponseEntity<List<ImgItemVO>> result = new ResponseEntity<>(productImgs, HttpStatus.OK);
        
        return result;

    }

    // 업로드 후 결과물 디스플레이
    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName) throws IOException {
        File file = new File(uploadPath+fileName);
        ResponseEntity<byte[]> result = null;
        HttpHeaders header = new HttpHeaders();
        header.add("Content-type",Files.probeContentType(file.toPath()));
        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        return result;
    }
    
    //
    @PostMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName){
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
