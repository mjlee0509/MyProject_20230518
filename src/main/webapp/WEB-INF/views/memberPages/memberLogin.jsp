<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-22
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/form.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../components/header.jsp" %>
<div class="main">
    <h2>로그인</h2>
    <form action="/member/login" method="post" onsubmit="login_is_valid()" id="form-area" name="loginForm">
        <input type="text" name="memberEmail" id="member-email" placeholder="아이디">
        <p id="login-email-check"></p>

        <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호">
        <p id="login-pass-check"></p>

        <div class="button-area">
            <input type="submit" class="btn btn-dark" value="로그인" id="login-btn">
        </div>
    </form>


</div>
</div>
<%@include file="../components/footer.jsp" %>
</body>
<script>
    $.ajax({
        type: "post",
        url: "/member/login-check",
        date: {
            "memberEmail": email,
            "memberPassword": password
        }
    })



    function login_is_valid() {
        const email = document.getElementById("member-email");
        const DBemail = ${member.memberEmail};
        const emailCheck = document.getElementById("login-email-check");

        const password = document.getElementById("member-password");
        const DBpassword = ${member.memberPassword};
        const passCheck = document.getElementById("login-pass-check");


        if (email.value != DBemail) {
            emailCheck.innerHTML = "존재하지 않는 아이디입니다";
            emailCheck.style.color = "red";
            email.focus();
            return false;
        }

        if (password.value != DBpassword) {
            passCheck.innerHTML = "비밀번호가 일치하지 않습니다";
            passCheck.style.color = "red";
            password.focus();
            return false;
        }
    }
</script>
</html>
