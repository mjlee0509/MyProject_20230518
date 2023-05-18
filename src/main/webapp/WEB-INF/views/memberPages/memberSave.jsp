<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/form.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="../components/header.jsp" %>
<div class="main">
    <h2>회원가입</h2>
    <form action="/member/save" method="post" enctype="multipart/form-data" id="save-form">
        <div class="img-area">
            <img id="profile-img-box" src="#" alt="" width="200" height="200"
                 style="border: 2px dashed black; border-radius: 50%"><br>
            <input type="file" name="profileFile" class="btn-light"
                   accept=".*" onchange="preview()" id="profile-img">
        </div>
        <div class="input-area">
            <input type="text" name="memberName" id="member-name" placeholder="이름을 입력하세요"> <br>

            <input type="text" name="memberEmail" id="member-email" placeholder="사용하실 아이디를 입력하세요"> <br>

            <input type="text" name="memberPassword" id="member-password" placeholder="비밀번호를 입력하세요"> <br>

            <input type="text" name="memberPassConfirm" id="member-pass-confirm" placeholder="비밀번호를 다시 입력하세요"> <br>

            <select>
                <option value="SKT">SKT</option>
                <option value="kt">kt</option>
                <option value="LGU">LGU</option>
            </select>
            <input type="text" name="memberMobile" id="member-mobile" placeholder="전화번호를 입력하세요(010-0000-0000)"> <br>
        </div>
        <div class="button-area">
            <input type="submit" value="가입하기" class="btn btn-dark">
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
</script>
</html>
