<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Entity.* "%>
    <%@page import="org.hibernate.*" %>
    <%@page import="com.helper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="All_js_css.jsp"%>
</head>
<body>

<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit your Note</h1>
		
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		Session session2=FactoryProvider.getFactory().openSession();
		Note note = session2.get(Note.class, noteId);
		%>
		
		<form action="UpdateServlet" method="post">
		
		<input value="<%= note.getId()%>" name="noteId" type="hidden">	
		
			<div class="form-group">
				<label for="title">Note Title </label> 
				<input name="title" required
					type="text" class="form-control" 
					id="title"
					aria-describedby="emailHelp"
					 placeholder="Enter here..."
					 value="<%=note.getTitle() %>"
					  />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content </label>
				<textarea name="content" id="content"
					placeholder="Enter your content" class="form-control"
					style="height: 300px"><%=note.getContent() %>
                </textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Notes</button>
			</div>
		</form>
	</div>

</body>
</html>