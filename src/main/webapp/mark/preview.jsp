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
		$.ajax
			(
				{
					url: '${pageContext.request.contextPath}/api/mark/preview/${MarkID}',
					type: 'GET',
					success: function(w) { 
									document.getElementById('student').innerHTML = w.student.firstName+" "+w.student.lastName+" ["+w.student.indexNumber+"]";
									document.getElementById('mark').innerHTML = w.mark;
									document.getElementById('subject').innerHTML = w.subject;
									document.getElementById('createdAt').innerHTML = w.createdAt;
								}
				}	
			);
		}
	);
	</script>
	<script>
		$(document).ready(function()
			{
				$( "#del" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/api/mark/delete/${MarkID}',
						    type: 'DELETE',
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Marks"); }
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
        <h1 class="text-center">Mark</h1>
        <br/>

        <label>Student:</label>
        <div id = "student" ></div>

        <label>Mark:</label>
        <div id = "mark" ></div>

        <label>Subject:</label>
        <div id = "subject" ></div>

        <label>Date:</label>
        <div id = "createdAt"></div>
	<div >
		                <a href="${pageContext.request.contextPath}/MarkEdit/${MarkID}" class="DelButton" role="button">Edit</a>
		                <button id="del" type="submit" class="DelButton">Delete</button>
				<a href="${pageContext.request.contextPath}/Marks" class="DelButton" role="button">Back</a>
    	</div>
    </div>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>