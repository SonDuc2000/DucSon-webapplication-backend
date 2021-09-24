<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- singup -->
<div class="row">
	<nav
		class="navbar navbar-expand-sm navbar-collapse navbar-dark bg-dark justify-content-end">
		<div id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link text-white" href="${base }/cart/check-bill"><i
						class="fas fa-money-check-alt"></i> Kiểm tra đơn hàng</a></li>
				<li class="nav-item shop"><a class="nav-link text-white"
					href="${base }/cart/view"><i class="fas fa-shopping-basket"></i>
						Giỏ hàng</a> <c:if test="${totalItems == null}"><span id="totalItem" class="numberCard text-white">0</span></c:if>
						<span id="totalItem" class="numberCard text-white">${totalItems }</span>
				</li>
				
				<c:choose>
					<c:when test="${isLogined }">
					
		                <li class="nav-item dropdown ">
		                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		                    <i class="fas fa-user fa-fw"></i>${userLogined.fullName }</a>
		                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
		                        <li><a class="dropdown-item" href="#!">Settings</a></li>
		                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
		                        <li><hr class="dropdown-divider" /></li>
		                        <li><a class="dropdown-item" href="${base }/log-out">Logout</a></li>
		                    </ul>
		                </li>
					
					</c:when>
					
					<c:otherwise>
						<li class="nav-item"><a class="nav-link text-white"
						href="${base }/manager-log-in"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</div>
<!-- /sing up -->
<div class="banner row">
	<div class="col-lg-7 bg-light logo text-right">
		<a href="#"><img src="${base }/user/images/logo/logo-vd.png"
			alt="vd"></a>
	</div>
	<div class="col-lg-5 nameOfcom">
		<a class="text-dark" href="#"><h3>DESIGNS</h3></a>
	</div>
</div>
<!-- navbar -->
<div class="row border-top border-bottom">
	<nav class="navbar navbar-expand-lg navbar-inverse bg-light col-lg-12">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-center">
			<ul class="navbar-nav">
				<li class="nav-item mr-5"><a href="${base }/home"
					class="nav-link">Trang chủ</a></li>
				<li class="nav-item dropdown mr-5"><a href="${base }designs"
					class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thiết
						kế nội thất</a>
					<div class="dropdown-menu dropdown-menu-left"
						aria-labelledby="navbarDropdown">
						<a href="#" class="dropdown-item">> Thiết kế văn phòng</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">> Văn phòng > 250m2</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">> Văn phòng < 250m2</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a href="${base }categories"
					class="hover nav-link dropdown-toggle" id="navbarDropdown"
					role="button" data-toggle="dropdown">Sản phẩm / Product</a>
					<div class="dropdown-menu dropdown-menu-left"
						aria-labelledby="navbarDropdown">
						<a href="${base }/categories" class="dropdown-item">> Quầy lễ
							tân / Reception</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Bàn văn
							phòng / Table</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Ghế văn
							phòng / Chair</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Vách
							ngăn / Partition</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Tủ tài
							liệu / Cabinet</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Vật liệu
							- Phụ kiện</a>
						<div class="dropdown-divider"></div>
						<a href="${base }/categories" class="dropdown-item">> Thảm văn
							phòng</a>
					</div></li>
				<li class="nav-item mr-5"><a href="${base }/product-price"
					class="nav-link">Báo giá thiết kế</a></li>
				<li class="nav-item mr-5"><a href="${base }/custormer"
					class="nav-link">Khách hàng</a></li>
				<li class="nav-item dropdown mr-5"><a href="${base }/news"
					class="nav-link dropdown-toggle" id="navbarDropdown3" role="button"
					data-toggle="dropdown">Tin tức</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
						<a href="#" class="dropdown-item">> Thông tin vật liệu</a>
					</div></li>
				<li class="nav-item mr-5"><a href="${base }/contact"
					class="nav-link">Liên hệ</a></li>
			</ul>
		</div>
	</nav>
</div>
<!-- search bar -->
<form class="row bg-dark" action="${base }/search" method="get">
	<div
		class="input-group mb-2 mt-2 border rounded-pill col-lg-6 offset-3 p-1">
		<input type="text" name="keysearch" placeholder="Tìm kiếm ..."
			aria-describedby="button-addon3"
			class="form-control bg-none border-0">
		<div class="input-group-append border-0">
			<button id="button-addon3" value="search" type="submit"
				class="btn btn-link text-success">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
</form>
<!-- /search bar -->
<!-- /navbar -->