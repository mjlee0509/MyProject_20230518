<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <a href="/board/">${sessionScope.loginEmail}'s Universe</a>
    <div class="right">
        <a href="/member/detail"> ABOUT ME </a>
        <button class="btn" id="search-btn" onclick="open_search()"> <i class="bi bi-search"></i> </button>
        <input type="button" class="btn btn-dark" onclick="go_write()" value="글쓰기">
        <input type="button" class="btn" style="background-color: #7300ff; color: white" onclick="logout()"
               value="로그아웃">
    </div>
    <div id="search-area">
        <span class="close-btn" onclick="close_search()"><i class="bi bi-x-lg"></i></span>
        <div id="search-contents" on>
        <form action="/board/list" method="get">
            <select name="type">
                <option value="boardTitle">제목</option>
                <option value="boardWriter">작성자</option>
                <option value="boardContents">내용</option>
            </select>
            <input type="text" name="q" placeholder="검색어">
            <button type="submit"><i class="bi bi-search"></i></button>
        </form>
        </div>
    </div>

</div>
<script>
    const logout = () => {
        location.href = "/member/logout"
    }

    const go_write = () => {
        location.href = "/board/save"
    }

    function open_search() {
        document.getElementById("search-area").style.display = "block"
    }

    function close_search() {
        document.getElementById("search-area").style.display = "none"
    }

</script>

