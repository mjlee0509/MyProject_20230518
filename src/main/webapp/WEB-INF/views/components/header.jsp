<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
    <a href="/">MJ Universe</a>
    <div class="right">
        <input type="button" class="btn btn-dark" onclick="sign_up()" value="회원가입">
        <input type="button" class="btn" style="background-color: #7300ff; color: white" onclick="login()"
               value="로그인">
    </div>


    <%--            <a href="/">${sessionScope.loginEmail}'s Universe</a>--%>
    <%--            <div class="right">--%>
    <%--                <a href="/member/detail"> ABOUT ME </a>--%>
    <%--                <a href="/"> <i class="bi bi-search"></i> </a>--%>
    <%--                <input type="button" class="btn btn-dark" onclick="write()" value="글쓰기">--%>
    <%--                <input type="button" class="btn" style="background-color: #7300ff; color: white" onclick="logout()"--%>
    <%--                       value="로그아웃">--%>
    <%--            </div>--%>

</div>
<script>
    const sign_up = () => {
        location.href = "/member/save"
    }
    const login = () => {
        location.href = "/member/login"
    }
</script>
