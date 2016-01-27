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
<jsp:include page="../include/nav.jsp" />

<div>
    <div>
        <h1 class="text-center">Edit student</h1>

        	<form action="${pageContext.request.contextPath}/api/student/edit/${StudentID.getId()}" data-toggle="validator" method="post">
		        <div>
		            <label for="firstName" class="col-sm-2 control-label">First Name:</label>
					<input type="text" name="firstName" id="firstName" value="${StudentID.getFirstName()}" data-minlength="2" required>
		        </div>
		        <div>
		            <label for="lastName" >Last Name:</label>
		            <input type="text" name="lastName" id="lastName" value="${StudentID.getLastName()}" required>
		        </div>
		        <div>
		            <label for="indexNumber" >Index Number:</label>
					<input type="text" name="indexNumber" id="indexNumber" value="${StudentID.getIndexNumber()}" required>
		        </div>
		        <div>
		            <button id="edit" type="submit" class="DelButton">Edit</button>
					<a href="${pageContext.request.contextPath}/Students" class="DelButton" role="button">Back</a>
		 	    </div>
		        </div>
            	</form>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>