<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="footer">

</div>
<script>
    // footer 저작권 문구(연도) 자동완성
    const date = new Date();
    console.log(date.getFullYear());

    const footer = document.getElementById("footer");
    footer.innerHTML = "<p>&copy; " + date.getFullYear() + "&nbsp; MJ UNIVERSE All rights reserved. Human Resources Development Service of Korea</p>"
</script>
