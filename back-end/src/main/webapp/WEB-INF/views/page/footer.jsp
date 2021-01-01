<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root2 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=" shortcut icon" href="<%=root2%>/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<%=root2%>/img/favicon.ico" type="image/x-icon" />
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>
<title>Happy House</title>

<style>

footer {
  padding-top: 30px;
  background-color: #f3a683;
  color: #ffffff;
  font-weight: bold;
}

footer a {
  color: #ffffff;
  font-size: 15px;
}

.sitemap {
  display: flex;
  flex-direction: row;
}

.copyright {
  padding: 30px 0;
  font-weight: 600;
  font-size: 18px;
}

</style>
</head>
<body>

<footer>
	  <div class="sitemap">
        <!-- logo -->
        <div class="footer-logo col-xl-6 col-lg-4 row justify-content-center">
          <a href="<%=root2%>/"
            ><img src="<%=root2%>/img/logo.png" alt="logo" width="210"
          /></a>
        </div>
        
        <!-- sitemap -->
        <div class="col-xl-2 col-lg-4 col justify-content-center">
          <h4>Happy House</h4>
          <ul>
            <li><a href="<%=root2%>/processAbout">소개</a></li>
            <li><a href="<%=root2%>/processNotice">공지사항</a></li>
          </ul>
        </div>
        <div class="col-xl-4 col-lg-4 col justify-content-center">
          <h4>검색</h4>
          <ul>
            <li><a href="<%=root2%>/processHouse">아파트별 실거래가 검색</a></li>
            <li><a href="<%=root2%>/processHouse">동별 실거래가 검색</a></li>
            <li><a href="<%=root2%>/processHouse">동네업종 정보 검색</a></li>
            <li><a href="<%=root2%>/processHouse">대기오염 정보 검색</a></li>
          </ul>
        </div>
	  </div>
	  
      <div class="copyright text-center">
        <p>
          Copyright &copy;
          <script>
            document.write(new Date().getFullYear());
          </script>
          All rights reserved | This template is made with KimJungWoong, HanJiYoon
        </p>
      </div>
    </footer>
    
</body>
</html>