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

    //servlet context에 설정되어있음(빈 객체 등록)
    @Resource(name = "uploadPath")
    String uploadPath;
    //Post 요청이 왔을때 여러 파일이여도 모두 처리할 수 있게끔 배열처리
    //현재 업로드 요청이 있었을 때를 폴더로 삼아서 저장하도록 한다.

    //만약, 프로필 같은 사진을 업로드 한다고 해도, 여기로 요청만 보내진다면 서버로 저장할 수 있음
    //상품 후기 글도 마찬가지
    @PostMapping(value = "/uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<ImgItemVO>> uploadAjax(MultipartFile[] uploadFile) throws IOException {

        for(MultipartFile multipartFile: uploadFile){
            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;

            type = Files.probeContentType(checkfile.toPath());
            if(!type.startsWith("image")){
                List<ImgItemVO> imgs = null;
                return new ResponseEntity<>(imgs, HttpStatus.BAD_REQUEST);
            }
        }

        log.info("uploadAjaxPost요청 진행중...");
        String uploadFolder = uploadPath;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        String datePath = str.replace("-", "/");

        File savePath = new File(uploadFolder, datePath);

        if(savePath.exists() == false){
            savePath.mkdirs();
        }

        List<ImgItemVO> productImgs = new ArrayList<>();



        for(MultipartFile multipartFile: uploadFile){

            ImgItemVO img = new ImgItemVO();

            String uploadFileName = multipartFile.getOriginalFilename();

            img.setOrgImgName(uploadFileName);
            img.setUploadPath("/"+datePath);

            String uuid = UUID.randomUUID().toString();
            img.setImgUUID(uuid);

            uploadFileName = uuid+"_"+uploadFileName;
            log.info("multipartFile.getName" + multipartFile.getOriginalFilename());

            File saveFile = new File(savePath,uploadFileName);

            try {
                multipartFile.transferTo(saveFile);
                File thumbnailFile = new File(savePath,"s_"+uploadFileName);
                Thumbnails.of(saveFile)
                        .size(160,160)
                        .toFile(thumbnailFile);
            }catch (Exception e){
                e.printStackTrace();
            }
            productImgs.add(img);
        }
        ResponseEntity<List<ImgItemVO>> result = new ResponseEntity<>(productImgs, HttpStatus.OK);
        return result;

    }

    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName) throws IOException {
        File file = new File(uploadPath+fileName);
        ResponseEntity<byte[]> result = null;
        HttpHeaders header = new HttpHeaders();
        header.add("Content-type",Files.probeContentType(file.toPath()));
        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        return result;
    }
    
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
