<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
	<title>Card</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<!-- bootstrap css -->
	<link rel="stylesheet" type="text/css" href="${base}/user/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${base}/user/css/card.css">
	<link rel="stylesheet" type="text/css" href="${base}/user/fontawesome-free-5.15.3-web/css/all.css">
	<!-- bootstrap js -->
	<script type="text/javascript" href="${base}/user/js/bootstrap.min.js"></script>
	<script type="text/javascript" href="${base}/user/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" href="${base}/user/js/jquery.sticky-kit.js"></script>
	<script type="text/javascript" href="${base}/user/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container-fluid" style="padding: 0; margin: 0 auto; width: 100%">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /header -->

		<div class="container mt-5 mb-5">
			<div class="row">
				<div class="left-container col-lg-8 bg-light">
					<c:choose>
						<c:when test="${cart != null }">
							<table class="table table-striped">
								<thead>
									<tr>
									<th scope="col">Thứ tự</th>
									<th scope="col">Avatar</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Mô tả</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Đơn tiền</th>
									<th scope="col">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="product" items="${cart.cartItems }">
									<tr>
										<th scope="row"></th>
										<td><a href="#"><img class="mr-3 img-thumbnail" src="${product.avatar }"></a></td>
										<td><a href="${base }/product/${product.productId}">${product.productName }</a></td>
										<td> <label> ${product.shortDesc } </label></td>
										<td> <label> ${product.quanlity }  </label></td>
										<td> <p> ${product.priceUnit } </p></td>
										<td> <p> ${product.priceUnit } </p></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</c:when>
						
						<c:otherwise>
							<table class="table table-striped">
								<thead>
									<tr>
									<th scope="col">Thứ tự</th>
									<th scope="col">Avatar</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Mô tả</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Đơn tiền</th>
									<th scope="col">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="product" items="${saleOrder }">
									<tr>
										<th scope="row"></th>
										<td><a href="#"><img class="mr-3 img-thumbnail" src="${product.avatar }"></a></td>
										<td><a href="${base }/product/${product.productId}">${product.productName }</a></td>
										<td> <label> ${product.shortDesc } </label></td>
										<td> <label> ${product.quanlity }  </label></td>
										<td> <p> ${product.priceUnit } </p></td>
										<td> <p> ${product.priceUnit } </p></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="right-container col-lg-4 bg-light">
					<c:choose>
						<c:when test="${cart != null }">
							<form action="${base }/view/access" method="post">
								<div class="form-group">
									<label for="exampleFormControlInput1">Full Name</label>
									<input type="text" name="customerName" class="form-control" id="inputName" placeholder="Nguyen Duc Son">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Email address</label>
									<input type="email" name="customerEmail" class="form-control" id="inputEmail" placeholder="name@example.com">
								</div>
								<div class="form-group">
									<label for="exampleFormControlSelect1">Select Address</label>
								    <select class="form-control" id="inputAdd" name="customerAddr">
										<option>Hà Nội</option>
										<option>Hải Phòng</option>
										<option>TP.Hồ Chí Minh</option>
								    </select>
								</div>
								<div class="form-group">
									<label for="exampleFormControlTextarea1">Note</label>
									<textarea class="form-control" id="inputNote" rows="3"></textarea>
								</div>
								<div class="row justify-content-center">
									<button onclick="alertMess()" type="submit" class="buy text-white">XÁC NHẬN ĐƠN HÀNG</button>
								</div>
							</form>
						</c:when>
						
						<c:otherwise>
							<form action="${base }/view/access" method="post">
								<div class="form-group">
									<label for="exampleFormControlInput1">Full Name</label>
									<input type="text" name="customerName" readonly="readonly" class="form-control" id="inputName" placeholder="${order.customerName }">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Email address</label>
									<input type="email" name="customerEmail" readonly="readonly" class="form-control" id="inputEmail" placeholder="${order.customerEmail }">
								</div>
								<div class="form-group">
									<label for="exampleFormControlSelect1">Select Address</label>
								    <select class="form-control" id="inputAdd" name="customerAddr">
										<option>${order.customerAddr }</option>
								    </select>
								</div>
								<div class="form-group">
									<label for="exampleFormControlTextarea1">Note</label>
									<textarea class="form-control" id="inputNote" rows="3"></textarea>
								</div>
								<div class="row justify-content-center">
									<button type="submit" class="buy text-white">XÁC NHẬN ĐƠN HÀNG</button>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
		<!-- /footer -->
	</div>
</body>
<script type="text/javascript">
	var table = document.getElementsByTagName('table')[0],
	rows = table.getElementsByTagName('tr'),
	text = 'textContent' in document ? 'textContent' : 'innerText';
	console.log(text);
	
	for (var i = 1, len = rows.length; i < len; i++){
	rows[i].children[0][text] = i + rows[i].children[0][text];
	}
	
	function alertMess() {
		alert("Xác nhận thành công!");
	}
</script>
 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</html>