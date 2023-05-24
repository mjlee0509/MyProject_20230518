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
    <a href="/board/list">게시판 둘러보기</a>
    <a href="/board/list">지구</a>
    <a href="/board/list">수성</a>
    <a href="/board/list">금성</a>
    <a href="/board/list">화성</a>

</div>
<%@include file="../components/footer.jsp"%>
</body>
</html>
