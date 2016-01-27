
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
									    td.append("<a href='${pageContext.request.contextPath}/StudentPreview/"+dane[i].id+"' class='DelButton' role='button'> Preview </a> "+ "<a href='${pageContext.request.contextPath}/StudentEdit/"+dane[i].id+"' class='DelButton' role='button'>Edit</a> "
									    		+"<button id="+dane[i].id+" onClick='del("+dane[i].id+")' type='submit' class='DelButton'>Delete</button>");
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
		function del(id)
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
<jsp:include page="include/nav.jsp" />

<div>
    <div>
        <h1>Students</h1>
        <br/>

        <table id="tabela" class="zui-table zui-table-horizontal zui-table-highlight">
        <thead>
               <tr>
                     <th>First Name</th>
                     <th>Last Name</th>
                     <th>Index Number</th>
                     <th></th>
              </tr>
              </thead>
	</table>
    </div>


<div>
    <div>
        <h1>Add student</h1>

        	<form action="${pageContext.request.contextPath}/api/student/add" data-toggle="validator" method="post">
		        <div>
		            <label for="firstName">First Name:</label>
		            <input type="text" name="firstName" id="firstName" data-minlength="2" required>
		        </div>

		        <div>
		            <label for="lastName">Last Name:</label>
		            <input type="text" name="lastName" id="lastName" data-minlength="2" required>
		        </div>

		        <div>
		            <label for="indexNumber">Index Number:</label>
		            <input type="text" name="indexNumber" id="indexNumber" data-minlength="2" required>
		           
		        </div>
		        <div>
		                <button id='add'  class="myButton" type="submit">Add</button>
		        </div>
            	</form>
 				<jsp:include page="include/footer.jsp" />
			</div>

		<jsp:include page="include/scripts.jsp" />
</body>
</html>