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
    <title>마이페이지</title>
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
    <table class="profile-table">
        <tr>
            <td>
                <a href="/member/detail?id='${member.id}">
                    <img src="${pageContext.request.contextPath}/upload/${memberProfile.storedFileName}"
                         alt="" width="128" height="128" style="border: none; border-radius: 50%;">
                </a>
            </td>
            <td>
                <h3>${member.memberEmail}</h3>
                <h6>${member.memberName} 님의 우주</h6>
            </td>
        </tr>
    </table>

    <table class="info-table">
        <tr>
            <td><h3>NAME</h3></td>
        </tr>
        <tr>
            <td><h6>${member.memberName}</h6></td>
        </tr>

        <tr>
            <td><h3>MOBILE</h3></td>
        </tr>
        <tr>
            <td><h6>${member.memberMobile}</h6></td>
        </tr>

        <tr>
            <td><h3>DESCRIPTION</h3></td>
        </tr>
        <tr>
            <td><h6>${member.memberDescription}</h6></td>
        </tr>
    </table>

    <div class="button-area">
        <input type="button" class="btn" style="width: 100%; background-color: black; color: white" value="정보수정"
               onclick="update()">
    </div>

</div>
<%@include file="../components/footer.jsp" %>
</body>
<script>
    const update = () => {
        location.href = "/member/update?id=${member.id}";
    }
</script>
</html>
