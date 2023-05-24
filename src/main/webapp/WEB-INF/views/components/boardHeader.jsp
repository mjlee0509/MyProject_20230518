<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <a href="/">${sessionScope.loginEmail}'s Universe</a>
    <div class="right">
        <a href="/member/detail"> ABOUT ME </a>
        <a href="/"> <i class="bi bi-search"></i> </a>
        <input type="button" class="btn btn-dark" onclick="go_write()" value="글쓰기">
        <input type="button" class="btn" style="background-color: #7300ff; color: white" onclick="logout()"
               value="로그아웃">
    </div>
</div>
<script>
    const logout = () => {
        location.href = "/member/logout"
    }

    const go_write = () => {
        location.href = "/board/save"
    }
</script>

