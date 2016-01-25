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
							url: '${pageContext.request.contextPath}/api/mark/showAll',
							type: 'GET',
							success: function(dane)
							{ 
								var d = dane.length;
								var table = document.getElementById("tabela");
								for (var i = 0; i < d; i++)
								{
									    tr = $('<tr/>');
									    tr.append("<td>"+dane[i].student.lastName+"</td>");
									    tr.append("<td>"+dane[i].mark+"</td>");
									    tr.append("<td>"+dane[i].subject+"</td>");
									    td = $('<td/>');
									    td.append(
"<a href='${pageContext.request.contextPath}/PodgladPogrzeb/"+dane[i].id+"' class='btn btn-xs btn-warning' role='button'> Podgląd </a> ");
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
							url: '${pageContext.request.contextPath}/api/mark/delete/'+id,
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
        <h1 class="text-center">Marks</h1>
        <div>
        	<a href="${pageContext.request.contextPath}/AddMark" class="btn btn-success" role="button">Dodaj</a>
         </div>
        <br/>

        <table id="tabela" class="table table-striped">
               <tr>
                   <th>Student</th>
                   <th>Mark</th>
                   <th>Subject</th>
                   <th></th>
              </tr>
	</table>
    </div>

    <jsp:include page="include/footer.jsp" />
</div>

<jsp:include page="include/scripts.jsp" />
</body>
</html>