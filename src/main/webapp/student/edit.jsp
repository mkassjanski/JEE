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
				$( "#edit" ).on('click', function(k)
					{	
						k.preventDefault();
						$.ajax
						(
						{
					    url: '${pageContext.request.contextPath}/api/student/edit/${StudentID.getId()}',
						    type: 'PUT',
						    data:
							{
						    	firstName: document.getElementById('firstName').value,
						    	lastName: document.getElementById('lastName').value,
						    	indexNumber: document.getElementById('indexNumber').value
								
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
        <h1 class="text-center">Edit student</h1>

        	<form action="${pageContext.request.contextPath}/api/student/edit/${StudentID.getId()}" data-toggle="validator" method="post" class="form-horizontal">
		        <div class="form-group">
		            <label for="firstName" class="col-sm-2 control-label">First Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="firstName" id="firstName" class="form-control" value="${StudentID.getFirstName()}" data-minlength="2" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="lastName" class="col-sm-2 control-label">Last Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="lastName" id="lastName" class="form-control"  value="${StudentID.getLastName()}" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="indexNumber" class="col-sm-2 control-label">Index Number:</label>

		            <div class="col-sm-10">
		                <input type="text" name="indexNumber" id="indexNumber" class="form-control" value="${StudentID.getIndexNumber()}" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		                <button id="edit" type="submit" class="btn btn-primary">Edytuj</button>
				<a href="${pageContext.request.contextPath}/Students" class="btn btn-default" role="button">Wróć</a>
		 	    </div>
		        </div>
            	</form>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>