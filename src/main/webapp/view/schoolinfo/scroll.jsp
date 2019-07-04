<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
(function(){
    var num = 0;
    $(window).scroll(function(){
        // 조건식에서 == 보다 >= 를 사용 한 이유
        // == 스크롤 높이가 뭐빼기 뭐해서 같으면 끝까지 왔다라고 생각하는건데 >= 는 스크롤높이가 뭐빼기 뭐보다 더 커도(더 밑으로 내려가있어도) 끝까지 간거다 
        // 브라우저마다 특성이 다르기 때문에 같다보다는 크거나 같음으로 진행
        if($(window).scrollTop() >= $(document).height() - $(window).height()){ // 스크롤의 마지막 값을 인식한다.
            var $clone = '<div style="width: 540px; height: 200px; border: 3px solid red;">test</div>';
            num++;
            $('.infiniteScroll').append($clone);
            console.log(num);
        }
    })
})();
</script>
<style>
	div.infiniteScroll {
		overflow-y: auto;
	}
</style>
</head>
<body>
	<div class="infiniteScroll" style="width: 600px; height: 300px; border: 3px solid black;" align="center">
		<div style="width: 540px; height: 200px; border: 3px solid red;">test</div>
		<div style="width: 540px; height: 200px; border: 3px solid red;">test</div>
		<div style="width: 540px; height: 200px; border: 3px solid red;">test</div>
	</div>

</body>
</html>