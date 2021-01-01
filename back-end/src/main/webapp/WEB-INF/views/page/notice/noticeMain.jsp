<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();

//세션에서 로그인 되어있는지 확인
UserDto userDto2 = (UserDto) session.getAttribute("userinfo");

String userSeq = "";
if (userDto2 != null) {
	userSeq = Integer.toString(userDto2.getUser_seq());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel=" shortcut icon" href="/favicon.ico" type="../image/x-icon" />
<link rel="icon" href="/favicon.ico" type="../image/x-icon" />
<title>Happy House</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<!-- New for FileUpload, CKEditor -->
<link rel="stylesheet" href="<%=path%>/css/common.css">
<script
	src="https://cdn.ckeditor.com/ckeditor5/19.0.0/classic/ckeditor.js"></script>
<!-- / New for FileUpload, CKEditor -->

<!-- Place css -->
<link rel="stylesheet" href="../../css/notice.css" />
<title>Happy House</title>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<!-- Add content here -->
	<div class="container">
		<div class="container about">
			<h2 class="noticeTitle">공지사항</h2>
			<p>공지사항을 확인하세요!</p>
		</div>
		<div class="container">

			<div class="input-group mb-3">
				<input id="inputSearchWord" type="text" class="form-control"
					placeholder="Search">
				<div class="input-group-append">
					<button id="btnSearchWord" class="btn btn-success">Go</button>
				</div>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일시</th>
					</tr>
				</thead>
				<tbody id="noticeTbody">
				</tbody>
			</table>

			<div id="paginationWrapper"></div>


		</div>
		<button class="btn btn-sm btn-primary" id="btnInsertPage">글쓰기</button>
	</div>

	<!-- modal begin -->

	<!-- Modal insert-->
	<div class="modal fade" id="boardInsertModal">
		<div class="modal-dialog modal-simple">
			<form class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xl-12 form-group">
							<input id="titleInsert" type="text" class="form-control"
								name="title" placeholder="제목">
						</div>
						<div class="col-xl-12 form-group">

							<!-- New for FileUpload, CKEditor -->
							<div id=divEditorInsert></div>

							<!-- <textarea id="contentInsert" class="form-control" rows="5" placeholder="내용"></textarea> -->

							<!-- / New for FileUpload, CKEditor -->
						</div>
						<!-- New for FileUpload -->
						<div class="col-xl-12 form-group">
							<div class="checkbox-custom checkbox-primary">
								<input type="checkbox" id="chkFileUploadInsert" /> <label
									for="chkFileUploadInsert">파일 추가</label>
							</div>
						</div>
						<div class="col-xl-12 form-group" style="display: none;"
							id="imgFileUploadInsertWrapper">
							<input type="file" id="inputFileUploadInsert">
							<div class="thumbnail-wrapper">
								<img id="imgFileUploadInsert">
							</div>
						</div>
						<div class="col-md-12 float-right">
							<button id="btnNoticeInsert"
								class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
								type="button">등록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- End Modal -->
	<!-- Modal detail-->

	<div class="modal fade" id="boardDetailModal">
		<div class="modal-dialog modal-simple">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글 상세</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">

					<div class="example table-responsive">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>글번호</td>
									<td id="boardIdDetail">#</td>
								</tr>
								<tr>
									<td>제목</td>
									<td id="titleDetail">#</td>
								</tr>
								<tr>
									<td>내용</td>
									<td id="contentDetail">#</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td id="userNameDetail">#</td>
								</tr>
								<tr>
									<td>작성일시</td>
									<td id="regDtDetail">#</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td id="readCountDetail">#</td>
								</tr>

								<!-- New for FileUpload -->
								<tr>
									<td>첨부파일</td>
									<td id="fileListDetail">#</td>
								</tr>
								<!-- / New for FileUpload -->
							</tbody>
						</table>
					</div>
					<button id="btnBoardUpdateForm"
						class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
						type="button">글 수정하기</button>
					<button id="btnBoardDeleteConfirm"
						class="btn btn-sm btn-warning btn-outline" data-dismiss="modal"
						type="button">글 삭제하기</button>

				</div>
			</div>
		</div>
	</div>
	<!-- End Modal -->
	
			<!-- Modal update-->
				<div class="modal fade" id="boardUpdateModal">
					<div class="modal-dialog modal-simple">
						<form class="modal-content">
							<!-- Modal Header -->
					      	<div class="modal-header">
					        	<h4 class="modal-title">글수정</h4>
					        	<button type="button" class="close" data-dismiss="modal">&times;</button>
					      	</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xl-12 form-group">
										<input id="titleUpdate" type="text" class="form-control" name="title" placeholder="제목">
									</div>
									<div class="col-xl-12 form-group">
									
										<!-- New for FileUpload, CKEditor -->
										<div id=divEditorUpdate></div>
										
<!-- 										<textarea id="contentUpdate" class="form-control" rows="5" placeholder="내용"></textarea> -->
										<!-- / New for FileUpload, CKEditor -->
									</div>
									<!-- New for FileUpload -->
									<div class="col-xl-12 form-group">
										첨부파일 : <span id="fileListUpdate"></span>
									</div>
									<div class="col-xl-12 form-group">
										<div class="checkbox-custom checkbox-primary">
					                    	<input type="checkbox" id="chkFileUploadUpdate" />
					                    	<label for="chkFileUploadUpdate">파일 변경</label>
					                  	</div>
									</div>
									<div class="col-xl-12 form-group" style="display:none;" id="imgFileUploadUpdateWrapper">
										<input type="file" id="inputFileUploadUpdate">
										<div class="thumbnail-wrapper">
					                    	<img id="imgFileUploadUpdate">
					                  	</div>
									</div>
									<!-- / New for FileUpload -->
									<div class="col-md-12 float-right">
										<button id="btnBoardUpdate" class="btn btn-sm btn-primary btn-outline" data-dismiss="modal" type="button">수정</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- End Modal -->
	

	<%@ include file="../footer.jsp"%>

	<script src="<%=path%>/js/util.js"></script>
	<script>
        
    var LIST_ROW_COUNT = 10;    //limit - 이 페이지에서 row를 내가 몇개 보여줄 것이다
    var OFFSET = 0;                // ??
    var SEARCH_WORD = "";
    
    /* New for FileUpload, CKEditor */
    var CKEditorInsert;
    var CKEditorUpdate;

    var PAGE_LINK_COUNT = 10;	// pagination link 갯수
    var TOTAL_LIST_ITEM_COUNT = 0;
    var CURRENT_PAGE_INDEX = 1;
    
    const SUCCESS = 1;
    const FAIL = -1;
    
    $(document).ready(function(){
        
    	/* New for FileUpload, CKEditor */
    	ClassicEditor
    	    .create( document.querySelector( '#divEditorInsert' ) ) // .create( $('#divEditorInsert')[0] )
    	    .then( editor => { CKEditorInsert = editor;} )
    	    .catch( err => { console.error( err.stack ); } );
    	
    	ClassicEditor
		.create( document.querySelector( '#divEditorUpdate' ) ) // .create( $('#divEditorUpdate')[0] )
		.then( editor => {
			CKEditorUpdate = editor;
	    } )
		.catch( err => {
	    	console.error( err.stack );
		} );
	
	/* / New for FileUpload, CKEditor */
    	
    	
        noticeList();
        
        $("#btnSearchWord").click(function(){
            
            var searchWord = $("#inputSearchWord").val();
            
            if(searchWord!=""){
                SEARCH_WORD = searchWord;
            }else{
                SEARCH_WORD = "";
            }
            
            noticeList(); // 게시글을 가져오는 것
        });
        
        // 비동기 통신으로 게시글 가져오는 것
        // ajax 써서 utf-8로 바껴서 컨트롤러로 넘어가
        
        $("#btnInsertPage").click(function(){
            
        	 $("#titleInsert").val("");
        	    //$("#contentInsert").val("");
        	    CKEditorInsert.setData("")
        	    
        	    // New for FileUpload
        	    $("#chkFileUploadInsert").prop("checked", false);
        	    $("#inputFileUploadInsert").val("");
        	    $("#imgFileUploadInsert").removeAttr("src");
        	    $("#imgFileUploadInsertWrapper").hide();
        	    
        	    $("#boardInsertModal").modal("show");
        });
        
        
     // insert
    	$("#btnNoticeInsert").click(function(){
    		
    		if( validateInsert() ){
    			noticeInsert();
    		}
    	});
    	
    	// New for FileUpload
    	// insert file upload change
    	$("#chkFileUploadInsert").change(function(){
    		if( $(this).prop("checked")){
    			$("#imgFileUploadInsertWrapper").show();
    		}else{
    			$("#inputFileUploadInsert").val("");
    			$("#imgFileUploadInsert").attr("src", "");
    			$("#imgFileUploadInsertWrapper").hide();
    		}
    	});
        
    });

	// New for FileUpload
	// insert file upload change image load
	$("#inputFileUploadInsert").change(function(e){

		if( this.files && this.files[0] ){
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e){
				$("#imgFileUploadInsert").attr("src", e.target.result);
			}
		}
	});
 
    function validateInsert(){
        var isTitleInsertValid = false;
        var isContentInsertValid = false;
        var titleInsert = $("#titleInsert").val();
        var titleInsertLength = titleInsert.length;
        
        if( titleInsertLength > 0 ){
            isTitleInsertValid = true;
        }
        
        // changes CKEditor
        // var contentInsertValue = $("#contentInsert").val();
        var contentInsertValue = CKEditorInsert.getData();
        
        var contentInsertLength = contentInsertValue.length;
        
        if( contentInsertLength > 0 ){
            isContentInsertValid = true;
        }
        if(    isTitleInsertValid && isContentInsertValid ){
            return true;
        }else{
            return false;
        }
    }
    
    function noticeInsert(){
    	$.ajax({
			type: 'post',
			url: '<%=path%>/notice/noticeInsert',
			dataType: 'json',
			data: {
				userSeq: "<%=userSeq%>",
				title: $("#titleInsert").val(),
				content: $("#contentInsert").val(),
			},
			success: function(data, status, xhr) {
				console.log(data.result);
				if(data.result == "success") {
					alertify.alert('welcome!', '글쓰기 성공!', function(){
						noticeList();
					});
				}
				else {
					alertify.notify('서버의 문제로 글쓰기에 실패했습니다.', 'error', 3, function(){
						console.log(xhr.responseText);
					});
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alertify.notify('글쓰기에 실패했습니다.', 'error', 3, function(){
					console.log(jqXHR.responseText);
				});
			}
		});
    }

    
    
    function noticeFileInsert(){
    	
    	var formData = new FormData();
        formData.append("userSeq", '<%=userSeq%>');
        formData.append("title", $("#titleInsert").val());
        // changes CKEditor
        // formData.append("content", $("#contentInsert").val());
        formData.append("content", CKEditorInsert.getData());

        formData.append("file", $("#inputFileUploadInsert")[0].files[0]);
       $.ajax(
       {
            type : 'post',
            url : '<%=path%>/notice/noticeFileInsert',
            dataType : 'json',
            data : formData,
            contentType: false,
            processData: false, 
            success : function(data, status, xhr) { 
          
               if(data.result == "success"){
                  alertify.success('글이 등록되었습니다.');
                  noticeList();
               }
            }, 
            error: function(jqXHR, textStatus, errorThrown) 
            { 
               alertify.notify(
                   'Opps!! 글 등록 과정에 문제가 생겼습니다.', 
                   'error', //'error','warning','message'
                   3, //-1
                   function(){
                      console.log(jqXHR.responseText); 
                   }
                );
               
            }
        });
    }
    
    function noticeList(){
        $.ajax(
        {
            type:'get',
            url : '<%=path%>/notice/noticeList',
                dataType : 'json',
                data : {
                    // get방식으로 보내는 데이터 아래 3개
                    limit : LIST_ROW_COUNT,
                    offset : OFFSET,
                    searchWord : SEARCH_WORD
                },
                success : function(data, status, xhr) {
                    makeListHtml(data);
                },
                error : function(jqXHR, testStatus, errorThrown) {
                    console.log(textStatus);

                    alertify.notify('Opps!! 글 조회 과정에 문제가 생겼습니다.', 'error', 3, function() {
                    	console.log(jqXHR.responseText);
                     });
                }
            });
        }

        function makeListHtml(list) {
            $("#noticeTbody").html("");

            for (var i = 0; i < list.length; i++) {
                var notice_no = list[i].notice_no;
                var userSeq = list[i].user_seq;
                var userName = list[i].user_name;
                var title = list[i].title;
                var content = list[i].content;
                var regDt = list[i].regtime; // javascript of parsed from LocalDateTime

                var regDtStr = makeDateStr(regDt.date.year, regDt.date.month,
                        regDt.date.day, '.');

                var readCount = list[i].readCount;

                var listHtml = '<tr style = "cursor:pointer" data-noticeNo =' + notice_no + '><td>'
                        + notice_no
                        + '</td><td>'
                        + userName
                        + '</td><td>'
                        + title
                        + '</td><td>'
                        + content
                        + '</td><td>'
                        + regDtStr + '</td></tr>';

                $("#noticeTbody").append(listHtml);
            }
           makeListHtmlEventHandler();
           noticeListTotalCnt();
        }
        
        var PAGE_LINK_COUNT = 10;   // pagination link 갯수
        var TOTAL_LIST_ITEM_COUNT = 0;
        var CURRENT_PAGE_INDEX = 1;
        
        function makeListHtmlEventHandler(){
        	$("#noticeTbody tr").click(function(){
        		var noticeNo = $(this).attr("data-noticeNo");
        		var userseq = '<%=userSeq%>';
        		//detail(noticeNo, userseq);
        	});	
        }
        
        function noticeListTotalCnt(){
        	   
        	   $.ajax(
        	   {
        		   type : 'get',
        	       url : '<%=path%>/notice/noticeListTotalCnt',
        	       dataType : 'json',
        	       data : 
        	      {
        	         searchWord: SEARCH_WORD
        	      },
        	        success : function(data, status, xhr) {
        	           TOTAL_LIST_ITEM_COUNT = data.totalCnt;
        	           addPagination();
        	        }, 
        	        error: function(jqXHR, textStatus, errorThrown) 
        	        { 
        	           alertify.notify(
        	                'Opps!! 글 전체 갯수 조회 과정에 문제가 생겼습니다.', 
        	                'error', //'error','warning','message'
        	                3, //-1
        	                function(){
        	                   console.log(jqXHR.responseText); 
        	                }
        	             );
        	        }
        	    });
        	}

        	function addPagination(){

        	   makePaginationHtml(LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper" );
        	}

        	function movePage(pageIndex){
        	   OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
        	   CURRENT_PAGE_INDEX = pageIndex;
        	   noticeList();
        	}        

</script>

</body>
</html>