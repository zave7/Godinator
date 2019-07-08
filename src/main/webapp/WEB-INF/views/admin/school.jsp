<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   background-color: yellow;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	allList(); // 실행되자마자 전체 개수 조회할수도 있게해!
	
	$('tr.table-active').click(function() {
		//var a = $(this).text();
		alert('클릭했슈!');	
	});
	
    $("#name").keyup(function(e) {
           var $category = $("#category").val();
           var $keyword = $(this).val();
            
           if($keyword.trim().length != 0) {
                  $.ajax({
                        url : "${root}/school/list",
                        type : "GET",
                        contentType : "application/json;charset=UTF-8",
                        data : "category="+$category+"&keyword="+$keyword,
                        dataType : "json",
                        success : function(data) {
                               //alert('result란??' + result) > object로  뜨는디..?
                             console.log(data + "/받는거 성공");
                             if(data.schoolNames != null){
                                for(var i=0;i<data.schoolNames.length;i++){
                                     var schoolCate = data.schoolNames[i].schoolCate1;
                                     var schoolName = data.schoolNames[i].schoolName;
                                     var phone = data.schoolNames[i].phone;
                                     var address = data.schoolNames[i].schoolAddress;
                                     //console.log(schoolCate + '/'+schoolName);
                                      
                                     var tr = $("<tr>").attr("class", "table-active");
                     	    		 var td1 = $("<td>").html(schoolCate);
                        			 var td2 = $("<td>").html(schoolName);
                        			 var td3 = $("<td>").html(phone);
                        			 var td4 = $("<td>").html(address);
                        			 var td5 = $("<td>").html('0');
                        			 var td6 = $("<td>").html('<input type="button" class="button" id="modifyBtn" value="수정">');
                        			 
                        			 tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
                        			 $("#schoollist").append(tr);
                        			 //$("#schoollist").remove();
                        			 
                        			 $("#modifyBtn").click(function() {
                        			      console.log('1111111111modify를 눌렀는데 반응함?');
                        			      location.href = "modify";
                        			   });
                                        
                                  } // for문 끝
                               } // if문 끝
                                 
                               },
                         error : function() {
                            //alert('검색이 실패하였습니다.');
                        }});
           } else {
    }});
    
    function allList() {
    	// 시작할 때 모든 학교 리스트 다 보도록
    	 var keyword = "h_school";
           
    	 $.ajax({
             url : "${root}/school/list",
             type : "GET",
             contentType : "application/json;charset=UTF-8",
             data : "keyword="+keyword,
             dataType : "json",
             success : function(data) {
                  console.log(data + "받는거 성공");
                  if(data.schoolNames != null){
                     for(var i=0;i<data.schoolNames.length;i++){
                         var schoolCate = data.schoolNames[i].schoolCate1;
                         var schoolName = data.schoolNames[i].schoolName;
                         var phone = data.schoolNames[i].phone;
                         var address = data.schoolNames[i].schoolAddress;
                          //console.log(schoolCate + '/'+schoolName);
                           
                         var tr = $("<tr>").attr("class", "table-active");
          	    		 var td1 = $("<td>").html(schoolCate);
             			 var td2 = $("<td>").html(schoolName);
             			 var td3 = $("<td>").html(phone);
             			 var td4 = $("<td>").html(address);
             			 var td5 = $("<td>").html('0');
             			 var td6 = $("<td>").html('<input type="button" class="button" id="modifyBtn" value="수정">');
             			 
             			 tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
             			 $("#schoollist").append(tr);
             			 
          			   }); // modifyBtn event
                    } // for문
              } // if문
                    
                  $('tr.table-active').click(function() {
              		var a = $(this);
              		
              		alert(a);	
              		location.href = "modify";
              	});
                    }, // success function
              error : function() {
                 alert('검색이 실패하였습니다.');
             }});
    }
       
       
   $("#search").click(function() {
      var search = $("#name").val();
      //alert(search);
   });
   
   
});
</script>

<form class="form-inline" id="searchName" action="" style="padding-top: 50px;  margin-bottom: 0px;">
   <div class="col-9 col-12-small">
      <div class="col-2 col-4-small" style="float: right;">
         <ul class="actions">
            <li><a href="#" class="button primary icon"><i class="fas fa-search"  id="search"></i></a></li>
            </ul>
           <div class="col-0 col-8-small" style="float: right;"></div>
          </div>
               
       <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float:  right;">
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
               <th>학교유형</th>
               <th>학교명</th>
               <th>전화번호</th>
               <th>학교주소</th>
               <th>총 멘토수</th>
               <th>비고</th>
            </tr>
         </thead>
         
         <tbody id="schoollist">
         </tbody>
         
      </table>
   </div>
</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>