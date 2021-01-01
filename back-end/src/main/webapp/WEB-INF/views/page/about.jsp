<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=" shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="../img/favicon.ico" type="image/x-icon" />
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>Happy House</title>
</head>
<body>

<%@ include file="./header.jsp" %>

<section style="margin: 50px 0;">
      <div class="container about">
        <img class="aboutLogo" src="../img/logo.png" alt="logo" />
        <h2 class="aboutTitle">행복한 집을 꿈꿉니다</h2>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae assumenda tempore minus id. Veritatis omnis fugiat vel consectetur! Aut provident voluptatibus et doloribus consequuntur explicabo nulla ut molestias, quisquam eos.</p>
      </div>

      <div class="row justify-content-center">
        <div id="aboutCarousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#aboutCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#aboutCarousel" data-slide-to="1"></li>
            <li data-target="#aboutCarousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../img/house.png" class="d-block w-100" alt="img1">
            </div>
            <div class="carousel-item">
              <img src="../img/house.png" class="d-block w-100" alt="img2">
            </div>
            <div class="carousel-item">
              <img src="../img/house.png" class="d-block w-100" alt="img3">
            </div>
          </div>
          <a class="carousel-control-prev" href="#aboutCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#aboutCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </section>
    
<%@ include file="./footer.jsp" %>

</body>
</html>