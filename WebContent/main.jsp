<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  
<title>MY BLOG</title>
</head>
<body>
	<jsp:include page="./navbar.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h2>cafe24</h2>
				<p><a class="label label-default" href="board.jsp" role="button">글 쓰러 가기!</a></p>
			</div>
		</div>
	</div>
	<main id="main">

    <section class="breadcrumbs">
      <div class="container">


      </div>
    </section>

    <section class="portfolio-details">
      <div class="container">

        <div class="portfolio-details-container">

          <div class="owl-carousel portfolio-details-carousel">
            <img src="assets/img/portfolio/portfolio-details-1.jpg" class="img-fluid" alt="">
            <img src="assets/img/portfolio/portfolio-details-2.jpg" class="img-fluid" alt="">
            <img src="assets/img/portfolio/portfolio-details-3.jpg" class="img-fluid" alt="">
          </div>

          <div class="portfolio-info">
            <h3>Project information</h3>
            <ul>
              <li><strong>Category</strong>: WEB</li>
              <li><strong>Project date</strong>: 2020 - 2</li>
            </ul>
          </div>
        </div>

        <div class="portfolio-description">
          <h2>TITLE</h2>
          <p>
            TEST
          </p>
        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>

  <script src="assets/js/main.js"></script>
</body>
</html>