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
       //console.log('${allList});
       //console.log($.type('${hlist}')); // list가 아니라 String이라는데..?
       console.log('뭐시기3dd');
       
       
       $("#name").keydown(function(e) {
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
                                		  
                                console.log('성공!! '+data);
                                		  
                                  var member = $(data).find("member");
                                  for(var i=0;i<'${list}'.length;i++) {
                                  var id = $(member[i]).find("id").text();
                                  var name = $(member[i]).find("name").text();
                                  var email = $(member[i]).find("email").text();
                                  var tel = $(member[i]).find("tel").text();
                                  var address =  $(member[i]).find("address").text();
                                  var joindate =  $(member[i]).find("joindate").text();
                                  
                                  var tr = $("<tr>").attr("class",  "table-active");
                                  var td1 = $("<td>").html(id);
                                  var td2 = $("<td>").html(name);
                                  var td3 = $("<td>").html(email);
                                  var td4 = $("<td>").html(tel);
                                  var td5 = $("<td>").html(address);
                                  var td6 = $("<td>").html(joindate);
              
                                  tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
                                  $("#mlist").append(tr);
                                  
                           }
                                  },
                                  error : function() {
                                	  console.log('실패');
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
   });
   
   $("#modifyBtn").click(function() {
          alert('수정버튼을 눌렀니');
          location.href = "modify";
   });
});
</script>
<!-- 여기 내 내용 width; 872.443 height; 110.653-->
<!--
   <section>
   나중에 전체학교 수 등 정보 뿌리기
   </section>
-->
<form class="form-inline" id="searchName" action="" style="padding-top: 50px;  margin-bottom: 0px;">
   <div class="col-9 col-12-small">
      <div class="col-2 col-4-small" style="float: right;">
         <ul class="actions">
            <li><a href="#" class="button primary icon"><i class="fas fa-search"  id="search"></i></a></li>
            </ul>
           <div class="col-0 col-8-small" style="float: right;"></div>
          </div>
               
       <div class="col-3 col-5-small" style="margin: 0 1em 0 0.5em; float:  right;">
          <input type="text" name="name" id="name" value="" placeholder="학교명을  입력하세요" />
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
               <th>현재 멘토수</th>
               <th>비고</th>
            </tr>
         </thead>
         <!-- 잠시 임시! -->
         <tbody id="schoollist">
            <tr>
               <td>일반대학</td>
               <td>University of Harvard</td>
               <td>02-533-8097</td>
               <td>Holyoke Center, 1350 Massachusetts Avenue, Boston</td>
               <td>35</td>
               <td><input type="button" data-toggle="modal"  data-target="#mapModal" class="button" id="modifyBtn" value="수정"></td>
            </tr>
            <tr>
               <td>${schoolCate1}</td>
               <td>${schoolName}</td>
               <td>${phone}</td>
               <td>${schoolAddress}</td>
               <td>현재 멘토수</td>
               <td><input type="button" data-toggle="modal"  data-target="#mapModal" class="button" id="modifyBtn" value="수정"></td>
            </tr>
    
         </tbody>
      </table>
   </div>
</section>
<%@ include file="/WEB-INF/views/template/sidebar.jsp"%>