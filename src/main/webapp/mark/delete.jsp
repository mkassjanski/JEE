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
				$( "#delete" ).on('click', function(e)
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

<div>
    <div>
        <h1 class="text-center">Are you sure?</h1>

			    <div>
			    <button id="delete" type="submit" class="DelButton">Yes</button>
				<a href="${pageContext.request.contextPath}/Marks" class="DelButton" role="button">No</a>
    	</div>
    </div>

    <jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>