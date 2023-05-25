<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MJ UNIVERSE</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="../components/boardHeader.jsp"%>
<div class="main">
    <div id="board-category-card" class="row">
        <div class="col-2">
            <a href="/board/list"><img src="../../../resources/imageFiles/eearth.jpg"></a>
            <h4>게시판 둘러보기</h4>
        </div>
        <div class="col-2">
            <a href=""><img src="../../../resources/imageFiles/eearth.jpg"></a>
            <h4>지구</h4>
            <p>[자유게시판] 일상의 잡다한 이야기들</p>
        </div>
        <div class="col-2">
            <a href=""><img src="../../../resources/imageFiles/mercury.png"></a>
            <h4>수성</h4>
            <p>[지식공유방] 빛나라 지식의 별</p>
        </div>
        <div class="col-2">
            <a href=""><img src="../../../resources/imageFiles/venus.png"></a>
            <h4>금성</h4>
            <p>[감성] 음악 추천 받아요, 새벽감성, 연애상담</p>
        </div>
        <div class="col-2">
            <a><img src="../../../resources/imageFiles/mars.png"></a>
            <h4>화성</h4>
            <p>[판도라의 상자] 오늘따라 욕이 마렵다</p>
        </div>
        <div class="col-2">
            <a href=""><img src="../../../resources/imageFiles/jupiter.png"></a>
            <h4>목성</h4>
            <p>[자기개발] 돈자랑, 차자랑, 몸자랑, 여행일기 등</p>
        </div>
        <div class="col-2">
            <a href=""><img src="../../../resources/imageFiles/saturn.png"></a>
            <h4>토성</h4>
            <p>[To Do List] 앞으로의 계획들</p>
        </div>


    </div>

<%--    <a href="/board/list">게시판 둘러보기</a>--%>
<%--    <a href="/board/list">지구</a>--%>
<%--    <a href="/board/list">수성</a>--%>
<%--    <a href="/board/list">금성</a>--%>
<%--    <a href="/board/list">화성</a>--%>

</div>
<%@include file="../components/footer.jsp"%>
</body>
</html>
