<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Login - SB</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link href="${base }/manager/css/login.css" rel="stylesheet" />
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
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form action="/login" method="POST">
										<div class=" fb">
											<a href="#">Login using Facebook</a>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="email" name="username">
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="password" type="password">
										</div>
										<div class="form-check mb-3">
											<input class="form-check-input" id="inputRememberPassword"
												type="checkbox" value="" /> <label class="form-check-label"
												for="inputRememberPassword">Remember Password</label>
										</div>
										<c:if test="${not empty param.login_error}">
											<div class="alert alert-danger" role="alert">Login was
												not successfull, Try again!!!</div>
										</c:if>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="password.html">Forgot Password?</a>
											<button class="btn btn-primary" type="submit">Login</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="${base }/sign-up">Need an account? Sign up!</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${base }/manager/js/scripts.js"></script>
</body>
</html>
