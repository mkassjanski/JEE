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
			$.ajax
				(
					{
						url: '${pageContext.request.contextPath}/api/student/preview/${StudentID}',
						type: 'GET',
						success: function(data) { 
										document.getElementById('firstName').innerHTML = data.firstName;
										document.getElementById('lastName').innerHTML = data.lastName;
										document.getElementById('indexNumber').innerHTML = data.indexNumber;
									}
					}	
				);
			}
		);
	</script>
	<script>
		$(document).ready(function()
			{
				$( "#delete" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/api/student/delete/${StudentID}',
						    type: 'DELETE',
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Students"); }
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
        <h1 class="text-center">Student</h1>
        <br/>

        <label>First Name:</label>
        <div id = "firstName"></div>

        <label>Last Name:</label>
        <div id = "lastName"></div>

        <label>Index Number:</label>
        <div id = "indexNumber"></div>
			    <div>
               	<a href="${pageContext.request.contextPath}/StudentEdit/${StudentID}" class="DelButton" role="button">Edit</a>
               	<button id="delete" type="submit" class="DelButton">Delete</button>
				<a href="${pageContext.request.contextPath}/Students" class="DelButton" role="button">Back</a>
    	</div>
    </div>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>