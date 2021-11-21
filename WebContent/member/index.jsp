<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/aqua.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../js/gnb.js"></script>
    <script src="../js/modernizr.custom.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/theme.js"></script>
</head>

<body>

    <section id="visual"><a>Aqua Planet <br>MAIN text MAIN text</a>
    
    <section id="parade" class="content">
        <div class="inner">
            <ul class="tab">
                <li>
                    <a href="#" class="menu">평일</a>
                    <div class="div pannel"></div>
                </li>
                <li>
                    <a href="#" class="menu">주말</a>
                    <div class="div pannel"></div>
                </li>

            </ul>
        </div>
    </section>
    <section id="theme" class="content">
        <div class="inner">
            <h1 class="title">Theme</h1>
            <ul class="tab_1">
                <li>
                    <a href="#">Theme1</a>
                    <div class="panel">
                        <div class="pic"><img src="../img/1.png" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">신비롭고 아름다운<br> 바닷속 아쿠아리움 세상</h3>

                            <p class="tours_txt">다양한 해양 동물들이 가득한 아쿠아리움 테마존 입니다.</p>
                            <a href="#" class="tours_btn">자세히 보기 ></a>
                            
                        </div>
                      
                    </div>
                </li>
                 <li>
                    <a href="#">Theme2</a>
                    <div class="panel">
                        <div class="pic"><img src="../img/1.png" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">다양한 뱀과 도마뱀을<br>직접 만져보는 파충류관</h3>
                            <p class="tours_txt">다양한 해양동물들이 가득한 아쿠아리움 파충류관 입니다.</p>
                            <a href="#" class="tours_btn">자세히 보기 ></a>
                        </div>

                    </div>
                </li>
                <li>
                    <a href="#">Theme3</a>
                    <div class="panel">
                        <div class="pic"><img src="../img/1.png" alt=""></div>
                        <div class="info">
                            <h3 class="tours_title">테마3</h3>
                            <p class="tours_txt">테마3</p>
                            <a href="#" class="tours_btn">자세히 보기 ></a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    </section>
    
    
    
     <section id="cardnews" class="content">
        <div class="inner">
        <h2 class="title">아쿠아플라넷</h2>
        <p class="txt">공지사항을 클릭하시면 더 자세한 정보를 확인하실 수 있습니다.</p>
            <div class="box">
                <div class="pic"><img src="../aqua/img/main.jpg" alt=""></div>
                <div class="info">
                    <strong>NEWS 1</strong>
                    <i class="far fa-smile-win"></i>
                    <p>카드뉴스</p>
                    <a href="#" class="new_item_btn"><span>더보기</span></a>
                </div>
            </div>
            <div class="box">
                <div class="pic"><img src="../aqua/img/img.jpg" alt=""></div>
                <div class="info">
                    <strong>NEWS 2</strong>
                    <i class="far fa-smile-wik"></i>
                    <p>카드뉴스</p>
                    <a href="#" class="new_item_btn"><span>더보기</span></a>
                </div>
            </div>
            <div class="box">
                <div class="pic"><img src="../aqua/img/img.jpg" alt=""></div>
                <div class="info">
                    <strong>NEWS 3</strong>
                    <i class="far fa-smile-wnk"></i>
                    <p>카드뉴스</p>
                    <a href="#" class="new_item_btn"><span>더보기</span></a>
                </div>
            </div>
            
        </div>
    </section>
    
        
    

    
    
    
    
 
    

    
</body>
<%@ include file="../../layout/footer.jsp"%>
</html>