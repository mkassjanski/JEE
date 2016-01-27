<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
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
						    url: '${pageContext.request.contextPath}/api/mark/add',
						    type: 'POST',
						    data:
							{
						    	student: document.getElementById('student').value,
						    	mark: document.getElementById('mark').value,
						    	subject: document.getElementById('subject').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Marks"); },
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

<div class="container">
    <div class="row">
        <h1 class="text-center">Add mark</h1>
            	<form  method="post" class="form-horizontal">

		        <div class="form-group">
		         	<label for="student" class="col-sm-2 control-label">Student:</label>
				<div class="col-sm-10">
				         <select type="text" name="student" id="student" class="form-control" >
				     		<c:forEach var="studentFK" items="${AllStudents}" varStatus="loopCounter">
						    	<option value="${studentFK.id}">${studentFK.getFirstName()} ${studentFK.getLastName()} [${studentFK.getIndexNumber()}]</option>
					    	</c:forEach>
					</select>
				</div>
		        </div>

		        <div>
		            	<label for="mark" >Mark:</label>

		            	<div class="col-sm-10">
		                	<input type="text" name="mark" id="mark" class="form-control">
		            	</div>
		        </div>

		        <div class="form-group">
		           	<label for="subject" class="col-sm-2 control-label">Subject:</label>

		            	<div class="col-sm-10">
		                	<input type="text" name="subject" id="subject" class="form-control"/>
		            	</div>
		        </div>
		        <div class="form-group text-center">
		                <button id="add" type="submit" class="btn btn-success">Dodaj</button>
				<a href="${pageContext.request.contextPath}/Marks" class="btn btn-default" role="button">Wróć</a>
		        </div>

            	</form>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>