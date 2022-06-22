<%@page import="cs.dit.dto.japfood_ContentDto"%>
<%@page import="cs.dit.dao.japfood_ContentDao"%>
<%@page import="cs.dit.dto.ContentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cs.dit.dao.ContentDao"%>
<%/*====================================================
파일명 :
변경이력 :
프로그램 내용 : 
========================================================*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<% 
	japfood_ContentDao dao = new japfood_ContentDao();
	ArrayList<japfood_ContentDto> dtos = dao.japfood_list();
	pageContext.setAttribute("dtos", dtos);
%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css_1/reset.css">
    <link rel="stylesheet" href="./css_1/index.css">
    <link href="css_1/style.css" rel="stylesheet" />
    <script src="js/jquery-3.6.0.min.js"></script>

    <!--=============== Font Awesome 5 ===============-->

    <script src="https://kit.fontawesome.com/b335c44d43.js" crossorigin="anonymous"></script>

    <!--=============== flickity 라이브라리 ===============-->
    <script src="./js/flickity.pkgd.js"></script>
    <link rel="stylesheet" href="./css/flickity.css">
</head>

<body>
    <!--=============== header ===============-->
    <header>
        <div class="container header-wrapper">
            <div class="header-left-title">
                <h1>recipes</h1>
            </div>
            <div class="searchArea" id="makeImg">
                <form id="form4" action="#" method="post">
                    <input type="text" id="inText" class="searchText" />
                    <button class="searchButton" id="sbtn4" type="submit"><i class="fas fa-search searchImg"></i></button>
                    </form>
            </div>
            <div class="header-right-item">
                <ul class="header-list-item">
                    <li class="about"><a href="notice.html">공지사항</a></li>
                    <li class="login"><a href="login.html"><i class="fa-solid fa-arrow-right-to-bracket icon"></i></a></li>
                    <li class="my-page">
                        <a href="mypage.html" class="drawer">
                            <i class="fa-regular fa-user icon"></i></a>

                </ul>
            </div>
        </div>
    </header>

    <!--=============== 선택 ===============-->
    <section class="top">
        <div class="container">
            <ul class="top-list-item">
                <li><a onclick="location.href='korfood_List.jsp'" >한식</a></li>
                <li><a onclick="location.href='japfood_List.jsp'" >일식</a></li>
                <li><a onclick="location.href='chifood_List.jsp'" >중식</a></li>
                <li><a onclick="location.href='westfood_List.jsp'" >양식</a></li>
            </ul>
        </div>
    </section>

    <!--=============== 본문내용 ===============-->
    <section class="main">
        <div class="container">
            <div class="row">
                <table class="table table-striped" style="text-align: center; margin-left: 12%; border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th style="padding-left: 50px; padding-right: 50px; background-color: #95f62c;">번호</th>
                            <th style="padding-left: 160px; padding-right: 160px; background-color: #95f62c;">제목</th>
                            <th style="padding-left: 80px; padding-right: 80px; background-color: #95f62c;">작성자</th>
                            <th style="padding-left: 80px; padding-right: 80px; background-color: #95f62c;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <c:forEach var='dto' items='${dtos}'>
                            <td style="background-color: white;">1</td>
                            <td style="background-color: white;">${dto.CONTENTNAME}</td>
                            <td style="background-color: white;">홍길동</td> <!-- 세션에서 ID들고와서 세팅 -->
                            <td style="background-color: white;">2017-05-04</td>
                        </tr>
                        	</c:forEach>
                    </tbody>
                </table>
                <center>
                <button onclick="location.href='makeContent_jap.do'" class="btn btn-primary pull-right" style="border: 1px solid;" margin-left="80%">글쓰기</button>
                </center>
            </div>
        </div>
    </section>

    <!--=============== footer ===============-->
    <footer>
        <p>Since 2022 </p>
        <a href="produce.html">회사소개</a>
    </footer>

    <script type="text/javascript" src="./slick/slick.min.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
</body>
</html>
<style>
* {
  max-width: 2870px;
  color: #082B48;
  line-height: 1.5;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

* img {
  width: 50%;
  height: auto;
}

* a {
  text-decoration: none;
  color: #082B48;
  cursor: pointer;
}

* a:hover {
  opacity: 0.7;
}

* ul {
  list-style: none;
}

/*================== container  ==================*/
.container {
  max-width: 1960px;
  width: 85%;
  height: 100%;
  margin: auto;
  padding-bottom: 70px;
}

