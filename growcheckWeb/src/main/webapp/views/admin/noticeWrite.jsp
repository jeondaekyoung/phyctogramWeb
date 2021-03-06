<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>공지사항</title>
  <jsp:include page="include/head.jsp"/>
</head>
    
<body>
  	
  <!-- header -->
 	<jsp:include page="include/header.jsp" flush="false"/>
  <!-- / header -->
  
  <section id="content">
    <div class="bg-dark lt">
      <div class="container">
        <div class="m-b-lg m-t-lg">
          <h3 class="m-b-none">공지사항</h3>
          <small class="text-muted">Notice</small>
        </div>
      </div>
    </div>
    <div>
      <div class="container m-t-xl">
        <div class="row">
          <div class="col-sm-12">
            <section class="list-group alt">
                <ul class="list-group list-group-lg">
                
                <form action="<%=application.getContextPath() %>/notice/modeModify.do" method="POST" id="register">
                	<input type="hidden" value="${mode }" id="mode" >
                	<input type="hidden" value="${notice.notice_seq }" name="notice_seq">
                  <li class="list-group-item"><!-- 제목영역 -->
                    <div class="media">
                        <input class="form-control input-lg" type="text" id="title" name="title" placeholder="제목을 입력하세요" value="${notice.title }">
                    </div>
                  </li>
                  <!-- /제목영역 -->
                  
                  <li class="list-group-item"><!-- 내용영역 -->
                    <div class="media">
                      <div class="media-body">
                        <div id="editor">
							<textarea rows="20" cols="100" class="form-control" style="overflow:auto;min-height:300px;" id="notice" name="notice" placeholder="내용을 입력하세요" >${notice.notice }</textarea>
						</div>						
                      </div>
                    </div>
                  </li><!-- 내용영역 -->
                </ul>
                </form>
            	<button class="btn btn-danger btn-block btn-lg m-b-sm" id="registerBtn">작성완료</button>
                
            </section>
          </div>
        </div>        
      </div>
    </div>
  </section>
  
  <!-- footer -->
  	<jsp:include page="include/footer.jsp" flush="false"/>
  <!-- / footer --> 

  <script type="text/javascript">
  
  $(document).ready(function(){
	  
	  var mode = $("#mode").val();
	  console.log("모드 : " + mode);
	  
	  if(mode == "modify") {
		  $("#registerBtn").text("수정하기");
	  }
	  //공지사항 수정
	  $("#registerBtn").click(function(){
		  if(checkValue() == true){
			  if(mode == "modify"){
				  $("#register").submit();
			  } else {
				  register();
			  }
		  }
	  });
  });
  
  //작성하기
  var register = function(){
	  console.log("작성하기");
	  var f = document.createElement('form');
	  var objs = document.createElement('input');
	  objs.setAttribute('type','hidden');
	  objs.setAttribute('name', 'title');
	  objs.setAttribute('value', $("#title").val());
	  f.appendChild(objs);
	  var objs1 = document.createElement('input');
	  objs1.setAttribute('type','hidden');
	  objs1.setAttribute('name', 'notice');
	  objs1.setAttribute('value', $("#notice").val());
	  f.appendChild(objs1);
	  
	  f.setAttribute('action', rootPath+"/notice/register.do");
	  f.setAttribute('method','post');
	  document.body.appendChild(f);
	  f.submit();
  }
  
  //값 체크
  var checkValue = function(){
	  if($("#title").val() == ""){
		  alert("제목을 입력해주세요");
		  $("#title").focus();
		  return false;
	  } else if($("#notice").val() == ""){
		  alert("내용을 입력해주세요");
		  $("#notice").focus();
		  return false;
	  }
	  return true;
  }
  </script>
  
</body>
</html>