<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Sports Team &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700"> 
    <link rel="stylesheet" href="../static/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="../static/css/jquery-ui.css">
    <link rel="stylesheet" href="../static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../static/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../static/css/animate.css">
    <link rel="stylesheet" href="../static/fonts/flaticon/font/flaticon.css">
    
  
    <link rel="stylesheet" href="../static/css/aos.css">

    <link rel="stylesheet" href="../static/css/style.css">
    
  </head>
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

    <div class="container">

      <div class="row no-gutters site-navbar align-items-center py-3">

        <div class="col-6 col-lg-2 site-logo">
          <a href="index.html">SportsTeam</a>
        </div>
        <div class="col-6 col-lg-10 text-right menu">
          <nav class="site-navigation text-right text-md-right">

              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <li>
                  <a href="index.html">Home</a>
                </li>
                <li><a href="gallery.html">Gallery</a></li>
                <li class="has-children">
                  <a href="players.html">Players</a>
                  <ul class="dropdown arrow-top">
                    <li><a href="#">Jakub Bates</a></li>
                    <li><a href="#">Russell Vance</a></li>
                    <li><a href="#">Carson Hodgson</a></li>
                    <li class="has-children">
                      <a href="#">Sub Menu</a>
                      <ul class="dropdown">
                        <li><a href="#">Joshua Fugueroa</a></li>
                        <li><a href="#">Jakub Bates</a></li>
                        <li><a href="#">Russell Vance</a></li>
                        <li><a href="#">Carson Hodgson</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="active"><a href="events">Events</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>

              <a href="#" class="site-menu-toggle js-menu-toggle text-black d-inline-block d-lg-none"><span class="icon-menu h3"></span></a>
            </nav>
        </div>
      </div>

    </div>
    
    
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="hero-wrap text-center" style="background-image: url('../static/images/hero_2.jpg');" data-stellar-background-ratio="0.5">
            <div class="hero-contents">
              <h2>대회 일정</h2>
              <p><a href="index.html">Home</a> <span class="mx-2">/</span> <strong>Events</strong></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
     <div class="row no-gutters site-subbar align-items-center py-3" >
        <div>
          <nav class="site-navigation text-left text-md-left" style="float: left;">

              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <li class="has-children">
                  	대회
                  <ul class="dropdown arrow-top">
                    <li>마라톤</li>
                    <li>걷기</li>
                  </ul>
                </li>
                <li class="has-children">
                	종목
                	<ul class="dropdown arrow-top">
                		<li>풀코스</li>
                	</ul>
                </li>
                <li class="has-children">
                  <a href="#">월</a>
                  <ul class="dropdown arrow-top">
                    <li><button style="width: 70px" type="button" onclick="test()">1월</button></li>
                    <li>2월</li>
                    <li>3월</li>
                    <li>4월</li>
                    <li>5월</li>
                    <li>6월</li>
                    <li>7월</li>
                    <li>8월</li>
                    <li>9월</li>
                    <li>10월</li>
                    <li>11월</li>
                    <li>12월</li>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="#">상태</a>
                  <ul class="dropdown arrow-top">
                    <li>접수중</li>
                    <li>접수예정</li>
                    <li>접수마감</li>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="#">도</a>
                  <ul class="dropdown arrow-top">
                    <li>경기도</li>
                    <li>강원도</li>
                    <li>경상도</li>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="#">시/군</a>
                  <ul class="dropdown arrow-top">
                    <li>고양시</li>
                    <li>광주시</li>
                  </ul>
                </li>
                
              </ul>
              

         
            </nav>
            <form action="#" class="contact-form" style="float: right;">
                <label class="font-weight-bold" for="racename">대회명 검색</label>
                <input type="text"  class="form-race" placeholder="대회명 입력">
            </form>
        </div>
      </div>
            
  

    <div class="site-section">
      <div class="container">
       

        <div class="row mb-5">
          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="../static/images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <h3><a href="#">제 2회 고양시 마라톤 대회</a></h3>
                <div>경기도 고양시</div>
                <span class="caption" style="font-size: 10px">2023년 7월 5일</span>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Line for the upcoming match</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Roman Greg scorer 4 goals</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Roman Greg scorer 4 goals</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Roman Greg scorer 4 goals</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Line for the upcoming match</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Roman Greg scorer 4 goals</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
            <div class="custom-media d-block">
              <div class="img-wrap mb-3">
                <a href="#"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
              </div>
              <div>
                <span class="caption">May 19, 2020</span>
                <h3><a href="#">Roman Greg scorer 4 goals</a></h3>
                <p class="mb-0"><a href="#" class="more"><span class="mr-2">+</span>Learn More</a></p>
              </div>
            </div>
          </div>


        </div>

        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="custom-pagination">
              <a href="#">1</a>
              <span>2</span>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
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

  <script src="../static/js/jquery.min.js"></script>
  <script src="../static/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../static/js/jquery-ui.js"></script>
  <script src="../static/js/popper.min.js"></script>
  <script src="../static/js/bootstrap.min.js"></script>
  <script src="../static/js/owl.carousel.min.js"></script>
  <script src="../static/js/jquery.stellar.min.js"></script>
  <script src="../static/js/jquery.fancybox.min.js"></script>
  <script src="../static/js/aos.js"></script>

  <script src="../static/js/main.js"></script>
    
  </body>
  <script type="text/javascript">
  	function test(){
  		alert("버튼 클릭");
  	}
  
  </script>
</html>