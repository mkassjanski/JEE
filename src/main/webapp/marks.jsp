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
							url: '${pageContext.request.contextPath}/api/mark/showAll',
							type: 'GET',
							success: function(dane)
							{ 
								var d = dane.length;
								var table = document.getElementById("table");
								for (var i = 0; i < d; i++)
								{
									    tr = $('<tr/>');
									    tr.append("<td>"+dane[i].student.firstName+" "+dane[i].student.lastName+ " [" +dane[i].student.indexNumber+ ']'+ "</td>");
									    tr.append("<td>"+dane[i].mark+"</td>");
									    tr.append("<td>"+dane[i].subject+"</td>");
									    td = $('<td/>');
									    td.append(
"<a href='${pageContext.request.contextPath}/MarkPreview/"+dane[i].id+"' class='DelButton' role='button'>Preview</a> "+
"<a href='${pageContext.request.contextPath}/MarkEdit/"+dane[i].id+"' class='DelButton' role='button'>Edit</a> "+
"<a href='${pageContext.request.contextPath}/MarkDelete/"+dane[i].id+"' class='DelButton' role='button'>Delete</a> ");
									    tr.append(td);
									    $(table).append(tr);
								}
							}
						}	
					);
				}
			);
	</script>
<!-- 	<script>
	$(document).ready(function(){
		$( "#dele" ).on('click', function() {
       var idk = $(this).data('idk'); < t
       alert("idk");
       $.ajax
		(
			{
				url: '${pageContext.request.contextPath}/api/mark/delete/'+idk,
				type: 'DELETE',
				success: function() { document.location.reload(true);}
			}	
		);
    });
});
	</script>
 -->
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
		function del(id)
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
<jsp:include page="include/nav.jsp" />
<div >
    <div>
        <h1>Marks</h1>
        <br/>

        <table id="table" class="zui-table zui-table-horizontal zui-table-highlight">
              <thead>
               <tr>
                   <th>Student</th>
                   <th>Mark</th>
                   <th>Subject</th>
                   <th></th>
              </tr>
              </thead>
	</table>
    </div>
    
        <div>
        <h1>Add mark</h1>
            	<form  method="post">

		        <div>
		         	<label for="student">Student:</label>
				         <select type="text" name="student" id="student" >
				     		<c:forEach var="studentFK" items="${AllStudents}" varStatus="loopCounter">
						    	<option value="${studentFK.id}">${studentFK.getFirstName()} ${studentFK.getLastName()} [${studentFK.getIndexNumber()}]</option>
					    	</c:forEach>
					</select>
		        </div>

		        <div>
		            	<label for="mark">Mark:</label>
		                <input type="text" name="mark" id="mark"  placeholder="3.0" >
		        </div>

		        <div>
		           	<label for="subject">Subject:</label>
		            <input type="text" name="subject" id="subject"/>
		        </div>
		        <div>
		            <button id="add" type="submit" class="myButton">Dodaj</button>
		        </div>

            	</form>

    <jsp:include page="include/footer.jsp" />
</div>

<jsp:include page="include/scripts.jsp" />
</body>
</html>