/*================== header  ==================*/
header {
  height: 150px;
  /* --- 텍스트 입력란 --- */
  /* --- 버튼 --- */
  /* --- 아이콘 --- */
}

header .child {
  display: none;
}

header .header-wrapper {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  padding: 30px 0 30px 0;
}

header .searchArea {
  padding-top: 10px;
  width: auto;
  height: 50px;
  margin: auto;
  letter-spacing: 0.1em;
  font-weight: bold;
  line-height: 0;
}

header .searchArea .searchText {
  display: block;
  float: left;
  box-sizing: border-box;
  height: 50px;
  width: 400px;
  margin: 0;
  padding: 0 12px;
  border: 2px solid #d6d6d6;
  border-radius: 50px 0 0 50px;
  color: #bebebe;
  outline: 0;
  font-size: 12px;
}

header .searchArea .searchButton {
  float: left;
  box-sizing: border-box;
  height: 50px;
  margin: 0;
  padding: 6px 10px;
  border: none;
  border-radius: 0 50px 50px 0;
  background: #d6d6d6;
  color: #fff;
  cursor: pointer;
  line-height: 12px;
  font-size: 12px;
}

header .searchArea .searchImg {
  display: inline-block;
  width: auto;
  height: 12px;
  margin: 0 3px 0 0;
  vertical-align: middle;
}

header .searchArea .searchText::-ms-clear {
  display: none;
}

header .header-list-item {
  padding-top: 20px;
  display: flex;
  justify-content: space-around;
}

header .header-list-item .icon {
  font-size: 20px;
  color: #7bce23;
  display: inline-block;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: #e5e5e5;
  text-align: center;
  line-height: 50px;
}

header .header-list-item li {
  margin-right: 25px;
}

header h1 {
  font-weight: bold;
  font-size: 60px;
}

.top {
  background: linear-gradient(to left, #95f62c, #7bce23);
  height: 70px;
}

.top .top-list-item {
  text-align: center;
  padding-top: 18px;
  font-weight: bold;
  font-size: 20px;
  display: flex;
  justify-content: space-around;
}

.main {
  background-color: #e5e5e5;
  padding-top: 10px;
  padding-bottom: 10px;
  height:auto;
}

.main .main-item {
  display: flex;
  justify-content: space-around;
}

.main h2 {
  font-size: 20px;
}

.main .slide {
  padding-top: 30px;
}

.main .main-item-left {
  border-radius: 20px;
  background-color: white;
  width: 75%;
  margin-right: 30px;
  padding: 30px;
}

.main .main-item-left img {
  padding: 10px;
}

.main .main-item-right {
  border-radius: 20px;
  background-color: white;
  width: 25%;
  padding: 30px;
}

.main .main-item-right .rank-list {
  padding: 10px 0 10px 0;
}

.main .main-item-right .rank-list .rank-list-li {
  padding: 10px;
}

.main .main-item-right .rank-list .rank-list-li img {
  width: 60px;
  height: 60px;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text {
  height: 60px;
  display: flex;
  justify-content: space-around;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text p {
  line-height: 60px;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text .rank1 {
  color: gold;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text .rank2 {
  color: silver;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text .rank3 {
  color: brown;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text img {
  border-radius: 10px;
}

.main .main-item-right .rank-list .rank-list-li .rank-image-and-text .recipe-name {
  width: 50%;
}

footer {
  text-align: center;
  height: 40px;
}

footer p {
  text-align: center;
  color: #acacac;
  font-size: 15px;
  line-height: 40px;
}
/*================================================================
메인css
================================================================*/
/* .main .middle-list-item {
  text-align: center;
  padding-top: 18px;
  font-weight: bold;
  font-size: 20px;
  display: flex;
  justify-content: space-around;
} */
.main .real-upload{
  display: none;
}
.main .upload{
  width: 100px;
  height: 100px;
}
.main .recipe-textarea{
  margin-left: 30%;
  margin-right: 30%;
  background-color: #fff;
}
.table_1{
  padding-top: 10px;
  align-items : center;
  width: 700px;
  margin-left: 25%;
  margin-right: 25%;
}
</style>