package org.zerock.ex00.common.fileupload;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttachInfoDTO {
	private String fileName;
	private String uploadPath;
	private String uuid;
	private String fileType;
}