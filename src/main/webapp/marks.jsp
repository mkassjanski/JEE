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
									    tr.append("<td>"+dane[i].student.firstName+" "+dane[i].student.lastName+ " [" +dane[i].student.indexNumber+ ']'+ "</td>");
									    tr.append("<td>"+dane[i].mark+"</td>");
									    tr.append("<td>"+dane[i].subject+"</td>");
									    td = $('<td/>');
									    td.append(
"<a href='${pageContext.request.contextPath}/PrviewMark/"+dane[i].id+"' class='btn btn-xs btn-warning' role='button'> Podgląd </a> ");
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
							success: function() { document.location.reload(true);},
 						    error: function() { alert("Nieprawidłowo wprowadzono dane!"); }
						}		
						);
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

		        <div class="form-group">
		            	<label for="mark" class="col-sm-2 control-label" >Mark:</label>

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

    <jsp:include page="include/footer.jsp" />
</div>

<jsp:include page="include/scripts.jsp" />
</body>
</html>