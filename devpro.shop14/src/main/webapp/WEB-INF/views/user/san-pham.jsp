<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Sản phẩm</title>
<!-- meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- bootstrap js -->
<script type="text/javascript" href="${base }/user/js/bootstrap.min.js"></script>
<script type="text/javascript"
	href="${base }/user/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	href="${base }/user/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="${base }/user/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${base }/user/css/san-pham.css">
<link rel="stylesheet" type="text/css"
	href="${base }/user/fontawesome-free-5.15.3-web/css/all.min.css">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/user/layout/dialogs.jsp"></jsp:include>
	<div class="container-fluid"
		style="padding: 0; margin: 0 auto; width: 100%">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /navbar -->
		<!-- /header -->
		<!-- main -->
		<!-- product -->
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<!-- col-left -->
				<div class="col-xl-4 col-lg-4 col-md-3">
					<div class="col-lg-12 ml-auto">
						<span class="sanpham">CHÍNH SÁCH BÁN HÀNG</span>
					</div>
					<div class="col-lg-12" style="margin-top: 4px;">
						<div class="line"></div>
					</div>
					<div class="list">
						<ul>
							<li><p>1</p>Giao hàng TOÀN QUỐC</li>
							<li><p>2</p>Thanh toán khi nhận hàng</li>
							<li><p>3</p>Đổi trả trong 15 ngày</li>
							<li><p>4</p>Hoàn ngay tiền mặt</li>
							<li><p>5</p>Chất lượng đảm bảo</li>
							<li><p>6</p>Miễn phí vận chuyển: Đơn hàng từ 50 triệu trở
								lên</li>
						</ul>
					</div>
					<!-- Huong dan mua hang -->
					<b style="font-size: 20px; margin-left: 12px;">HƯỚNG DẪN MUA
						HÀNG</b>
					<div class="col-lg-12" style="margin-top: 4px;">
						<div class="line"></div>
					</div>
					<div class="list">
						<ul>
							<li><p>1</p>Mua hàng trực tiếp tại website
								http://www.runtime.vn</li>
							<li><p>2</p>Gọi điện thoại 0969012033 để mua hàng</li>
							<li><p>3</p>Mua tại Trung tâm CSKH: Quận 1, TPHCM</li>
							<li><p>4</p>Hoàn ngay tiền mặt</li>
							<li><p>5</p>Mua sỉ/buôn xin gọi 0969012033 để được hỗ trợ.</li>
						</ul>
					</div>
					<!-- /Huong dan mua hang -->
				</div>
				<!-- /col-left -->
				<!-- col-right -->
				<div class="col-lg-8">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-5">
							<a href="#" class="thumbnail"><img class="img-thumbnail"
								src="${product.avatar }" alt="" height="120px;"></a>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-7">
							<div class="title">
								<p style="font-weight: bold; font-size: 20px;">${product.title }</p>
							</div>
							<div class="price">
								<p style="color: #f46164; font-weight: bold; font-size: 20px;">${product.price }
									$</p>
							</div>
							<div class="desc">
								<div class="line"></div>
								<p style="font-size: 14px; text-align: justify;">${product.details }
								</p>
								<div class="line"></div>
							</div>
							<div class="btn" style="margin-top: 10px;">
								<div class="number"
									style="text-align: left; margin-bottom: 10px;">
									<p style="display: inline;">Số lượng:</p>
									<input id="number" style="width: 70px;" type="number" value="1"
										min="0" max="99">
								</div>
								<c:choose>
									<c:when test="${isLogined }">
										<button onclick="add(${product.id }, getQuantity ())">THÊM
									GIỎ HÀNG</button>
									</c:when>
									
									<c:otherwise>
										<button data-toggle="modal" data-target="#exampleModalCenter">THÊM
									GIỎ HÀNG</button>
									</c:otherwise>
								</c:choose>
								
								<button onclick="assignPage ();">MUA NGAY</button>
							</div>
						</div>
						<!-- /col-right -->
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="line"></div>
							<div class="title-desc">
								<b style="margin: 10px; font-size: 20px;">THÔNG TIN CHI TIẾT</b>
							</div>
							<div class="desc" style="padding: 5px;">
								<p style="text-align: justify;">${product.shortDesc }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /product -->
		<!-- /main -->
		<!-- footer -->
		<div class="line row"></div>
		<footer class="bg-dark row">
			<div class="col-lg-4 offset-lg-1 col-md-4 col-sm-4">
				<div class="ft-title">
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
			<div class="col-lg-3 col-md-4 col-sm-12">
				<div class="ft-title">
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
			<div class="col-lg-3 col-md-4 col-sm-12">
				<div class="ft-title">
					<b>THÔNG TIN CÔNG TY</b>
					<ul>
						<li><a href="#" style="font-weight: bold;">CEO: NGUYỄN
								ĐỨC SƠN</a></li>
						<li><a href="#"><i class="fas fa-map-marker-alt p-1"></i>Quận
								thanh xuân mai dịch, Hà Nội</a></li>
						<li><a href="#"><i class="far fa-envelope p-1"></i>dson.designs@gmail.com</a></li>
						<li><a href="#"><i class="fas fa-phone-alt p-1"></i>phone:
								0336816498</a></li>
					</ul>
				</div>
			</div>
		</footer>
		<!-- /footer -->
	</div>

	<script type="text/javascript">
	
	function assignPage () {
		window.location.assign('/cart/view');
	}

	function getQuantity () {
		var num = document.getElementById("number").value;
		num = Number(num);
		return num;
		
	}
	
	add = function (productId, quality) {
		
		let data = {
				productId: productId, // lay theo id
				quanlity: quality // lay theo id
       		};
       		
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/cart/add",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
				
				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					let totalItem = jsonResult.totalItems;
					$("#totalItem").html(totalItem);
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
					
				}
			}
		);
	}
	
	
	
</script>

</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
</html>