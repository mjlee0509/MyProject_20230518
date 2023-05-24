<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>회원가입</title>
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
    <h2>회원가입</h2>
    <form action="/member/save" method="post" enctype="multipart/form-data" id="form-area" name="saveForm"
    onsubmit="return save_is_valid()">
        <div class="img-area">
            <img id="profile-img-box" src="#" alt="" width="200" height="200"
                 style="border: 2px dashed black; border-radius: 50%"><br>
            <input type="file" name="profileFile" class="btn-light"
                   accept=".*" onchange="preview()" id="profile-img">
        </div>
        <div class="input-area">
            <input type="text" name="memberName" id="member-name" placeholder="이름을 입력하세요"> <br>

            <input type="text" name="memberEmail" id="member-email" placeholder="사용하실 아이디를 입력하세요" onblur="email_check()"> <br>
            <p id="email-check-result"></p>

            <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호를 입력하세요"> <br>
            <p id="password-check-result"></p>

            <input type="text" name="memberPassConfirm" id="member-pass-confirm" placeholder="비밀번호를 다시 입력하세요"> <br>
            <p id="password-confirm-result"></p>

            <select id="mobile-select">
                <option value="SKT">SKT</option>
                <option value="kt">kt</option>
                <option value="LGU">LGU</option>
            </select>
            <input type="text" name="memberMobile" id="member-mobile" placeholder="전화번호를 입력하세요(010-0000-0000)"> <br>
            <p id="mobile-check-result"></p>
            <textarea name="memberDescription" id="member-description" placeholder="나를 표현해보세요!" cols="30" rows="10"></textarea>
            <br>
        </div>
        <div class="button-area">
            <input type="submit" value="가입하기" class="btn btn-dark" id="join-btn">
            <input type="button" onclick="home()" value="홈으로" class="btn"
                   style="background-color: #6610f2; color: white">
        </div>
    </form>
</div>
</div>

</form>
</div>
<%@include file="../components/footer.jsp" %>
</body>
<script>
    const preview = () => {
        const preview = new FileReader();
        preview.onload = function (e) {
            document.getElementById("profile-img-box").src = e.target.result;
        }
        preview.readAsDataURL(document.getElementById("profile-img").files[0])
    };

    const home = () => {
        location.href = "/"
    }

    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-check-result");
        $.ajax({
            type: "post",
            url: "/member/email-check",
            data: {
                "memberEmail": email
            },
            success: function () {
                // result.innerHTML = "사용 가능한 아이디입니다";
                // result.style.color = "green";
            },
            error: function (err) {
                if (err.status == "409") {
                    result.innerHTML = "이미 사용중인 아이디입니다";
                    result.style.color = "red";
                    email.focus()
                } else if (err.status == "404") {
                    result.innerHTML = "사용하실 아이디를 입력해주세요";
                    result.style.color = "red";
                    email.focus()
                }
            }
        })
    };

    function save_is_valid() {
        const email = document.getElementById("member-email");
        const emailCheck = document.getElementById("email-check-result");

        const password = document.getElementById("member-password");
        const passCheck = document.getElementById("password-check-result");

        const passConfirm = document.getElementById("member-pass-confirm");
        const passConfirmCheck = document.getElementById("password-confirm-result");

        const mobile = document.getElementById("member-mobile");
        const mobileCheck = document.getElementById("mobile-check-result");

        const emailForm = /^[A-Za-z\d-_.]{5,20}$/
        const passForm =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-_!#])[A-Za-z\d!#$-_]{6,18}$/
        const mobileForm = /^\d{3}-\d{4}-\d{4}$/

        if (!email.value.match(emailForm)) {
            emailCheck.innerHTML = "5~20자 이내로 입력하세요";
            emailCheck.style.color = "red";
            email.focus();
            return false;
        }

        if (!password.value.match(passForm)) {
            passCheck.innerHTML = "영문(대+소문자), 특수문자 포함 6~18자 이내로 입력하세요";
            passCheck.style.color = "red";
            password.focus();
            return false;
        }

        if (password.value != passConfirm.value) {
            passConfirmCheck.innerHTML = "입력하신 비밀번호와 일치하지 않습니다";
            passConfirmCheck.style.color = "red";
            passConfirm.focus();
            return false;
        }

        if (!mobile.value.match(mobileForm)) {
            mobileCheck.innerHTML = "전화번호를 올바르게 입력하세요(###-####-####)";
            mobileCheck.style.color = "red";
            mobile.focus();
            return false;
        }




    }




</script>
</html>
