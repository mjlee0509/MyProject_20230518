<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-22
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>정보수정</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/form.css">
    <link rel="stylesheet" href="/resources/css/myPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../components/header.jsp" %>
<div class="main-50">
    <form action="/member/update" method="post" enctype="multipart/form-data" name="updateForm">
        <table class="profile-table">
            <tr>
                <td>
                    <img src="${pageContext.request.contextPath}/upload/${memberProfile.storedFileName}"
                         alt="" width="128" height="128" style="border: none; border-radius: 50%;" id="profile-img-box">
                </td>
                <td>
                    <h3>${member.memberEmail}</h3>
                    <h6>${member.memberName} 유니버스에 오신 것을 환영합니다.</h6>
                </td>
            </tr>
            <tr>
                <td><input type="file" name="profileFile" id="profile-img" value="프로필사진 수정" onclick="delete_img()" onchange="preview()"></td>
            </tr>
        </table>

        <table class="info-table">
            <tr hidden="hidden">
                <td><h3>ID</h3></td>
            </tr>
            <tr>
                <td><input type="text" name="id" id="member-id" value="${member.id}" readonly hidden="hidden"></td>
            </tr>

            <tr>
                <td><h3>UNIVERSE NAME</h3></td>
            </tr>
            <tr>
                <td><input type="text" name="memberEmail" id="member-email" value="${member.memberEmail}"></td>
            </tr>


            <tr>
                <td><h3>NAME</h3></td>
            </tr>
            <tr>
                <td><input type="text" name="memberName" id="member-name" value="${member.memberName}"></td>
            </tr>

            <tr>
                <td><h3>MOBILE</h3></td>
            </tr>
            <tr>
                <td>
                    <select>
                        <option value="SKT">SKT</option>
                        <option value="kt">kt</option>
                        <option value="LGU">LGU</option>
                    </select>
                    <input type="text" name="memberMobile" id="member-mobile" value="${member.memberMobile}">
                </td>
            </tr>

            <tr>
                <td><h3>DESCRIPTION</h3></td>
            </tr>
            <tr>
                <td><textarea name="memberDescription" id="member-description" value="${member.memberDescription}"
                              cols="30"
                              rows="10">${member.memberDescription}</textarea></td>
            </tr>
        </table>

        <table class="pw-table">
            <tr>
                <td><h3>PASSWORD</h3></td>
            </tr>
            <tr>
                <td><input type="text" name="memberPassword" id="member-password" placeholder="회원정보 수정 및 탈퇴를 위해 비밀번호를 입력하세요"></td>
            </tr>
        </table>

        <div class="button-area">
           <input type="button" value="수정완료" onclick="update_request()" class="btn btn-dark">
           <input type="button" value="회원할퇴" onclick="delete_request()" class="btn btn-danger">
        </div>
    </form>
</div>
<%@include file="../components/footer.jsp" %>
</body>
<script>
    const delete_img = () => {
        document.getElementById("profile-img-box").src = null;
    }

    const preview = () => {
        const preview = new FileReader();
        preview.onload = function (e) {
            document.getElementById("profile-img-box").src = e.target.result;
        }
        preview.readAsDataURL(document.getElementById("profile-img").files[0])
    };

    const update_request = () => {
        const inputPass = document.getElementById("member-password").value;
        const dbPass = '${member.memberPassword}';
        if (inputPass == dbPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다")
        }
    }

    const delete_request = () => {
        const inputPass = document.getElementById("member-password").value;
        const dbPass = '${member.memberPassword}';
        if (inputPass == dbPass) {
            alert("회원탈퇴 완료")
            location.href = "/member/delete?id=${member.id}";
        } else {
            alert("비밀번호가 일치하지 않습니다")
        }

    }
</script>
</html>
