<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<script type="text/javascript">

    var check = function() {
        if (document.getElementById('inputPassword').value ==
        document.getElementById('inputPasswordConfirm').value) 
        {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'matching';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'not matching';
        }
    }

    function check_info () {
        if (
            document.getElementById('inputEmail').value == ''
            || document.getElementById('inputFirstName').value == ''
            || document.getElementById('inputLastName').value == ''
            || document.getElementById('inputEmail').value == ''
            || document.getElementById('inputPassword').value == ''
            || document.getElementById('inputPasswordConfirm').value == ''
            || document.getElementById('inputPassword').value !=
                document.getElementById('inputPasswordConfirm').value
            ) 
        {
            document.getElementById('submit').disabled = true;
        } else {
            document.getElementById('submit').disabled = false;
        }
    }

</script>