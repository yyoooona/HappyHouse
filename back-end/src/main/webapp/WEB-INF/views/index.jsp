<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=" shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="img/favicon.ico" type="image/x-icon" />
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
<!-- Place css -->
<link rel="stylesheet" href="css/main.css" />
<title>Happy House</title>
</head>
<body>
<%@ include file="./page/header.jsp" %>

<!-- main img section -->
    <section class="mainImg">
      <div class="container">
        <h1 class="mainTitle">당신의<br />집을 찾아보세요!</h1>
        <div class="mainBtns">
          <button type="button" class="btn btn-info">매물 보러가기</button>
          <button type="button" class="btn btn-info">관심 지역 보기</button>
        </div>
      </div>
    </section>

    <!-- ======= 최근 인기 상위 매물 BEST 3 ======= -->
    <section class="popularThree">
      <div class="container">
        <div class="popularTitle">
          <h2>추천</h2>
          <h5>
            최근 인기 상위 매물 <span class="badge badge-warning">BEST 3</span>
          </h5>
        </div>

        <div class="row popularItems">
          <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <img class="popularThreeImg" src="img/효성쥬얼리시티.jfif" />

            <div class="d-flex justify-content-end">
              <button type="button" class="btn btn-link">
                매물 자세히 보기
              </button>
            </div>
            <h4>$169</h4>
            <h2 class="aptName">효성쥬얼리시티</h2>

            <p>
              Et architecto provident deleniti facere repellat nobis iste. Id
              facere quia quae dolores dolorem tempore.
            </p>
          </div>

          <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <img class="popularThreeImg" src="img/CS타워.jfif" />

            <div class="d-flex justify-content-end">
              <button type="button" class="btn btn-link">
                매물 자세히 보기
              </button>
            </div>
            <h4>$169</h4>
            <h2 class="aptName">CS타워</h2>

            <p>
              Et architecto provident deleniti facere repellat nobis iste. Id
              facere quia quae dolores dolorem tempore.
            </p>
          </div>

          <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <img
              class="popularThreeImg"
              src="img/숭인동종로중흥S클래스.jfif"
            />

            <div class="d-flex justify-content-end">
              <button type="button" class="btn btn-link">
                매물 자세히 보기
              </button>
            </div>
            <h4>$169</h4>
            <h2 class="aptName">숭인동종로중흥S클래스</h2>

            <p>
              Et architecto provident deleniti facere repellat nobis iste. Id
              facere quia quae dolores dolorem tempore.
            </p>
          </div>
        </div>
      </div>

      <!-- End 매물 item -->
    </section>
    <!-- End  최근 인기 상위 매물 BEST 3 -->

    <!-- news section -->
    <hr />
    <section class="news">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 newsInfo">
            <h3 class="newsTitle">실시간 부동산 뉴스</h3>
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis
              aute irure dolor in reprehenderit Asperiores dolores sed et.
              Tenetur quia eos.
            </p>
            <div class="d-flex justify-content-end">
              <button type="button" class="btn btn-primary goNews">
                뉴스 페이지 이동
              </button>
            </div>
          </div>

          <div class="row col-lg-8 newsContents">
            <div>
              <img class="newsImg" src="img/news1.PNG" />
              <div class="newsDesc">
                <h4>공급과잉에 코로나19까지.. 줄줄이 매물로 나오는 대형호텔</h4>
                <p>
                  16일 부동산 업계에 따르면 서울 강남구 역삼동의 ‘르메르디앙
                  서울’은 소유주 전원산업이 삼성증권을 매각 주관사로 선정하고
                  매각 절차에 착수
                </p>
              </div>
            </div>
            <div>
              <img class="newsImg" src="img/news1.PNG" />
              <div class="newsDesc">
                <h4>공급과잉에 코로나19까지.. 줄줄이 매물로 나오는 대형호텔</h4>
                <p>
                  16일 부동산 업계에 따르면 서울 강남구 역삼동의 ‘르메르디앙
                  서울’은 소유주 전원산업이 삼성증권을 매각 주관사로 선정하고
                  매각 절차에 착수
                </p>
              </div>
            </div>
          </div>

          <!-- End .content-->
        </div>
      </div>
    </section>

<%@ include file="page/footer.jsp" %>
</body>
</html>