<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<title>Liên Hệ</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- meta tags -->
<meta charset="utf-8">
<meta name="viewsport" content="width=device-width, initial-scale=1">
<!-- bootstrap css -->
<jsp:include page="/WEB-INF/views/user/ContactLayout/css.jsp"></jsp:include>
<!-- bootstrap js -->
<jsp:include page="/WEB-INF/views/user/ContactLayout/js.jsp"></jsp:include>
</head>
<body>
	<div class="container-fluid">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- /header -->
		<!-- Contact -->
		<div class="container mt-5 mb-5">
			<div class="row">
				<div class="col-lg-7">

					<sf:form action="${base }/contact" method="post"
						modelAttribute="contact" enctype="multipart/form-data">

						<div class="form-title">
							<h3>LIÊN HỆ</h3>
						</div>
						<div class="form-row">
							<div class="col mt-3">
								<label for="InputName">Họ và tên</label>
								<sf:input type="text" path="inputName" class="form-control"
									id="InputName" aria-describedby="nameCall" value="${contacts.firstName }"
									placeholder="Nguyễn Văn A" />
							</div>
							<div class="col mt-3">
								<label for="InputEmail">Email</label>
								<sf:input type="email" path="inputEmail" class="form-control"
									id="InputEmail" value="${contacts.firstName }" placeholder="example@gmail.com" />
							</div>
						</div>
						<div class="form-row">
							<div class="col mt-3">
								<label for="InputPhone">Số điện thoại liên hệ</label>
								<sf:input type="phone" path="inputPhone" class="form-control"
									id="InputPhone1" value="${contacts.phone }" placeholder="(+84) 336816498" />
							</div>
							<div class="col mt-3">
								<label for="InputTitle">Tiêu đề</label> <input type="title"
									path="inputTitle" value="${contacts.requestType }" class="form-control" id="InputTitle1"
									placeholder="Title">
							</div>
						</div>
						<div class="form-group mt-3">
							<label for="exampleFormControlTextarea1">Nội dung</label>
							<sf:textarea class="form-control" path="inputBody" id="FormArea1"
								name="areal" rows="3" value="${contacts.message }" placeholder="Nhập nội dung ..."></sf:textarea>
						</div>
						<button type="button" onclick="saveContact()"
							class="btn btn-light border border-dark mt-3">GỬI LIÊN
							HỆ</button>
					</sf:form>
				</div>
				<div class="col-lg-5">
					<div class="row">
						<h3>Thông tin liên hệ</h3>
					</div>
					<div class="row">
						<span>CTY TNHH THIẾT KẾ & THI CÔNG NỘI THẤT</span>
					</div>
				</div>
			</div>
		</div>
		<!-- /Contact -->
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
<script type="text/javascript">
	function saveContact() {
		let data = {
			inputName: jQuery("#InputName").val(), // lay theo id
			inputEmail: jQuery("#InputEmail").val(),
			inputTitle: jQuery("#InputTitle1").val(),
			inputBody: jQuery("#FormArea1").val(),
		};
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/contact-ajax",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				alert("Gửi thành công! Chúng tôi sẽ liên hệ sớm với " + jsonResult.message.inputName);
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				
			}
		});
	}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</html>