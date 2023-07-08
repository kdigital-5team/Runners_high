<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>mypage_feed</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="../static/css/jquery-ui.css">
    <link rel="stylesheet" href="../static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../static/css/animate.css">
    <link rel="stylesheet" href="../static/css/image_crop.css">
    <link rel="stylesheet" href="../static/css/popup.css">
    <link rel="stylesheet" href="../static/css/feed.css">     
    <link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
    
    
  
    <link rel="stylesheet" href="../static/css/aos.css">

    <link rel="stylesheet" href="../static/css/style2.css">
    
  </head>
  <style>
  </style>
  <body>
    
  
    <div class="site-wrap">


    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->

	<!-- 헤더 -->
    <div "class="container">

       <div class="row no-gutters site-navbar align-items-center py-3">

        <div class="col-6 col-lg-2 site-logo">
          <a role="button" onclick="location.href='/main'">Runner's High</a>
        </div>
        <div class="col-6 col-lg-10 text-right menu">
          <nav class="site-navigation text-right text-md-right">

              <ul class="site-menu js-clone-nav d-none d-lg-block">
						<li class="active"><a role="button" onclick="location.href='/main'">MAIN</a></li>
						<li><a role="button" onclick="location.href='/events'">대회일정</a></li>
						<li><a role="button" onclick="location.href='/gallery'">챌린지</a></li>
						<li><a role="button" onclick="location.href='/mypage_feed'">마이 페이지</a></li>
						<li><a href="about.html">달리기</a></li>
						<c:if test="${empty userId}">
							 <li><a role="button"
									class="change-button"
									onclick="location.href='/login'"
									style="font-size: 13px;">로그인</a></li>
							<li><a role="button"
								   onclick="location.href='/'"
								   style="font-size: 13px;">회원가입</a></li>
						</c:if>
						<c:if test="${not empty userId}">
							<li><a role="button"
								   class="change-button"
								   onclick="location.href='/logout'"
								   style="font-size: 13px;">로그아웃</a></li> 
						</c:if>
				</ul>

              <a href="#" class="site-menu-toggle js-menu-toggle text-black d-inline-block d-lg-none"><span class="icon-menu h3"></span></a>
            </nav>
        </div>
      </div>

    </div>
    
    <!-- 피드 / 챌린지 / 칭호 탭 -->
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="hero-wrap text-center" style="" data-stellar-background-ratio="0.5">
            <div class="hero-contents">
              <p><a href="mypage_feed"><strong>피드</strong></a> <span class="mx-2">|</span> <a href="mypage_chall">참여 챌린지</a> 
              				<span class="mx-2">|</span> <a href="mypage_title">칭호</a> <span class="mx-2"></span> 
              				<button style="float: right;"><a href="#" onclick="location.href='/index'" >추가</a></button></p>
            </div>
          </div>
        </div>
      </div>
    </div>
        
	<!-- 피드 목록-->
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
            <div class="img-wrapper">            	
	        	<a id="layer_button" target="_self" role=button><img src="../static/images/test.jpg" alt="Image" class="img-block"></a>                        	
            </div>
          </div>
          <div class="layer" id="layer">
            <div class="layer_content">
            	<div class="post">
		            <div class="post-header">
		                <img src="/static/images/test.jpg" alt="Profile Picture">
		                <div class="username">john_doe</div>                            			
		            </div>            
		            <hr>       
		            <div class="display-flex">
		            	<img class="post-image" src="../static/images/test.jpg" alt="Post Image" >
		            </div>                  
		        	<hr>				                   
		            <div class="display-flex">            
				        <div class="left-likes"><button>Like</button></div>
				        <div class="left-likes-num">42</div>
				        <div class="right-edit"><button>수정</button></div>
				        <div class="right-delete"><button>삭제</button></div>     
			        </div>
			        <!-- 피드 내용 -->
		            <div class="post-description">
		                TEST 테스트</br>
		                TEST 테스트</br>
		                TEST 테스트</br>
		                TEST 테스트</br>
		            </div>                      
		        </div>
            </div>
	   	</div>
	  
       	
        
          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
            <div class="img-wrapper">            	
	              <button onclick="window.open('feed2.html','window_name','width=800px,height=1000px,location=no, status=no, scrollbars=no');">
	              	<img src="../static/images/test2.jpg" alt="Image" class="img-block"></button>	            
              <div class="p-4">
              </div>
            </div>
          </div>
          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
            <div class="img-wrapper">
              <a href="#"><img src="../static/images/test3.jpg" alt="Image" class="img-fluid"></a>
              <div class="p-4">
              </div>
            </div>
          </div>
          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
            <div class="img-wrapper">
              <a href="#"><img src="../static/images/test4.jpg" alt="Image" class="img-fluid"></a>
              <div class="p-4">
              </div>
            </div>
          </div>    
         </div>
      </div>
    </div>     
	
	<div class="site-section">
	   	<div class="container">
	   		<div class="row">
	          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
	            <div class="img-wrapper">
	              <a href="#"><img src="../static/images/test.jpg" alt="Image" class="img-fluid"></a>
	              
	            </div>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
	            <div class="img-wrapper">
	              <a href="#"><img src="../static/images/test2.jpg" alt="Image" class="img-fluid"></a>
	              <div class="p-4">
	              </div>
	            </div>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
	            <div class="img-wrapper">
	              <a href="#"><img src="../static/images/test3.jpg" alt="Image" class="img-fluid"></a>
	              <div class="p-4">
	              </div>
	            </div>
	          </div>
	          <div class="col-6 col-sm-6 col-md-4 col-lg-3">
	            <div class="img-wrapper">
	              <a href="#"><img src="../static/images/test4.jpg" alt="Image" class="img-fluid"></a>
	              <div class="p-4">
	              </div>
	            </div>
	          </div>
        	</div>
      	</div>
    </div>

   <!-- footer -->
     <div class="footer">
      <div class="container" style="text-align:center;">
        <div class="row footer-inner" >
            <div class="widget mb-4" style="margin: 0 auto;" >
              <h3>About Us</h3>
              <p>Runner’s High</p>
              <p>K-Digital Training Project</p>
              <p>contact : ddfs@gmail.com</p>
            </div>
        </div>
      </div> 
  </div>
    

  </div>
  <!-- 피드 상세보기 레이어 팝업 js문 -->
  <script>
            const layer_button = document.getElementById("layer_button");
            const layer = document.getElementById("layer");
            const layer_content = document.getElementById("layer_content");

            layer_button.addEventListener("click", function(e) {
                layer.style.display = "flex";
            });            
            
            layer.addEventListener("click", e => {
                const evTarget = e.target
                if(evTarget.classList.contains("layer")) {
                    layer.style.display = "none"
                }
            });
  </script>	
  
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>