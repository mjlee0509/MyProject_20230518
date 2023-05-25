<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오전 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글쓰기</title>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/form.css">
    <link rel="stylesheet" href="/resources/css/myPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/bootstrap.min.css">
    <script src="/resources/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>


</head>
<body>
<div class="main-50">
    <form action="/board/save" method="post" enctype="multipart/form-data" id="board-area">
        <input type="hidden" name="boardWriter" id="board-writer" value="${sessionScope.loginEmail}">
        <select name="boardCategory" id="board-category">
            <option value="">선택하세요</option>
            <option value="지구">[지구]</option>
            <option value="수성">[수성]</option>
            <option value="금성">[금성]</option>
            <option value="화성">[화성]</option>
            <option value="목성">[목성]</option>
            <option value="토성">[토성]</option>
        </select>

        <input type="text" name="boardTitle" id="board-title" style="font-size: 24px;"
               placeholder="제목을 입력하세요">

        <div id="thumbnail-area">
            <img id="thumbnail-file-box" src="#" alt=""
                 style="border: 1px dashed #c2c1c1; border-radius: 5px; width: 95%; height: 350px" multiple type="file"><br>
            <input type="file" name="thumbnailFile" class="btn-light" accept=".*" onchange="thumbnails()" id="thumbnail-file-save"
            style="border: none">
        </div>

        <textarea name="boardContents" id="board-contents" cols="300" rows="50" placeholder="내용을 입력하세요"></textarea>

        <div id="file-area">
            <img id="board-file-box" src="#" alt="" width="100" height="100"
                 style="border: 1px dashed #c2c1c1; border-radius: 5px" multiple type="file"><br>
            <input type="file" name="boardFile" class="btn-light" accept=".*" onchange="previews()" id="board-file-save"
                   multiple>
        </div>

        <input type="submit" value="포스팅" class="btn btn-dark"
               style="width: 100%; margin-top: 30px; margin-bottom: 30px">
</div>


</form>
</body>
<script>
    const thumbnails = () => {
        const preview = new FileReader();
        preview.onload = function (e) {
            document.getElementById("thumbnail-file-box").src = e.target.result;
        }
        preview.readAsDataURL(document.getElementById("thumbnail-file-save").files[0])
    };

    const previews = () => {
        const preview = new FileReader();
        preview.onload = function (e) {
            document.getElementById("board-file-box").src = e.target.result;
        }
        preview.readAsDataURL(document.getElementById("board-file-save").files[0])
    };

    CKEDITOR.replace('editor1', {
        height: '350px'
    });

</script>
</html>
