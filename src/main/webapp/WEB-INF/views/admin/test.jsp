<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
   Editorial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
   <title>Generic - Editorial by HTML5 UP</title>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="/godinator/css/main.css" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
      
         

<style>
a{
   color:    #f56a6a;
   text-decoration: none;
   border-bottom: none;
   text-decoration: none;
}

a:hover{
   color:   #f56a6a;
   text-decoration: none;
   border-bottom: none;
   text-decoration: none;
   
}

select:hover{
   border-color: #f56a6a;
   box-shadow: 0 0 0 1px #f56a6a;
}

input:hover{
   border-color: #f56a6a;
   box-shadow: 0 0 0 1px #f56a6a;
}


label{
   text-align: center;
   padding-top: 14%;
}

select:hover{
   border-color: #f56a6a;
   box-shadow: 0 0 0 1px #f56a6a;
}


textarea:hover{
   border-color: #f56a6a;
   box-shadow: 0 0 0 1px #f56a6a;
}
.profile_icon {
   width: 40px;
   height: 40px;
   border-radius: 20px; /* 이미지 반크기만큼 반경을 잡기*/
   border: 2px solid white;
}

#download:hover{
   text-decoration: underline;
   color: black;
}
</style>
   
<!-- 모달창 들  -->
<!--장소검색  Modal -->
<script>
$(document).ready(function() {
//------------------------------[학교 검색 모달창 시작]-----------------------------------   
   
   //모달 엔터 클릭시 
   $("#schoolName").keypress(function(key) {
      $("#searchresult").empty();
      var schoolType = $("#schoolType option:selected").val();
      var schoolName = $("#schoolName").val();
      var param = JSON.stringify({'schoolType' : schoolType, 'schoolName' : schoolName});
      if(key.keyCode == 13){
         
         var schoolName = $("#schoolName").val();
         if(schoolName == ""){
            alert("학교 이름을 입력해주세요");
         } else {
            //alert(schoolName);
            $.ajax({
               url:'/godinator/board/searchschool/',
               type: 'POST',
               contentType:'application/json;charset=UTF-8',
               dataType : 'json',
               data: param,
               success : function(response) {
                  if(schoolType == "고등학교"){
                     listHSchool(response);
                     $("#schoolName").val(""); 
                  } else {
                     //alert(response.uSchoolList);
                     listUSchool(response);
                     $("#schoolName").val("");                               
                  }
               }
            });
         }
      }
   });
   
   //모달 검색 버튼
   $("#realSchoolSearchBtn").click(function() {
      $("#searchresult").empty();
      var schoolType = $("#schoolType option:selected").val();
      var schoolName = $("#schoolName").val();
      var param = JSON.stringify({'schoolType' : schoolType, 'schoolName' : schoolName});
      if(schoolName == ""){
         alert("학교 이름을 입력해주세요");
      } else {
         //alert(schoolType+"|||||" + schoolName);
         $.ajax({
            url:'/godinator/board/searchschool/',
            type: 'POST',
            contentType:'application/json;charset=UTF-8',
            dataType : 'json',
            data: param,
            success : function(response) {
               if(schoolType == "고등학교"){
                  listHSchool(response);
                  $("#schoolName").val(""); 
               } else {
                  //alert(response.uSchoolList);
                  listUSchool(response);
                  $("#schoolName").val("");                               
               }
               
            }
         });
      }
         
   });
   
   //학교 이름 동적으로 뿌려주는 메소드 (고등학교, 대학교)
    function listHSchool(hschool) {
       $("#searchresult").empty();
      var hschoolcnt = hschool.hSchoolList.length;
      //alert(hschoolcnt);
      var hschoolstr = '';
      if(hschoolcnt != 0){
         for(var i=0; i<hschoolcnt; i++){
            var schoolName = hschool.hSchoolList[i];
            hschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +schoolName+ '</label><br>';
         }
         $("#searchresult").append(hschoolstr);
      } else {
         hschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +"검색결과가 없습니다."+ '</label><br>';
         $("#searchresult").append(hschoolstr);
      }
   } 
   
    function listUSchool(uschool) {
       $("#searchresult").empty();
      var uschoolcnt = uschool.uSchoolList.length;
      //alert(uschoolcnt);
      var uschoolstr = '';
      if(uschoolcnt != 0){
         for(var i=0; i<uschoolcnt; i++){
            var schoolName = uschool.uSchoolList[i];
            uschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +schoolName+ '</label><br>';
         }
         $("#searchresult").append(uschoolstr);
      } else {
         uschoolstr += '<label class = "searchresult" style = "padding:0;margin:0;">' +"검색결과가 없습니다."+ '</label><br>';
         $("#searchresult").append(uschoolstr);
         
      }
   } 
   
//선택한 학교 label에 보여주기 
   $(document).on("click", ".searchresult", function(){
      var checkschool = $(this).text();
      //alert(checkschool);
      if(checkschool != "검색결과가 없습니다."){
         $(this).parent().siblings("#checkedschool").find("#finalcheck").text(checkschool);
      } else {
         $(this).parent().siblings("#checkedschool").find("#finalcheck").text("");
      }
   });  
      
//modal창 확인 눌렀을 때 바깥 textfield에 학교 이름 뿌리기
   $(document).on("click", "#confirmschool", function(){
      var checkschool = $(this).parent().prev().find("#finalcheck").text();
      //alert(checkschool);
      $("#searchSchool").val(checkschool);
      $("#searchresult").empty();
      $("#finalcheck").empty();
   }); 
   
   //------------------------------[학교 검색 모달창 끝]-----------------------------------   
   
//글 작성 완료 눌렀을 때 
   $("#writeBtn").click(function() {
      if($("#subject").val() == ""){
         alert("제목을 입력해주세요");
         return;
      } else if($("#searchSchool").val() == ""){
         alert("학교 이름을 입력해주세요");
         return;
      } else if($("#content").val() == ""){
         alert("내용을 입력해주세요");
         return;
      } else {
         $("#writeForm").attr("action", "/godinator/board/write").submit();
         
      }
   });
   
      
//글작성 취소 눌렀을 때 list로 돌아가기 
   $("#cancelBtn").click(function() {
      $("#bcode").val("");
      $("#pg").val("1");
      $("#key").val("");
      $("#word").val("");
      location.href="/godinator/board/moveview";
   });
});
</script>   

