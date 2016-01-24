
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="include/head.jsp" />
	<jsp:include page="include/scripts.jsp" />
	<script>
		$(document).ready(function()
				{		
				$.ajax
					(
						{
							url: '${pageContext.request.contextPath}/api/student/showAll',
							type: 'GET',
							success: function(dane)
							{ 
								var d = dane.length;
								var table = document.getElementById("tabela");
								for (var i = 0; i < d; i++)
								{
									    tr = $('<tr/>');
									    tr.append("<td>"+dane[i].firstName+"</td>");
									    tr.append("<td>"+dane[i].lastName+"</td>");
									    tr.append("<td>"+dane[i].indexNumber+"</td>");
									    td = $('<td/>');
									    td.append(
"<a href='google.pl' class='btn btn-xs btn-warning' role='button'> Podgląd </a> ");
									    tr.append(td);
									    $(table).append(tr);
								}
							}
						}	
					);
				}
			);
	</script>
	<script>
		function usun(id)
				{	
					$.ajax
					(
						{
							url: '${pageContext.request.contextPath}/api/student/delete/'+id,
							type: 'DELETE',
							success: function() { document.location.reload(true);}
						}	
					);
				}
	</script>
</head>

<body>


<div class="container">
    <div class="row">
        <h1 class="text-center">Students</h1>
        <div>
        	<a href="${pageContext.request.contextPath}/AddStudent" class="btn btn-success" role="button">Dodaj</a>
         </div>
        <br/>

        <table id="tabela" class="table table-striped">
               <tr>
                     <th>First Name</th>
                     <th>Last Name</th>
                     <th>Index Number</th>
                     <th></th>
              </tr>
	</table>
    </div>

 <jsp:include page="include/footer.jsp" />
</div>

<jsp:include page="include/scripts.jsp" />
</body>
</html>