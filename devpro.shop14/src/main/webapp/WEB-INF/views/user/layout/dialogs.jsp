<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bạn cần đăng nhập để thực hiện thao tác này!!!</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Tiếp tục xem hàng</button>
				<button type="button" class="btn btn-primary" onclick="assignPage ()">Đi tới trang đăng nhập</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function assignPage () {
		window.location.assign('/manager-log-in');
	}
</script>