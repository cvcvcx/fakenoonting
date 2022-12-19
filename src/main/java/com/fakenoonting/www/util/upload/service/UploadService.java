package com.fakenoonting.www.util.upload.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.util.upload.controller.UploadController;
import com.fakenoonting.www.util.upload.dao.UploadDAO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Service("UploadService")
public class UploadService {

	/*
	 * @Autowired private UploadDAO uploadDAO;
	 */

	// 파일 형식 체크 (올린 각 파일들이 이미지인지)
	public ResponseEntity<List<ImgItemVO>> checkFileType(MultipartFile[] uploadFile) throws IOException {

		log.info("checkFileType 진행 중...");

		// MultipartFile에 들어온 모든 파일들의 형식을 for 문으로 체크 하겠다
		for (MultipartFile multipartFile : uploadFile) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			// probeContentType는 MimeType을 얻어내는 메소드
			type = Files.probeContentType(checkfile.toPath());

			// startsWith(문자, position) : 해당 위치부터 괄호 안의 문자로 시작하지 않으면 false 반환
			if (!type.startsWith("image")) {
				List<ImgItemVO> imgs = null;
				return new ResponseEntity<>(imgs, HttpStatus.BAD_REQUEST);
			}
		}

		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 업로드 날짜 생성
	public String makeFileDate(String uploadPath) {

		// 현재 시간과 날짜 정보 생성
		Date date = new Date();
		// 날짜 형식 "yyyy-MM-dd" 로 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date);
		String datePath = str.replace("-", "/");

		return datePath;
	}

	// 업로드 날짜에 따른 파일 객체 생성
	public File makeFileObject(String uploadPath, String datePath) {

		// File 객체에 파일이 들어갈 디렉토리 / 파일 이름(업로드 날짜) 을 넣는다.
		File savePath = new File(uploadPath, datePath);

		// File 객체(파일 경로)가 존재하지 않으면 새로운 폴더를 생성해준다.
		if (savePath.exists() == false) {
			savePath.mkdirs();
		}

		return savePath;
	}

	// ImageVO 값 세팅, 업로드, 업로드 시 보이는 작은 이미지 생성
	public List<ImgItemVO> setValueImageVO(MultipartFile[] uploadFile, File savePath, String datePath) {

		List<ImgItemVO> productImgs = new ArrayList<>();

		for (MultipartFile multipartFile : uploadFile) {

			ImgItemVO img = new ImgItemVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			log.info("받은 파일 이름 : " + multipartFile.getOriginalFilename());

			img.setOrgImgName(uploadFileName);
			img.setUploadPath("/" + datePath);

			String uuid = UUID.randomUUID().toString();
			img.setImgUUID(uuid);

			// ImgItemVO List에 하나씩 넣는다
			productImgs.add(img);

			uploadFileName = uuid + "_" + uploadFileName;

			// File에 File 객체 savePath를 넣는 이유는
			// savePath에 넣어둔 날짜 정보까지 가져와야 하기 때문에
			File saveFile = new File(savePath, uploadFileName);

			// 파일 업로드 및 업로드 시 보이는 작은 이미지 생성
			try {
				// 파일 업로드
				multipartFile.transferTo(saveFile);
				log.info("받은 파일 타입 : " + Files.probeContentType(saveFile.toPath()));
				// 작은 이미지 생성
				File thumbnailFile = new File(savePath, "s_" + uploadFileName);
				// 작은 이미지도 원하는 사이즈로 위에 만든 경로에 저장
				Thumbnails.of(saveFile).size(160, 160).toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return productImgs;
	}
}
