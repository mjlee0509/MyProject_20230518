<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오후 4:11
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
<%@include file="../components/boardHeader.jsp" %>
<div class="main-50">
    <%--    <div id="search-area">--%>
    <%--        <form action="/board/list" method="get">--%>
    <%--            <select name="type">--%>
    <%--                <option value="boardTitle">제목</option>--%>
    <%--                <option value="boardWriter">작성자</option>--%>
    <%--                <option value="boardContents">내용</option>--%>
    <%--            </select>--%>
    <%--            <input type="text" name="q" placeholder="검색어">--%>
    <%--            <input type="submit" value="검색">--%>
    <%--        </form>--%>
    <%--    </div>--%>
    <div id="board-card">
        <div class="row">
            <c:forEach items="${boardList}" var="board">
                <a href="/board?id=${board.id}&page=${paging.page}&q=${q}&type=${type}">
                <div class="col-12">
                        <div class="card-thumbnail">
                            <img src="${pageContext.request.contextPath}/upload/${boardThumbnail.storedFileName}"
                                    alt="" style="border: none; margin-top: 30px" width="border-box" height="border-box">
                        </div>
                        <div class="card-contents">
                            <div class="card-title">
                                <h4>${board.boardTitle}</h4>
                            </div>
                            <div class="card-date-writer">
                                <span><i class="bi bi-calendar3"></i></span>
                                <span><fmt:formatDate value="${board.boardCreatedDate}"
                                                      pattern="yyyy년 MM월 dd일 HH:MM"></fmt:formatDate></span>
                                <span>  |  </span>
                                <span><i class="bi bi-person"></i></span>
                                <span>${board.boardWriter}</span>
                                <br>
                            </div>
                            <div class="card-contents">
                                <p>${board.boardContents}</p>
                            </div>
                            <div class="card-hits-like-comment">
                                <span><i class="bi bi-eye"></i></span>
                                <span>${board.boardHits}</span>
                                <span>  |  </span>
                                <span><i class="bi bi-heart"></i></span>
                                <span> 0 </span>
                                <span>  |  </span>
                                <span><i class="bi bi-chat-left-dots"></i></span>
                                <span> 0 </span>
                                <span></span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <%-- 페이지 버튼 --%>
    <div class="container">
        <ul class="pagination">
            <%--1. [이전] 버튼 --%>
            <c:choose>
                <%--1-1. 현재 페이지가 1일 경우 [이전] 리스트는 글자만 보여준다--%>
                <c:when test="${paging.page<=1}">
                    <%--                    <li class="page-item disabled">--%>
                    <%--                        <a class="page-link"><i class="bi bi-arrow-left-circle-fill"></i></a>--%>
                    <%--                    </li>--%>
                </c:when>

                <%--1-2. 그렇지 않은 경우 현재 페이지보다 1 전의 페이지 요청--%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page-1}&q=${q}&type=${type}"><i
                                class="bi bi-arrow-left-circle-fill"></i></a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%-- 2. [1 2 3 4 5 ... ]; 반복문 처리 필요 --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <%-- 2-1. 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보임 --%>
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item-active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <%-- 2-2. 아니면 링크 처리--%>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/list?page=${i}&q=${q}&type=${type}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <%-- 3. [다음] 버튼 --%>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <%--                    <li class="page-item disabled">--%>
                    <%--                        <a class="page-link"><i class="bi bi-arrow-right-circle-fill"></i></a>--%>
                    <%--                    </li>--%>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${paging.page+1}&q=${q}&type=${type}"><i
                                class="bi bi-arrow-right-circle-fill"></i></a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

</body>
</html>
