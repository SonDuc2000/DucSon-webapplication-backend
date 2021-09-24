<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<title>Card</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- bootstrap css -->
<jsp:include page="/WEB-INF/views/user/cartLayout/css.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base}/user/css/card.css">
</head>
<body>
	<div class="container-fluid"
		style="padding: 0; margin: 0 auto; width: 100%">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /header -->

		<div class="container mt-5 mb-5">
			<div class="row">
				<div class="left-container col-lg-8 bg-light">
					<c:choose>
						<c:when test="${isLogined }">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Thứ tự</th>
										<th scope="col">Code</th>
										<th scope="col">Customer Name</th>
										<th scope="col">Custormer Address</th>
										<th scope="col">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="bill_item" items="${bill }">
										<tr>
											<th scope="row"></th>
											<td><a href="#">${bill_item.code }</a></td>
											<td><a href="#">${bill_item.customerName }</a></td>
											<td><label> ${bill_item.customerAddr } </label></td>
											<td><label> ${bill_item.total } </label></td>
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
											<td><a href="#"><img class="mr-3 img-thumbnail"
													src="${product.avatar }"></a></td>
											<td><a href="${base }/product/${product.productId}">${product.productName }</a></td>
											<td><label> ${product.shortDesc } </label></td>
											<td><label> ${product.quanlity } </label></td>
											<td>
												<p>${product.priceUnit }</p>
											</td>
											<td>
												<p>${product.priceUnit }</p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
</html>