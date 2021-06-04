package org.zerock.ex00.common.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class FileUploadController {

	//롬복을 사용 안할 때
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	
	//
	@GetMapping("/displayThumbnailFile")
	@ResponseBody
	public ResponseEntity<byte[]> getThumbNailFile(String fileName){
		
		logger.info("fileName:" + fileName);
		
		File file = new File(fileName);
		//File file = new File("c:\\upload\\" + fileName);
		
		logger.info("file:" + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			//HttpHeader 객체에 썸네일이미지파일의 Content-Type 추가.
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			//복사된 썸네일 파일을 HttpHeader에 추가된 Content-Type과 상태깞을 가지고
			//ResponseEntity<byte[]> 객체 생성
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//ResponseEntity<byte[]> 객체 반환
		return result;
	}
    
	
//	//썸네일 이미지 파일 다운로드
//	@GetMapping("/DisplayThumbnailFile")
//	@ResponseBody
//	public ResponseEntity<byte[]> getThumbNailFile(String fileName) {
//	logger.info("fileName: " + fileName);
//	File file = new File("c:\\upload\\" + fileName);
//	logger.info("file: " + file);
//	ResponseEntity<byte[]> result = null;
//	try {
//	HttpHeaders header = new HttpHeaders();
//	//HttpHeader 객체에 썸네일이미지파일의 Content-Type 추가
//	header.add("Content-Type", Files.probeContentType(file.toPath()));
//	//복사된 썸네일 파일을 HttpHeader에 추가된 Content-Type과 상태깞을 가지고
//	//ResponseEntity<byte[]> 객체 생성
//	result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//	} catch (IOException e) {
//	e.printStackTrace();
//	}
//	//ResponseEntity<byte[]> 객체 반환
//	return result;
//	}
	
	//다중 파일 업로드 방법1 : form 방식의 파일 업로드
	//파일 업로드 요청 JSP 페이지 호출
//	@GetMapping("fileUploadForm")
//	public void callFileUploadForm() {
//		logger.info("upload Form");
//	}
	
	//다중파일 업로드 방법2: Ajax 방식의 파일업로드
	//사용자의 업로드 요청 페이지 호출
	@GetMapping("/fileUploadAjax")
	public void callFileUploadAjax() {
		logger.info("upload Ajax Form");
	}
	
	//Ajax: 날짜형식의 디렉토리 구조를 생성후 업로드파일 저장 구성
	//Step1- 날짜 형식 경로 문자열 생성 메소드
	private String getDatefmtPathName() {
		
		//날짜 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		//날짜 생성
		Date date = new Date();
		//날짜 형식이 지정된 날짜문자열(yyyy/MM/dd) 생성
		String strDatefmtPathName = simpleDateFormat.format(date);
		//경로구분자를 운영체제에 맞도록 변경한 문자열을 반환
		return strDatefmtPathName.replace("/", File.separator);
	}
	
	//Ajax: 썸네일 이미지 생성
	//Step1: 업로드파일이 이미지 파일여부 검사 메소드 정의
	private boolean checkIsImageForUploadFile(File uploadFile) {
		
		try {
			String strContentType = Files.probeContentType(uploadFile.toPath());
			
			System.out.println("업로드파일의 ContentType: " +strContentType);
			
			return strContentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//Step2- 날짜 형식 폴더 구조 생성 후 업로드파일 저장
	// 업로드 요청 파일 - 저장 및 결과 메세지 전송
//	@PostMapping("/fileUploadAjaxAction")
//	public void fileUploadActionAjax(MultipartFile[] uploadFiles
//				// ,Model model // ajax 사용시 필요 없음.
//			) {
	
	@PostMapping(value="/fileUploadAjaxAction", produces ="application/json; charset=UTF-8")
	@ResponseBody
	 public ResponseEntity<List<AttachInfoDTO>>
			fileUploadActionAjaxPost(MultipartFile[] uploadFiles){
		
		logger.info("===start FileUpload with Ajax===");
		
		//업로드 파일 각각에 대한 피드백정보(AttachInfoDTO)를 담을 리스트 객체
		List <AttachInfoDTO> listAttachInfoDTO = new ArrayList<AttachInfoDTO>();
		
		
		//업로드파일이 저장될 기준 레포지토리 경로 문자열
		String strUploadFileRepoDir = "c:\\upload";
		
		//날짜 형식 폴더경로 문자열 객체(사용자에게 전달될 각 업로드파일의 저장경로)
		String strDatefmtPathName = getDatefmtPathName();
		
		//전체 업로드 경로 파일객체 생성
		File fileUploadPath = new File(strUploadFileRepoDir, strDatefmtPathName);
		
		//날짜 형식(yyyy/MM/dd)의 폴더구조 생성
			//File(String Parent, String Child)
			//부모경로(레포지토리 경로) 문자열에 자식경로(날짜형식 경로) 문자열이 더해진 File 객체 생성
			//날짜형식 경로를 생성하기 위하여 앞에서 생성한 getDatefmtPathName() 메서드 호출
//		File fileUploadPath = new File(strUploadFileRepoDir, getDatefmtPathName());
//		logger.info("upload path: " + fileUploadPath);
		
		//경로가 존재하지 않으면 전체 폴더 구조 생성
		if (fileUploadPath.exists() == false) {
			//이때, 기존폴더 구조중 일부가 있으면 없는 부분 부터 나머지 전체를 생성
			fileUploadPath.mkdirs();
		}
		
		logger.info("upload path:" + fileUploadPath);
		
		
		//각각의 업로드파일 이름 구성 후, 저장경로와 파일이름으로 생성된 파일객체를 서버에 저장
		for(MultipartFile multipartUploadFile : uploadFiles) {
			logger.info("======");
			logger.info("Upload File Name : " + multipartUploadFile.getOriginalFilename());
			logger.info("Upload File Size : " + multipartUploadFile.getSize());
			
			//업로드파일 각각에 대한 피드백 정보가 저장될 AttachInfoDTO 객체 생성
			AttachInfoDTO attachInfoDTO = new AttachInfoDTO();
			
			//attachInfoDTO에 날짜형식경로 문자열 저장
//			attachInfoDTO.setUploadPath(strDatefmtPathName);
//			System.out.println("피드백객체에 저장된 날짜형식 경로: " + attachInfoDTO.getUploadPath());
			
			//Thumbnail 결과 표시 시에 날짜를 포함한 전체 경로를 저장하도록 수정.
			attachInfoDTO.setUploadPath(fileUploadPath.toString());
			System.out.println("저장된 전체경로: " + attachInfoDTO.getUploadPath());
			
			
			//업로드파일이름 원본문자열
			String strUploadFileName = multipartUploadFile.getOriginalFilename();
			
			//IE10 마일 이름추출: ultipartUploadFile.getOriginalFilename()에서 업로드 파일이름만 추출
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\")+1);
			
			//attachInfoDTO에 원본업로드파일이름 저장
			attachInfoDTO.setFileName(strUploadFileName);
			
			logger.info("피드백객체에 저장된 업로드파일의 원본파일이름 문자열: " + attachInfoDTO.getFileName());
			logger.info("최종처리된 업로드 파일이름 : " +strUploadFileName);
			
			//UUID를 이용한 고유한 파일이름 적용
			//랜덤한 UUID값의 문자열 생성
			UUID uuid = UUID.randomUUID();
			
			//attachInfoDTO에 uuid 문자열 저장
			attachInfoDTO.setUuid(uuid.toString());
			
			//파일이름에 UUID 문자열 추가(파일 확장자 때문에 UUID를 앞에다 추가해야 함
			strUploadFileName = uuid.toString() + "_" + strUploadFileName ;
			System.out.println("UUID 처리된 파일이름 :" +strUploadFileName);
			
			
			//저장폴더와 파일이름 문자열의 파일객체 생성
			//File saveUploadFile = new File(strUploadFileRepoDir, strUploadFileName);
			
			//날짜형식폴더구조가 포함된 File 객체를 사용하도록 수정됨
			File saveUploadFile = new File(fileUploadPath, strUploadFileName);
			
			
			try {
				//서버에 파일객체를 이용하여 업로드 파일 저장
				multipartUploadFile.transferTo(saveUploadFile);
				//업로드된 파일에 대하여 이미지파일인지를 검사후, 이미지 파일일경우, 썸네일이미지 생성
				//이미지파일이 아닌꼉우, if 문 처리 없음.
				//이미지 파일 인 경우,
				if (checkIsImageForUploadFile(saveUploadFile)) {
					
					//attachInfoDTO에 이미지 파일임을("I")을 저장
					attachInfoDTO.setFileType("I");
					
					System.out.println("attachInfoDTO에 저장된 파일타입: " + attachInfoDTO.getFileType());
					
					
					//썸네일 생성경로와 파일이름이 설정된 파일객체를 전송 보내는 FileOutputStream 객체 생성
					FileOutputStream outputStreamForThumbnail =
							new FileOutputStream(
									new File(fileUploadPath, "s_" + strUploadFileName));
					
					//FileOutput-스트림으로 보내진 파일객체를 서버에 저장(input)하여, 100X100 크기(px)의 썸네일 생성
					//라이브러리 메소드 사용
					Thumbnailator.createThumbnail(multipartUploadFile.getInputStream(),
							outputStreamForThumbnail, 100, 100);
					
					//OUT 스트림리소스 닫기
					outputStreamForThumbnail.close();
				} else {
					
					//attachInfoDTO에 이미지 파일이 아님을("F")을 저장
					attachInfoDTO.setFileType("F");
					
					System.out.println("attachInfoDTO에 저장된 파일타입: " +attachInfoDTO.getFileType());
				}
				
				//리스트에 피트백객체 추가
				listAttachInfoDTO.add(attachInfoDTO);
			} catch (Exception e){
				logger.error(e.getMessage());
			}
		} // End-for
		
		
		//반환될 ResponseEntity 객체 생성(리스트객체와 Http상태값OK를 가짐)
		return new ResponseEntity<List<AttachInfoDTO>> (listAttachInfoDTO, HttpStatus.OK);
	}
}
