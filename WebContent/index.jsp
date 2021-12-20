<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">
<%@ include file="../../layout/header.jsp"%>
<jsp:include page="layout/popup.jsp"/>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/aqua.css?cxz12312312">
    <script src="js/gnb.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <script src="js/main.js"></script>
    <script src="js/theme.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    
</head>
<style>
	#header{
		margin-bottom:0px;
	}
</style>
<body>

 <section id="visual"><a>Aqua Planet</a>
    <P>아쿠아플라넷에서 만나는 바다와 정글속 환상 탐험!</P>
    
        <section id="theme" class="content">
        <div class="inner">
            <h1 class="title">Theme</h1>
            <ul class="tab_1">
                <li>
                    <a>아쿠아리움</a>
                    <div class="panel">
                        <div class="pic"><img src="img/theme/thm1.jpg" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">신비롭고 아름다운<br> 바닷속 아쿠아리움 세상</h3>
                            <p class="tours_txt">다양한 해양 동물들이 가득한 아쿠아리움 테마존 입니다.</p>
                            <a href="html/themeA.jsp" class="tours_btn">자세히 보기 ></a>
                            
                        </div>
                      
                    </div>
                </li>
                 <li>
                    <a>파충류관</a>
                    <div class="panel">
                        <div class="pic"><img src="img/theme/thm2.jpg" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">다양한 뱀과 도마뱀을<br>직접 만져보는 파충류관</h3>
                            <p class="tours_txt">다양한 해양동물들이 가득한 아쿠아리움 파충류관 입니다.</p>
                            <a href="html/themeB.jsp" class="tours_btn">자세히 보기 ></a>
                        </div>

                    </div>
                </li>
                <li>
                    <a>정글존</a>
                    <div class="panel">
                        <div class="pic"><img src="img/theme/thm3.JPG" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">광활환 밀림과 우거진 수풀이<br>공존하는 정글월드!</h3>
                            <p class="tours_txt">정글속 다양한 동물들이 가득한 아쿠아리움 정글존 입니다.</p>
                            <a href="html/themeC.jsp" class="tours_btn">자세히 보기 ></a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    
    
    <section id="parade" class="content">
        <div class="inner">
            <ul class="tab">
                <li>
                    <h2 class="title">parade</h2>
                    <div class="div pannel">
                    <iframe width="1000px" height="450px" src="https://www.youtube.com/embed/xc7efOZRLSk" 
                    title="YouTube video player" frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                    </iframe></div>
                </li>
            </ul>
        </div>
    </section>
    
    
    <section id="cardnews" class="content">
        <div class="inner">
        <h2 class="title">아쿠아플라넷</h2>
        <p class="txt">아쿠아플라넷의 자세한 정보를 확인하실 수 있습니다.</p>
            <div class="box">
                <div class="pic"><img src="" alt=""></div>
                <div class="info">
                    <strong>이용요금 안내</strong>
                    <p>입장권 및 이용안내 서비스 안내입니다.</p>
                    <a href="html/about_us_cost.jsp" class="btn"><span>더보기</span></a>
                </div>
            </div>
            <div class="box">
                <div class="pic"><img src="" alt=""></div>
                <div class="info">
                    <strong>프로그램 안내</strong>
                    <p>아쿠아리움 프로그램 안내 입니다.</p>
                    <a href="html/themeA.jsp" class="btn"><span>더보기</span></a>
                </div>
            </div>
            <div class="box">
                <div class="pic"><img src="" alt=""></div>
                <div class="info">
                    <strong>EVENT</strong>
                    <p>아쿠아플라넷의 다양한 이벤트를 경험해 보세요.</p>
                    <a href="${pageContext.request.contextPath}/member/product/goods_group.jsp" class="btn"><span>더보기</span></a>
                </div>
            </div>
            
        </div>
    </section>
    
    

    </section>
    
    
    

    
    
    
<footer id="footer">
        <div class="inner">
            <div class="box logo">
                <div class="logo_footer"><a href="#">아쿠아플라넷</a></div>
            </div>
            <div class="box contact">
                <p><i class="fas fa-phone-alt"></i><span class="txt">32-326-9500 (단체문의 : 032-326-9503)</span></p>
                <p><i class="fas fa-street-view"></i><span class="txt">서울 강남구 영동대로 513 코엑스아쿠아리움 </span></p>
                <p><i class="fas fa-clock"></i><span class="txt">Mon–Sat: 10:00am–8:00pm</span></p>
            </div>
            <div class="box sns">
                 <ul class="sns">
                    <li><a href="https://ko-kr.facebook.com/"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="https://twitter.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>
                    <li><a href="https://www.instagram.com/?hl=ko"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
        </div>
</footer>
    

    
</body>
</html>