</head>
   <body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Main -->
               <div id="main">
                  <div class="inner">

                     <!-- Header -->
                        <header id="header">
                           <a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
                           <ul class="icons">
                              <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                              <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                              <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                              <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                              <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
                           </ul>
                        </header>

                     <!-- Content -->
            
            
<style>
   #memberlist {
      cursor: pointer;
   }
   
   #searchText {
      width: 130px;
      box-sizing: border-box;
      border: 2px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
      background-color: white;
      background-image: url('');
      background-position: 10px 10px;
      background-repeat: no-repeat;
      padding: 12px 20px 12px 40px;
      -webkit-transition: width 0.4s ease-in-out;
      transition: width 0.4s ease-in-out;
   }
   
   #searchText {
      width: 100%;
   }
   
   #myModal {
      display: none;
   }
   
   #schoollist tr:hover {
   background-color: purple;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	console.log('${allList}.schoolName');
	console.log('뭐시기');
	
	
	$("#name").keydown(function(e) {
		var $category = $("#category").val();
		var $keyword = $(this).val();
		
		if($keyword.trim().length != 0) {
			$.ajax({
				url : "${root}/school/list",
				type : "GET",
				contentType : "application/json;charset=UTF-8",
				data : "category="+$category+"&keyword="+$keyword,
				dataType : "JSON",
				success : function(result) {
					//alert('result란??' + result) > object로 뜨는디..?
					console.log('${list}');
					var school = $(result).find("school");
					
					for(var i=0; i<school.length; i++) {
						var id = $(school[i]).find("schoolCate").text();
						var name = $(school[i]).find("schoolName").text();
						var email = $(school[i]).find("phone").text();
						var tel = $(school[i]).find("schoolAddress").text();
						
						var tr = $("<tr>").attr("class", "table-active");
						var td1 = $("<td>").html(schoolCate);
						var td2 = $("<td>").html(schoolName);
						var td3 = $("<td>").html(phone);
						var td4 = $("<td>").html(schoolAddress);
			
						tr.append(td1).append(td2).append(td3).append(td4);
						$("#schoollist").append(tr);		
						}
					},
					error : function() {

				}
			});
		} else {
			
		}
	});
	
	
   $("#search").click(function() {
      //$("#searchName").attr("method","GET").attr("action","${root}/school/view").submit();
      var search = $("#name").val();
      //var changed = encodeURI(search)
      //alert(changed);
      /*
      $.ajax({
         url: '${root}/school/list/',
         type: 'GET',
         contentType : 'application/json;charset=UTF-8',
            data : search
      });
      */
      alert(search);
      
      //$("#searchName").attr("method","GET").attr("action","${root}/school/list").submit();
      alert('드디어....!');
   });
   
   $("#modifyBtn").click(function() {
	   alert('수정버튼을 눌렀소');
   });
});

</script>


