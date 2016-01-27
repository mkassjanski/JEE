<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../include/head.jsp" />
	<jsp:include page="../include/scripts.jsp"/>
	<script>
		$(document).ready(function()
			{
				$( "#edytuj" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/api/mark/edit/${MarkID.getId()}',
						    type: 'PUT',
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

<div>
    <div>
        <h1>Edit Mark</h1>
            	<form data-toggle="validator" method="put">

		        <div>
		         	<label for="student">Student:</label>
				         <select type="text" name="student" id="student" required>
				     		<c:forEach var="studentFK" items="${StudentID}" varStatus="loopCounter">
						<c:choose>
						    <c:when test="${studentFK.id == MarkID.getStudent().getId()}">
						    	<option value="${studentFK.id}" selected="selected">${studentFK.getFirstName()} ${studentFK.getLastName()} ${studentFK.getIndexNumber()}]</option>
						    </c:when>
						    <c:otherwise>
							<option value="${studentFK.id}">${studentFK.getFirstName()} ${studentFK.getLastName()} [${studentFK.getIndexNumber()}]</option>
							<br />
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					</select>
		        </div>

		        <div>
		            	<label for="mark" class="col-sm-2 control-label" >Mark:</label>
		                <input type="text" name="mark" id="mark" value="${MarkID.getMark()}"  required>
		        </div>

		        <div>
		           	<label for="subject" class="col-sm-2 control-label" min="2">Subject:</label>
		            <input type="text" name="subject" id="subject" value="${MarkID.getSubject()}">
		        </div>
		        <div>
		                <button id="edytuj" type="submit" class="DelButton">Edit</button>
				<a href="${pageContext.request.contextPath}/Marks" class="DelButton" role="button">Back</a>
		        </div>

            	</form>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>