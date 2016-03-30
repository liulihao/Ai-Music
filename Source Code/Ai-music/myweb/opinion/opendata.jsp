<%
  Class.forName("org.gjt.mm.mysql.Driver");
  String url="jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=big5";
  Connection con=DriverManager.getConnection(url,"root","prott");
  Statement stmt=con.createStatement();
  ResultSet rs;
  String sql;
 %>
 