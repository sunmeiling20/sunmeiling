<%@ page import="java.sql.*,javax.sql.DataSource,javax.naming.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>  
<%


	
Context context=new InitialContext();
Context envContext=(Context)context.lookup("java:/comp/env");//jee标准
DataSource dataSource=(DataSource)envContext.lookup("jdbc/test");


Connection conn=dataSource.getConnection();
	//创建查询
	String number=request.getParameter("number");
	String model=request.getParameter("model");
	String topwood=request.getParameter("topwood");
	String backwood=request.getParameter("backwood");
	String type=request.getParameter("type");
	String builder=request.getParameter("builder");
	//int cprice = Integer.parseInt(price);
	//int cnumber = Integer.parseInt(number);
	String price=request.getParameter("price");

	PreparedStatement stmt=conn.prepareStatement("insert into guitar values(?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	stmt.setString(1,number);
	stmt.setString(2,builder);
	stmt.setString(3,model);
	stmt.setString(4,type);
	stmt.setString(5,price);
	stmt.setString(6,topwood);
	stmt.setString(7,backwood);
	
	
	ResultSet rs= stmt.executeQuery();
	
	stmt.close();
	conn.close();
	out.print("<h1>添加成功</h1>");
	
%>

</body>
</html>