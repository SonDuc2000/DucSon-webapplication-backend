<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<title>Tables - SB Admin</title>
<jsp:include page="/WEB-INF/views/manager/Layout/css.jsp"></jsp:include>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/manager/Layout/header.jsp"></jsp:include>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">Tables</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net/">official
							DataTables documentation</a> .
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> Category Table
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Message</th>
									<th>Status</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Message</th>
									<th>Status</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="contact" items="${contacts }">
									<tr>

										<td>${contact.firstName }</td>
										<td>${contact.lastName }</td>
										<td>${contact.email }</td>
										<td>${contact.message }</td>
										<td>${contact.getStatus() }</td>
										
										<c:choose>
										
											<c:when test="${contact.getStatus() == true }">
										<td style="text-align: center;"><a
											href="${base }/admin/manager-contact/contact/${contact.id }"><i
												class="fas fa-edit"></i></a></td>
										</td>
										<td style="text-align: center;"><a
											href="${base }/admin/manager-contact/remove/${contact.id }">Xóa</a></td>
											</c:when>
											
											<c:otherwise>
												<td style="text-align: center;"><a
											href="${base }/admin/manager-category/reset/${categori.id }"><i
												class="fas fa-edit"></i></a></td>
										</td>
										<td style="text-align: center;"><a
											href="${base }/admin/manager-category/delete/${categori.id }">Xóa</a></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="/WEB-INF/views/manager/Layout/footer.jsp"></jsp:include>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${base }/manager/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="${base }/manager/js/datatables-simple-demo.js"></script>
</body>
</html>
