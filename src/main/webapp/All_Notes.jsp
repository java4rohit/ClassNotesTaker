<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.Entity.* "%>

<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="All_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>
		<div class="row">
 			<div class="col-12">
				<%
					Session session2 = FactoryProvider.getFactory().openSession();
					Query<Note> q = session2.createQuery("from Note");
					List<Note> list = q.list();
					for (Note note : list) {
				%>
				<div class="card mt-3"">
					<img class="card-img-top m-4 mx-auto" style="max-width: 100px"
						src="img/notes.png">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%></p>
							<p ><b class="text-primary "><%=note.getAddedDate() %></b></p>
							
						<hr>
						<div class="container text-center mt-2">
						
							     <a href="DeleteServlet?note_id=<%=note.getId()%>"class="btn btn-danger">Delete</a> 
								<a href="Edit.jsp?note_id=<%=note.getId() %>"class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
				<%
					}
					session2.close();
				%>
			</div>
		</div>

	</div>
</body>
</html>