<!-- 여기 내 내용 width; 872.443 height; 110.653-->
<!-- 
   <section>
   나중에 전체학교 수 등 정보 뿌리기
   </section>
-->

<form class="form-inline" id="searchName" action="" style="padding-top: 50px; margin-bottom: 0px;">
   <div class="col-9 col-12-small">
      <div class="col-2 col-4-small" style="float: right;">
         <ul class="actions">
            <li><a href="#" class="button primary icon"><i class="fas fa-search" id="search"></i></a></li>
            </ul>
           <div class="col-0 col-8-small" style="float: right;"></div>
          </div>
               
       <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float: right;">
          <input type="text" name="name" id="name" value="" placeholder="학교명을 입력하세요" />
       </div>
       
       <div class="col-7 col-7-small" style="float: right;">
         <select name="category" id="category">
            <option value="name">학교명</option>
            <option value="region">지역</option>
           </select>
        </div>
    </div>
</form>

<section style="padding-top: 0px;">
   <div class="table-responsive-lg">
      <table class="table" id="schoollistTop">
         <thead>
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <th>학교유형</th>
               <th>학교명</th>
               <th>학교주소</th>
               <th>현재 멘토수</th>
               <th>비고</th>
            </tr>
         </thead>

         <!-- 잠시 임시! -->
         <tbody id="schoollist">
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>일반대학</td>
               <td>University of Harvard</td>
               <td>Holyoke Center, 1350 Massachusetts Avenue, Boston</td>
               <td>35</td>
               <td><input type="button" data-toggle="modal" data-target="#schoolModal" class="button" id="modifyBtn" value="수정"></td>
            </tr>
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>과학고</td>
               <td>서울과학고등학교</td>
               <td>서울특별시 종로구 명륜1가 혜화로 63</td>
               <td>1</td>
               <td><input type="button" data-toggle="modal" data-target="#schoolModal" class="button" id="modifyBtn" value="수정"></td>
            </tr>
            
            <%-- <c:forEach items="${allList }" var="list" >
            <tr>
               <td><input type="checkbox"><label for="msg1" style="padding-left: 0.1em;"></label></td>
               <td>${list.schoolCate1 }</td>
               <td>${list.schoolName }</td>
               <td>${list.phone }</td>
               <td>${list.schoolAddress }</td>
               <td><input type="button" data-toggle="modal" data-target="#mapModal" class="button" id="modifyBtn" value="수정"></td>
            </tr>
            </c:forEach> --%>

         </tbody>

      </table>
   </div>
</section>
            
            
            
            
            
            
            
            
            
            
            
            
            
                        <!-----------------------------------[지도 modal]----------------------------------------------->
                           
           
<!----------------------------[다음 지도 ]-------------------------------------------------------------->


<!-----------------------------학교 검색  modal---------------------------->                     
                             <div class="modal fade" id="schoolModal">
                               <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                 
                                   <!-- Modal Header -->
                                   <div class="modal-header">
                                     <h4 class="modal-title">학교이름 검색</h4>
                                     <input type="button" class="button close" data-dismiss="modal" value="&times;" style="width:10;height:10;padding-top: 0;">
                                   </div>
                                   
                                   <!-- Modal body -->
                                   <div class="modal-body">
                                      <div class = "row" style="margin:auto 0;"> 
                                         <div class = "col-3" style="margin-left: 0;margin-right: 0;padding:0;">

                                         <select id = "schoolType">
                                            <option>고등학교</option>
                                          <option>대학교</option>
                                         </select>
                                         </div>
                           
                                         <div class = "col-7" style="margin-left: 0;margin-right: 0;padding:0;">
                                         <input type = "text" id = "schoolName" name = "schoolName">
                                         </div>
                                       <div class = "col-2" style="margin-left: 0;margin-right: 0;padding:0;">
                                       <input type = "button" id = "realSchoolSearchBtn" value = "검색">
                                       </div>
                                       
                                       <div class = "col-4"></div>
                                       <div id = "searchresult" class = "col-6" style = "overflow-y: auto;height: 150px; margin: 0 auto;" >
                                       </div>        
                                       <div class = "col-2"></div>
                                       <hr>
                                       <div class = "col-4"></div>
                                       <div class = "col-4" id = "checkedschool">
                                          <label id = "finalcheck"></label>
                                       </div>
                                       <div class = "col-4"></div>
                                      </div>
                                   </div>
                                   
                                   <!-- Modal footer -->
                                   <div class="modal-footer">
                                     <input id = "confirmschool" type="button" class="button primary" data-dismiss="modal" value = "확인">
                                   </div>
                                   
                                 </div>
                               </div>
                             </div>            
                        
                        

<!-- Sidebar -->
 

         </div>
</div>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>