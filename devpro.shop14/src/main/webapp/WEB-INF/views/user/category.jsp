<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Bai tap cuoi khoa</title>
<meta charset="utf-8">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base }/user/css/danhMuc.css">
<jsp:include page="/WEB-INF/views/user/cartLayout/css.jsp"></jsp:include>

</head>
<body>
	<!-- menu -->
	<script type="text/javascript">
	
	</script>
	<div class="container-fluid" style="margin-bottom: 10px; padding: 0;">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /menu -->
		<!-- product -->
		<div class="container" style="margin-top: 80px;">
			<div class="row">
				<div class="col-lg-12 ml-auto">
					<span class="sanpham">SẢN PHẨM</span> <select
						style="font-size: 15px; padding: 8px; cursor: pointer;">
						<option>Nội thất giá rẻ</option>
						<option>Sản phẩm hot</option>
					</select>
				</div>
				<div class="col-lg-12" style="margin-top: 4px;">
					<div class="line"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 10px;">
				<c:forEach var="products" items="${product }">
					<div class="col-lg-3 col-md-4 col-sm-6"
						style="margin-bottom: 30px;">
						<div class="shop">
							<a href="${base }/product/${products.id}" class="thumbnail"><img
								class="img-thumbnail" src="${products.avatar }"
								alt="${products.title }" height="109px;"></a>
							<div class="buy">
								<a href="/product/${products.id }">Xem thêm</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- /product -->
		<div class="container">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">Trước</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Sau</a></li>
			</ul>
		</div>
		<div class="social-icon">
			<ul>
				<li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
				<li><a href="#"><i class="fab fa-internet-explorer"></i></a></li>
				<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
				<li><a href="#"><i class="fab fa-instagram-square"></i></a></li>
			</ul>
		</div>
		<!-- footer -->
		<div class="line"></div>
		<footer class="footer bg-light" style="padding-top: 10px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4">
						<div class="title">
							<b>GIỚI THIỆU</b>
							<ul>
								<li><a href="#">Về chúng tôi</a></li>
								<li><a href="#">Lĩnh vực hoạt động</a></li>
								<li><a href="#">Hỏi đáp</a></li>
								<li><a href="#">Quy chế hoạt động</a></li>
								<li><a href="#">Tuyển dùng</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="title">
							<b>TRỢ GIÚP</b>
							<ul>
								<li><a href="#">Hướng dẫn thanh toán</a></li>
								<li><a href="#">Quy định đổi trả</a></li>
								<li><a href="#">Chính sách bán hàng</a></li>
								<li><a href="#">Chính sách bảo mật</a></li>
								<li><a href="#">Quy định thảo luận</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="title">
							<b>THÔNG TIN CÔNG TY</b>
							<ul>
								<li><a href="#" style="font-weight: bold;">CEO: NGUYỄN
										ĐỨC SƠN</a></li>
								<li><a href="#"><i class="fas fa-map-marker-alt"></i>Quận
										thanh xuân mai dịch, Hà Nội</a></li>
								<li><a href="#"><i class="far fa-envelope"></i>dson.designs@gmail.com</a></li>
								<li><a href="#"><i class="fas fa-phone-alt"></i>phone:
										0336816498</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- /footer -->
</body>
</html>