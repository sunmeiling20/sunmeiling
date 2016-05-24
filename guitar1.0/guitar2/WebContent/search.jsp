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
String backwood=request.getParameter("backwood");
String topwood=request.getParameter("topwood");
String type=request.getParameter("type");
String model=request.getParameter("model");

//创建查询

PreparedStatement stmt=conn.prepareStatement("select * from user where backwood=? AND backwood=?AND type=? AND model=?");
stmt.setString(1,backwood);
stmt.setString(2,topwood);
stmt.setString(3,type);
stmt.setString(4,model);
	
	ResultSet rs= stmt.executeQuery();
	//遍历查询
	out.println("查询结果为:");
	if(rs.next()){
		String number=rs.getString("number");
		
		String price=rs.getString("price");
		String builder=rs.getString("builder");
		
		out.println("此种吉他的型号是"+number+"");
				
		
		
	}
	else{
		out.print("不存在此种吉他");
		
	}
		

	
	stmt.close();
	conn.close();
	
  
%>


</body>
</html>
