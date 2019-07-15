<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ë°”ë¡œ „ì—section -->	
	</div>
</div>

<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<section id="mainPage" class="alt">
			<span>ê³ ë””¤ì´/span>
		</section>
		
		<nav id="menu">
			<header class="major"><h2>Menu</h2></header>
			<ul>
				<c:if test="${not empty userInfo}">
					<li>
					<span class="opener">ë§ˆì´˜ì´ì§€</span>
					<ul>
						<li><a href="${root}/jinro/geomsa">ì§„ë¡œê²€/a></li>
						<li><a href="${root}/schoolinfo/hrating">ê³ ë“±™êµ ëª¨êµ ‰ê</a></li>
						<li><a href="${root}/schoolinfo/urating">€™êµ ëª¨êµ ‰ê</a></li>
					</ul>
					</li>
				</c:if>
				<li>
					<span class="opener">™êµ •ë³´</span>
					<ul>
						<li><a href="${root}/searchschool/viewsearch">™êµ ê²€/a></li>
						<li><a href="${root}/schoolnews/viewnews">™êµ ´ìŠ¤ ê²€/a></li>
					</ul>
				</li>
				<li>
					<span class="opener" id = "community">ì»¤ëˆí‹°</span>
					<ul id ="communityMenu">
						<li><a href="${root}/board/list?boardCategory=1&pg=1&key=&word=">ë³´ê²Œì‹œ/a></li>
						<li><a href="${root}/board/list?boardCategory=2&pg=1&key=&word=">ê³ ë“±™êµ ê²Œì‹œ/a></li>
						<li><a href="${root}/board/list?boardCategory=3&pg=1&key=&word=">€™êµ ê²Œì‹œ/a></li>
						<li><a href="${root}/board/list?boardCategory=4&pg=1&key=&word=">ê²Œì‹œë¬/a></li>
					</ul>
				</li>
				<li>
					<span class="opener">ë©˜í† ë§/span>
					<ul>
						<li><a href="${root}/mentor/findmentor">ë©˜í†  ì°¾ê¸°</a></li>
						<li><a href="${root}/msg/msgbox">ìª½ì/a></li>
						<li><a href="${root}/resume/resumelist">ì†Œœëª©ë¡/a></li>
						<li><a href="${root}/resume/editlist">ì²¨ì‚­ëª©ë¡</a></li>
					</ul>
				</li>
			</ul>
		</nav>

		<!-- Section -->
		<section>
			<header class="major">
				<h2>Get in touch</h2>
			</header>
			<ul class="contact">
				<li class="icon solid fa-envelope"><a href="#">claire97j@naver.com</a></li>
				<li class="icon solid fa-phone">(000) 000-0000</li>
				<li class="icon solid fa-home">œìš¸êµ¬ë¡œêµ”ì¸ë¡œ 34ê¸43 <br>ì½”ì˜¤ë¡±ì‚¬´ì–¸¤ë²¨ë¦1ì°4ì¸
				</li>
			</ul>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>
</div>
</div>

<!-- Scripts -->
<script src="${root}/js/browser.min.js"></script>
<script src="${root}/js/breakpoints.min.js"></script>
<script src="${root}/js/util.js"></script>
<script src="${root}/js/main.js"></script>
<script>
	$(document).ready(function() {
		$("section#mainPage").click(function() {
			$(location).attr("href", "${root}/board/main");
		});
	});
</script>
</body>
</html>