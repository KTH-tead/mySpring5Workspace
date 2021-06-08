<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/myheader.jsp"%>

<style>
.bigImageWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: lightgray;
	z-index: 100;
}

.bigImage {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigImage img {
	height: 100%;
	max-width: 100%;
	width: auto;
	overflow: hidden
}
</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">User Board - register</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>게시글 등록</h4>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="form" action="${contextPath}/myboard/register"
						method="post">

						<div class="form-group">
							<label>제목</label> <input class="form-control title" name="btitle"
								minlength="4">
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control content" name="bcontent"
								style="resize: vertical" minlength="4"></textarea>
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control writer"
								name="bwriter" minlength="4">
						</div>

						<button type="submit" class="btn btn-primary submit_button">등록</button>
						<button type="button" data-oper="list" class="btn btn-warning"
							onClick="location.href='${contextPath}/myboard/list'">취소</button>
					</form>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">파일첨부</div>
				<div class="panel-body" id="panelFileBody">id 추가
					<div class="form-group uploadDiv">
						<input id="inputFile" type="file" name="uploadFiles" multiple><br>
					</div>
					<div class="form-group fileUploadResult">
						<ul>
							<!-- 업로드 후 결과처리 로직이 표시될 영역 -->
						</ul>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	<!-- /.col-lg-12 -->
	</div>
</div>

<!-- /.row -->
<!-- /#page-wrapper -->
<script>
	$(function() {
		console.log($(".title").val().length);
		console.log($(".title").val() === null);
		console.log($(".title").val() === '');
		console.log($(".content").length);
		console.log($(".content").val() === null);
		console.log($(".content").val() === '');
		console.log($(".writer").val().length);
		console.log($(".writer").val() === null);
		console.log($(".writer").val() === '');
		$(".submit_button").on("click", function() {
			if ($(".title").val() === '' || $(".title").val().length === 0) {
				alert("입력 요망");
				return false;
			} else {
				return;
			}
		})
	})
</script>

<script>
//업로드 파일의 확장자 및 최대 파일 크기 검사 함수
 function checkUploadfile(fileName, fileSize){
	// 확장자에 대한 정규식 및 최대 허용크기(1MB) 저장변수
	 var maxSizePermittedForUploadFile = 5242880;
	 var regExpForFileExtention = /(.*)\.(exe|sh|zip|alz)$/i ;
	 
	//최대 허용 크기 제한 검사
	 if (fileSize >= maxSizePermittedForUploadFile){
		 alert ("업로드 파일의 제한된 크기 (5MB)를 초과했습ㅂ니다.");
		 return false;
	 }
	//업로드파일의 확장자 검사:
	 if(regExpForFileExtention.test(fileName)) {
		 alert("해당 종류(exe/sh/zip/alz)의 파일은 업로드할 수 없습니다.");
		 return false;
	 }
	 return true;
 }
 
 var bnoValue = '<c:out value ="${board.bno}"/>';
 
 //첨부파일 정보표시함수
 function showUploadedFiles(uploadResult){
	 
	 if(!uploadResult || uploadResult.length == 0){ //첨부파일이 없으면, 함수 종료.
		 return;
	 }
	 
	 var fileUploadResult = $(".fileUploadResult ul");
	 var str = "";
	 
	 $(uploadResult).each(function(i, obj) { //첨부파일 표시
		 if (obj.fileType=="F"){ //이미지가 아닌 파일
			 var calledPathFileName = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);
			 
			 str += "<li data-filename='" +obj.fileName + "' data-uploadpath='" + obj.uploadPath+ "'"
			 + " data-uuid='" +obj.uuid+ "'data-filetype='" +obj.fileType + "'>"
			 + " <img src ='${contextPath}/resources/img/icon-attach.png'"
			 + "      alt= 'No Icon' style='height:18px; width:18px;'>"
			 + obj.fileName
			 + "<span data-filename='" +calledPathFileName + "'data-filetype='F'>[삭제]</span>"
			 + "</li>";
			 
		 } else if (obj.fileType == "I") { //이미지파일
			 var thumbnailFilePath = encodeURIComponent(obj.uploadPath +"/s_" +obj.uuid +"_" +obj.fileName);
			 
			 var originPathImageFileName = obj.uploadPath +"\\"+obj.uuid + "_" +obj.fileName;
			 originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/");
			 
			 str += "<li data-filename='" +obj.fileName+"' data-uploadpath='"+obj.uploadPath+  "'"
			 	 +  " data-uuid='" +obj.uuid +"'data-filetype='" +obj.fileType + "'>"
			 	 + " <img src='${contextPath}/DisplayThumbnailFile?fileName=" +thumbnailFilePath + "'"
				 + " alt = 'No Icon' style='height:18px; width:18px;'>"
				 +  obj.fileName
				 + "<span data-filename='" + thumbnailFilePath + "'data-filetype='I'> [삭제] </span>"
				 + "</li>";
		 }
	 });
	fileUploadResult.append(str); 
 }
 
