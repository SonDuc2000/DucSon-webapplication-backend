<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Register - SB Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link href="${base }/manager/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">

	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Create
										Account</h3>
								</div>
								<div class="card-body">
									<form method="post" action="${base }/perform-signUp">
									
									<c:if test="${signUpped == true}">
										<div class="alert alert-danger" role="alert">Tài khoản đã tồn tại!!!</div>
									</c:if>
																
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control"
														id="inputFirstName" name="firstName" type="text"
														placeholder="Enter your first name" onkeyup="check();" /> <label
														for="inputFirstName">First name</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control"
														id="inputLastName" name="lastName" type="text"
														placeholder="Enter your last name" onkeyup="check();" /> <label
														for="inputLastName">Last name</label>
												</div>
											</div>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="email" id="inputEmail"
												type="email" placeholder="name@example.com" onkeyup="check();" /> <label
												for="inputEmail">Email address</label>
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="passWord"
														id="inputPassword" type="password"
														placeholder="Create a password" onchange="check_info ();" onkeyup="check();" /> <label
														for="inputPassword">Password</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="confirmPass"
														id="inputPasswordConfirm" type="password"
														placeholder="Confirm password" onchange="check_info ();" onkeyup="check();" /> <label
														for="inputPasswordConfirm">Confirm Password</label>
													<span id='message'></span>
												</div>
											</div>
										</div>
										<div class="mt-4 mb-0">
											<div class="d-grid">
												<button class="btn btn-primary btn-block" id="submit" type="submit">Create
													Account</button>
											</div>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="${base }/manager-log-in">Have an account? Go to login</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout//checkInfoJs.jsp"></jsp:include>
	<script type="text/javascript">
		function assignPage () {
			window.location.assign('/manager-log-in');
		}
	</script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${base }/manager/js/scripts.js"></script>
</body>
</html>
