<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chu</title>
<!-- meta tags -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<meta charset="utf-8">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<!-- bootstrap css -->
<jsp:include page="/WEB-INF/views/user/HomeLayout/css.jsp"></jsp:include>
<!-- bootstrap js -->
<jsp:include page="/WEB-INF/views/user/HomeLayout/js.jsp"></jsp:include>

</head>
<body>
	<div class="container-fluid"
		style="padding: 0; margin: 0 auto; width: 100%">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /header -->
		<!-- main -->
		<!-- content -->
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mt-4">
					<div class="col-lg-12">
						<span>Khách Hàng Cần Biết.
							________________________________________________</span>
					</div>
					<div class="col-lg-12">
						<h2>Để Có Một Văn Phòng Hoàn Hảo!</h2>
						<h3>Các bạn cần làm gì?</h3>
					</div>
					<div class="col-lg-12">
						<span>Khi công ty bạn có ý định làm mới nội thất hay chuyển
							đến một tòa nhà mới, đó cũng là lúc bạn phải tính toán đến việc
							hoàn thiện nội thất cho việc thiết kế nội thất văn phòng mới này.</span>
					</div>
					<div class="col-lg-12 mt-2 xemThem">
						<button>XEM THÊM</button>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12 right-about mt-5">
					<div class="row text-center">
						<div class="col-lg-4">
							<a href="#"><img src="${base}/user/images/logo/img2.png"
								alt=""><span>Thiết kế nội thất</span></a>
						</div>
						<div class="col-lg-4">
							<a href="#"><img src="${base}/user/images/logo/img3.png"
								alt=""><span>Thiết kế kiến trúc</span></a>
						</div>
						<div class="col-lg-4">
							<a href="#"><img src="${base}/user/images/logo/img4.png"
								alt=""><span>Thi công nội thất</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /content -->
		<!-- tablist -->
		<div class="container-fluid">
			<div class="row mt-4">
				<ul class="nav nav-tabs col-lg-12 justify-content-center">
					<li class="nav-item"><a href="#tabs3" class="nav-link active"
						id="nav-tabs-3" data-toggle="tab" role="tab">Thiết kế nội thất</a>
					</li>
					<li class="nav-item"><a href="#tabs4" class="nav-link"
						id="nav-tabs-4" data-toggle="tab" role="tab">Văn phòng < 250m2</a>
					</li>
					<li class="nav-item"><a href="#tabs5" class="nav-link"
						data-toggle="tab" id="nav-tabs-5" role="tab">Văn phòng > 250m2</a></li>
				</ul>
			</div>
			<!-- content -->
			<div class="tab-content mt-3" id="nav-tabContent">
				<div class="tab-pane fade active show" id="tabs3" role="tabpanel">
					<c:forEach var="products" items="${product }" begin="0" end="15"
						step="4" varStatus="loop">
						<div class="d-flex">
							<c:forEach var="item" items="${product }" begin="${loop.index }"
								end="${loop.index + 3}" step="1">
								<div class="w-25 p-1 text-center show-item">
									<a href="/product/${item.id }"><img class="img-fluid"
										src="${item.avatar}" alt="${item.title }"></a>
									<div class="name p-1">
										<a href="/product/${item.id }">${item.title }</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane fade" id="tabs4" role="tabpanel">
					<c:forEach var="products" items="${product }" begin="16" end="31"
						step="4" varStatus="loop">
						<div class="d-flex">
							<c:forEach var="items" items="${product }" begin="${loop.index }"
								end="${loop.index + 3 }" step="1">
								<div class="w-25 p-1 text-center show-item">
									<a href="/product/${items.id }"><img class="img-fluid"
										src="${items.avatar}" alt="${items.title }"></a>
									<div class="name p-1">
										<a href="/product/${items.id }">${items.title }</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane fade" id="tabs5" role="tabpanel">
					<c:forEach var="products" items="${product }" begin="31" end="39"
						step="4" varStatus="loop">
						<div class="d-flex">
							<c:forEach var="items" items="${product }" begin="${loop.index }"
								end="${loop.index + 3 }" step="1">
								<div class="w-25 p-1 text-center show-item">
									<a href="/product/${items.id }"><img class="img-fluid"
										src="${items.avatar}" alt="${items.title }"></a>
									<div class="name p-1">
										<a href="/product/${items.id }">${items.title }</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /content -->
			<!-- product -->
			<div class="product m-4" id="content-product">
				<div class="row justify-content-center">
					<h3 class="title">Sản phẩm nội thất</h3>
				</div>
				<div class="list-product">
					<c:forEach var="products" items="${product }" step="6" begin="42"
						varStatus="loop">
						<div class="d-flex">
							<c:forEach var="item" items="${product }" begin="${loop.index }"
								end="${loop.index + 6 }" step="1">
								<div class="w-16 m-1 box">
									<a href="/product/${item.id }"><img class="img-fluid"
										src="${item.avatar }" alt="${item.title }"></a>
									<div class="desc text-center">
										<a href="/product/${item.id }">${item.title }</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /product -->
		</div>
		<!-- /tablish -->
		<!-- /main -->
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>

</html>