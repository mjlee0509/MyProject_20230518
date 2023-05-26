<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-26
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>MJ UNIVERSE</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/myPage.css">
    <link rel="stylesheet" href="/resources/css/search.css">
    <link rel="stylesheet" href="/resources/css/boardCard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="../components/boardHeader.jsp"%>
<div class="main-50">
    <div class="board-thumbnail">
        <img src="${pageContext.request.contextPath}/upload/${boardThumbnail.storedFileName}"
             alt="" width="100%" height="56%" style="border: none;">
    </div>
    <div class="board-title">
        <h1 id="board-title" name="boardTitle">${board.boardTitle}</h1>
    </div>
    <div class="board-date-writer">
        <span><i class="bi bi-calendar3"></i></span>
        <span id="board-created-date" name="boardCreatedDate">${board.boardCreatedDate}</span>
        <span> | </span>
        <span><i class="bi bi-person"></i></span>
        <span id="board-writer" name="boardWriter">${board.boardWriter}</span>
    </div>
    <c:if test="${board.fileAttached==1}">
        <c:forEach items="${boardFileList}" var="boardFile">
            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFilesName}" alt="" width="100%"
                 height="56%">
        </c:forEach>
    </c:if> <br>
    <div class="board-contents">
        ${board.boardContents}
    </div>
    <div class="board-hits-like-comment">

    </div>

</div>

</body>
</html>
