<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc"></script>
<script>
	tinymce
			.init({
				selector : 'textarea',
				height : 500,
				theme : 'modern',
				plugins : 'print preview fullpage powerpaste searchreplace autolink directionality advcode visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount tinymcespellchecker a11ychecker imagetools mediaembed  linkchecker contextmenu colorpicker textpattern help',
				toolbar1 : 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
				image_advtab : true,
				branding: false,
				templates : [ {
					title : 'Test template 1',
					content : 'Test 1'
				}, {
					title : 'Test template 2',
					content : 'Test 2'
				} ],
				content_css : [
						'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
						'//www.tinymce.com/css/codepen.min.css' ]
			});
</script>
<title></title>
</head>
<body>
	<%
		String name = null;
		try {
			String html = "";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
			String doc_id = request.getParameter("id").toString();
			String user_id = request.getSession().getAttribute("user_id").toString();
			PreparedStatement ps = con.prepareStatement("select * from document where id=? and user_id=?");
			ps.setString(1, doc_id);
			ps.setString(2, user_id);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
	%>
	<%
		html = rs.getString("code");
	%>
	<textarea><%=html%></textarea>
	<%
		}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>