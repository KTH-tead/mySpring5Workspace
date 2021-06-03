package org.zerock.ex00.common.fileupload;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
 
	private static final Logger Logger = LoggerFactory.getLogger(FileUploadController.class);
	
	//다중파일 업로드 방법1: form 방식의 파일업로드
	//파일 업로드 요청 JSP 페이지 호출
	@GetMapping("fileUploadForm")
	public void callFileUploadForm() {
		Logger.info("upload Form");
	}
	
	//다중파일 업로드 방법1: form 방식의 파일업로드
	//Model이용, 업로드 파일 저장
	@PostMapping("/fileUploadFormAction")
	public void fileUploadActionPost(MultipartFile[] uploadFiles
				, Model model
			) {
		Logger.info("========FileUpload With Form ==========");
		
		//
		String strUploadFileRepoDir = "c:\\upload";
		
		for(MultipartFile multipartUploadFile : uploadFiles) {
			Logger.info("=============");
			Logger.info("Upload File Name: " + multipartUploadFile.getOriginalFilename());
			Logger.info("Upload File Size: " + multipartUploadFile.getSize()); 
			
			//업로드 파일의 리소스(저장폴더와 파일이름)가 설정된 File 객체 생성
			File saveUploadFile = new File(strUploadFileRepoDir, multipartUploadFile.getOriginalFilename());
			
			try {
				//서버에 파일객체를 이용하여 업로드 파일 저장
				multipartUploadFile.transferTo(saveUploadFile);
				
			} catch (Exception e) {
				Logger.error(e.getMessage());
			}
		} // End-for
	}

	
}
