<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    	<jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/scripts.jsp" />
	<script>
		$(document).ready(function()
			{
				$( "#add" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/api/student/add',
						    type: 'POST',
						    data:
							{
						    	FirstName: document.getElementById('FirstName').value,
						    	LastName: document.getElementById('LastName').value,
						    	IndexNumber: document.getElementById('IndexNumber').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Students"); },
 						    error: function() { alert("Nieprawidłowo wprowadzono dane!"); }
						}		
						);
					}
				);
			}
		);
	</script>
</head>

<body>

<div class="container">
    <div class="row">
        <h1 class="text-center">Add student</h1>

        	<form action="${pageContext.request.contextPath}/api/student/add" data-toggle="validator" method="post" class="form-horizontal">
		        <div class="form-group">
		            <label for="FirstName" class="col-sm-2 control-label">First Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="FirstName" id="FirstName" class="form-control" data-minlength="2" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="LastName" class="col-sm-2 control-label">Last Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="LastName" id="LastName" class="form-control" data-minlength="2" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="IndexNumber" class="col-sm-2 control-label">Index Number:</label>

		            <div class="col-sm-10">
		                <input type="text" name="IndexNumber" id="IndexNumber" class="form-control" data-minlength="2" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		                <button id=add type="submit" class="btn btn-success">Add</button>
				<a href="${pageContext.request.contextPath}/students.jsp" class="btn btn-default" role="button">Back</a>
		 	    </div>
		        </div>
            	</form>

    <jsp:include page="../include/footer.jsp" />
</div>

</body>
</html>