//빈 input 요소를 복사(초기화를 위함)
var cloneInputFile = $(".uploadDiv").clone();

//파일 업로드 처리: 버튼 클릭이 아닌, input의 내용이 바뀌면 업로드가 자동으로 수행되도록 수정
//업로드 후, .uploadDive가 복사된 것으로 교체되어 input이 초기화되므로, 파일 수정이 되도록 이벤트 위임 방식을 사용
	$("#panelFileBody").on("change", "input[type='file']", function(e) {
		var formData = new FormData(); //전송될 파일을 저장할 객체
		
		var inputFiles = $("input[name='uploadFiles']");
		var files = inputFiles[0].files; //input 요소의 파일을 변수에 저장
		 
		
		for (var i =0; i< files.length ; i++){ //formdata 객체에 파일 추가(for문)
			if (!checkUploadfile(files[i].name, files[i].size)){  //업로드 파일 요구조건 검사 
				return false;
			}
			formData.append("uploadFiles", files[i]);
		}
		
		$.ajax({ //파일 전송 및 결과표시
			url : '${contextPath}/fileUploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'post',
			dataType:'json',
			success : function(uploadResult){
				$(".uploadDiv").html(cloneInputFile.html()); //input 초기화
				showUploadedFiles(uploadResult); //업로드 결과 표시
			}
		}) // End .ajax
		
	});

// 서버의 파일 삭제 및 브라우저의 항목 삭제

	$(".fileUploadResult").on("click","span",function (e){
		var targetFileName = $(this).data("filename");
		var targetFileType = $(this).data("filetype");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({ 
			url : '${contextPath}/deleteUploadedFile',
			data : {fileName: targetFileName, fileType: targetFileType},
			dataType:'text',
			type : 'post',
			success : function(result){
				if (result == "SuccessDeletingFile"){
					//alert("파일이 삭제되었습니다.");
					targetLi.remove();
				} else {
					alert ("오류: 파일 삭제 실패.");
				}
			}
		}); // End $.ajax	
	});
	
	//게시물 및 첨부파일 정보 등록
	$("button[type='submit']").on("click", function(e){
		e.preventDefault(); //submit 버튼의 원래 동작 막음
		
		var formObj = $("form[role='form']");
		
		var strInputHidden = "";
		
		//업로드 결과의 li 요소 각각에 대하여 다음을 처리
		$(".fileUploadResult ul li").each(function (i, obj){
			
			var objLi = $(obj);
			//name 속성 값은 MyBoardVO의 첨부파일 목록이 저장되는 attachFileList 필드명(List 객체)으로 지정합니다.
			strInputHidden
			+= " <input type ='hidden' name='attachFileList["+i+"].uuid' value='" +objLi.data("uuid")+"'>"
			+ " <input type ='hidden' name='attachFileList["+i+"].uploadPath' value='" +objLi.data("uploadpath")+"'>"
			+ " <input type ='hidden' name='attachFileList["+i+"].fileName' value='" +objLi.data("filename")+"'>"
			+ " <input type ='hidden' name='attachFileList["+i+"].fileType' value='" +objLi.data("filetype")+"'>" ;
		});
		
		//alert(strInputHidden); //테스트 후, 주석처리할 것
		formObj.append(strInputHidden);
		formObj.submit();
	});
</script>
<%@ include file="../myinclude/myfooter.jsp"%>