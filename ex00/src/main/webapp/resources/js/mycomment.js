/*mycomment.js: 댓글/답글 데이터 처리용 Ajax Closure Module*/

var myCommentClsr = (function() {
	//댓글 목록 (페이징) - ajax() 함수 사용
	function getCmtList(pagingParams, callback, error) {
		var bno = pagingParams.bno;
		var page = pagingParams.page || 1;
		
		console.log("getCmtList()가 전달받은 bno : " + bno);
		console.log("getCmtList()가 전달받은 page : " + page);
		console.log("getCmtList() 함수의 ajax 처리 시작...");
		
		//- 컨트롤러의 매핑 URL 목록
		//게시물에 대한 댓글 목록 조회: GET /replies/pages/{bno}/{page}
		//게시물에 대한 댓글 등록(rno 반환):POST /replies/{bno}/new
		//게시물에 대한 댓글의 댓글 등록: (rno 반환): POST /replies/{bno}/{prno}/new
		//게시물에 대한 특정 댓글 조회: GET /replies/{bno}/{rno}
		//게시물에 대한 특정 댓글 수정: PUT:PATCH /replies/{bno}/{rno}
		//게시물에 대한 특정 댓글 삭제: DELETE: /replies/{bno}/{rno}
		
		$.ajax({
			type : 'get',
			url : "/ex00/replies/pages/" + bno + "/" + page,
			dataType: 'json',
			success : function(replyPagingCreator, status, xhr) {
				if(callback) {
					callback(replyPagingCreator)
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
/*	//댓글 목록(페이징) - getJSON() 함수 사용
	function getCmtList(bnoAndPage, callback, error) {
		var bno = bnoAndPage.bno;
		var page = bnoAndPage.page || 1;
		
		console.log("getCmtList()가 전달받은 bno : " + bno);
		console.log("getCmtList()가 전달받은 page : " + page);
		console.log("getCmtList() 함수의 ajax 처리 시작");
		
		$.getJSON("/ex00/replies/pages/" + bno + "/" + page,
				 function(replyPagingCreator) {
					if(callback) {
						callback(replyPagingCreator); //data는 댓글 전체 목록
					}
				}
		).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	*/
	
	//댓글 등록
	//게시물에 대한 댓글 등록(rno 반환):POST /replies/{bno}/new
	function registerCmt(comment, callback, error) {
		var bno = comment.bno;
		
		console.log("registerCmt() 전달 받은 bno : " + bno);
		console.log("registerCmt() 함수의 comment 등록 ajax 처리 시작");
		
		$.ajax({
			type: "post",
			url: "/ex00/replies/" + bno + "/new",
			data: JSON.stringify(comment),
			contentType: "application/json; charset=UTF-8",
			//dataType: 'text',
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	

	//답글 등록
	//게시물에 대한 댓글의 댓글 등록: (rno 반환): POST /replies/{bno}/{prno}/new
	function registerReply(reply, callback, error) {
		var bno = reply.bno;
		var prno = reply.prno;
		
		console.log("registerReply() 전달받은 bno : " + bno)
		console.log("registerReply() 전달받은 pcno : " + prno)
		console.log("registerReply() 함수의 댓글에 대한 답글 등록 ajax 처리 시작...")
		
		$.ajax({
			type: "post",
			url: "/ex00/replies/" + bno + "/" + prno + "/new",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=UTF-8",
			dataType : 'text',
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	//댓글 조회
	function getCmtReply(bnoAndCno, callback, error) {
		var bno = bnoAndCno.bno;
		var cno = bnoAncCno.cno;
		
		console.log("getCmtReply() 전달받은 bno : " + bno)
		console.log("getCmtReply() 전달받은 cno : " + cno)
		console.log("getCmtReply() 함수의 특정 댓글에 조회 ajax 처리 시작...")
		
		$.get("/ex00/mycomments/" + bno + "/" + cno + ".json",
			 function(result) {
				if(callback) {
					callback(result);
				}
			}
		).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		})
	}
	
	//댓글 수정
	function modifyCmtReply(comment, callback, error) {
		var bno = comment.bno;
		var cno = comment.cno;
		
		console.log("modifyCmtReply() 전달받은 bno : " + bno);
		console.log("modifyCmtReply() 전달받은 cno : " + cno);
		console.log("modifyCmtReply() 함수의 특정 댓글 수정 ajax 처리 시작...");
		
		$.ajax({
			type: "put",
			url: "/ex00/mycomments/" + bno + "/" + cno,
			data: JSON.stringify(comment),
			contentType: "application/json; charset=UTF-8",
			dataType: "text",
			success: function(modifyResult, status, xhr) {
				if(callback) {
					callback(modifyResult);
				}
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		  })
		}
		
		//댓글 삭제(cdelFlg만 1로 수정)
		function setCmtReplyDeleted(comment, callback, error) {
			var bno = comment.bno;
			var cno = comment.cno;
			var cwriter = comment.cwriter
			
			console.log("modifyCmtReply() 전달받은 bno : " + bno)
			console.log("modifyCmtReply() 전달받은 cno : " + cno)
			console.log("modifyCmtReply() 함수의 댓글-답글 삭제1 ajax 처리 시작...")
			
			$.ajax({
				type : "patch",
				url : "/ex00/mycomments/" + bno + "/" + cno,
				data : JSON.stringify(comment),
				contentType: "application/json; charset=UTF-8",
				dataType: "text",
				success: function(modifyResult, status, xhr) {
					if(callback) {
						callback(modifyResult);
					}
				},
				error: function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}				
			})
		}
		
		//댓글 삭제(실제 삭제)
		function removeCmtReply(comment, callback, error) {
			var bno = comment.bno;
			var cno = comment.cno;
			var cwriter = comment.cwriter;
			
			console.log("removeCmtReply() 전달받은 bno : " + bno);
			console.log("removeCmtReply() 전달받은 cno : " + cno);
			console.log("removeCmtReply() 전달받은 cwriter : " + cwriter);
			console.log("removeCmtReply() 함수의 댓글 삭제 ajax 처리 시작...")
			
			$.ajax({
				type: "delete",
				url: "/ex00/mycomment/" + bno + "/" + cno,
				data: JSON.stringify({bno: bno, cno: cno, cwriter: cwriter}),
				contentType: "application/json; charset=UTF-8",
				success: function(removeResult, status, xhr) {
					if(callback) {
						callback(removeResult);
					}
				},
				error: function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			})
		}
		
		//날짜 시간 표시 형식 설정(서버와 상관없음)
		//일반적인 날짜 시간 표시 형식으로 표시
		function showDatetime(datatimeValue) {
			var dateObj = new Date(datetimeValue);
			
			var str = "";
			
			var yyyy = dateObj.getFullYear();
			var mm = dataObj.getMonth();
			var dd = dateObj.getDate();
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			str = [yyyy, '/',
				   (mm > 9 ? '' : '0') + mm, '/',
				   (dd > 9 ? '' : '0') + dd, ' ',
				   (hh > 9 ? '' : '0') + hh, ':',
				   (mi > 9 ? '' : '0') + mi, ':',
				   (ss > 9 ? '' : '0') + ss, '/'].join('');
	
			return str;
		}
		
		return {
			getCmtList : getCmtList, //댓글 목록
			registerCmt : registerCmt, //댓글 등록
			registerReply : registerReply//, //답글 등록
//			getCmtReply : getCmtReply, //댓글-답글 조회
//			ModifyCmtReply : ModifyCmtReply, //댓글-답글 수정
//			setCmtReplyDeleted : setCmtReplyDeleted, //댓글-답글 삭제(cdelFlg-1 수정)
//			removeCmtReply : removeCmtReply, //댓글-답글 삭제
//			showDatetime : showDatetime //날짜 시간 표시형식 지정
//			//showLastModTime : showLastModTime
		};
		
})(); //즉시 실행 함수
		
		
/*		
		//오늘 지금 시간을 기준을 하루를 넘어가면 날짜가 표시, 하루 지나지 않았으면 시간 표시
		//마지막 수정된 시간 표시, 날자 시간 표시 함수
		function displayTime(timeValue) {
			var todayNow = new Date();
			var gap = todayNow.getTime() - timeValue;
			var dateObj = new Date(timeValue);
			
			if(gap<(1000 * 60 * 60 * 24)) {
				var hh = dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				
				return [
					(hh > 9 ? '' : '0') + hh, ':'
					(mi > 9 ? '' : '0') + mi, ':'
					(ss > 9 ? '' : '0') + ss, ':'
				].join('');
			} else {
				var yy = dateObj.getFullYear();
				var mm = dateObj.getMonth();
				var dd = dateObj.getDate();
				
				return [ 
					yy, '/',
					(mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd
				].join('');
			}
		}
		
		
		
		
		
		
		
		
		
		
*/
























	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
