
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
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
									    td.append("<a href='${pageContext.request.contextPath}/StudentPreview/"+dane[i].id+"' class='btn btn-xs btn-warning' role='button'> Preview </a> "+ "<a href='${pageContext.request.contextPath}/StudentEdit/"+dane[i].id+"' class='btn btn-xs btn-primary' role='button'>Edit</a> ");
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
						    	firstName: document.getElementById('firstName').value,
						    	lastName: document.getElementById('lastName').value,
						    	indexNumber: document.getElementById('indexNumber').value
								
							},
							success: function() { document.location.reload(true);},
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
        <h1 class="text-center">Students</h1>
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


<div class="container">
    <div class="row">
        <h1 class="text-center">Add student</h1>

        	<form action="${pageContext.request.contextPath}/api/student/add" data-toggle="validator" method="post" class="form-horizontal">
		        <div class="form-group">
		            <label for="firstName" class="col-sm-2 control-label">First Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="firstName" id="firstName" class="form-control" data-minlength="2" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="lastName" class="col-sm-2 control-label">Last Name:</label>

		            <div class="col-sm-10">
		                <input type="text" name="lastName" id="lastName" class="form-control" data-minlength="2" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="indexNumber" class="col-sm-2 control-label">Index Number:</label>

		            <div class="col-sm-10">
		                <input type="text" name="indexNumber" id="indexNumber" class="form-control" data-minlength="2" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		                <button id='add' type="submit" class="btn btn-success">Add</button>
				<a href="${pageContext.request.contextPath}/students.jsp" class="btn btn-default" role="button">Back</a>
		 	    </div>
		        </div>
            	</form>
 <jsp:include page="include/footer.jsp" />
</div>

<jsp:include page="include/scripts.jsp" />
</body>
</html>