<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" %>
<%@ include file="opendata.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�L�֤��@</title>
<style type="text/css">
<!--
a{
  text-decoration:none;
  }
  a:link{ color:#5F5F5F;} /* �C��*/
  a:hover{ color:#16A3EB;}       /* �̹L���C��  */ 
  a:visted{color:#B3B3B3;}      /*�I��L�᪺�C��*/
-->
</style>
<script type="text/javascript" src="js/register.js" ></script>
<script src="SpryAssets/SpryValidationTextField.css" type="text/javascript"></script>
<script src="SpryAssets/SpryMenuBar.js"type="text/javascript"></script>

<!--
function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
//-->
</script>


<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="cssFiles/register.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">

</script>
</head>

<body class="oneColFixCtrHdr">
<% request.setCharacterEncoding("big5");%> 
<%
  //�ھ�session��user_id�d��users�� ��user_id�����
   String user_id = (String)session.getAttribute("user_id");
   sql="SELECT * FROM users WHERE user_id ='"+user_id+"'";
   rs = stmt.executeQuery(sql);
   
   //�d��user_music
   PreparedStatement music_type=con.prepareStatement("SELECT * FROM user_music WHERE user_id=?");
	music_type.setString(1, user_id);
	ResultSet music;
%>
 
<div id="container">
  <div id="header">
    <div id="apDiv1">  
<table width="316" border="0">
      <tr>
        <td width="138"><input type="text" name="ct2" /></td>
        <td width="82"><select name="mn" class="font10">
          <option value="" selected="selected">�����˯�</option>
          <option value="01">�|��</option>
          <option value="02">�Ч@</option>
          <option value="03">���۰�</option>
        </select></td>        
        <td width="82"><input name="SUBMIT" type="submit" onClick="window.location.replace('�j�M����.html')" value="�j�M"/></td>
      </tr>
    </table></div>
   <table width="880" height="78" border="0" class="font10 style4">
  
  <tr>
   <td height="36" colspan="5" class="tButton" scope="row"><a href="index.jsp"><img src="../image/banner2.jpg" alt="" width="978" height="98" /></a></td>
    </tr>
  <tr>
    <td width="176" height="36" class="MenuBarHorizontal" scope="row"><ul id="MenuBar3" class="MenuBarHorizontal">
      <li><a href="file:///C|/Documents and Settings/BEE/�ୱ/Ai-Music/web/14.1�Q�װ�.html">�Q�װ�</a> </li>
    </ul>    </td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar4" class="MenuBarHorizontal">
      <li><a href="file:///C|/Documents and Settings/BEE/�ୱ/Ai-Music/web/����.html">����</a> </li>
    </ul></td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar1" class="MenuBarHorizontal">
      <li><a class="MenuBarItemSubmenu" href="#">����</a>
  <ul>
            <li><a href="#">�Ч@�q��</a></li>
            <li><a href="#">���۰�</a></li>
          </ul>
      </li>
      </ul>
    </td>
    <td width="176" class="MenuBarHorizontal"><ul id="MenuBar2" class="MenuBarHorizontal">
      <li><a class="MenuBarItemSubmenu" href="#">�Ʀ�]</a>
          <ul>
            <li><a href="#">�|��</a></li>
            <li><a href="#">�Ч@�q��</a></li>
            <li><a href="#">���۰�</a></li>
          </ul>
      </li>
      </ul>
    </td>
    <td width="176" class="MenuBarHorizontal"><div align="center">
            <ul id="MenuBar5" class="MenuBarHorizontal">
             <li><a href="#">�[�J�|��</a> </li>
            </ul>
    </div>  </td>
</tr>
</table>
   <!-- end #header -->
  </div>
<div align="center" class="font10" id="mainContent">
    <table width="857" height="758" border="0">
      <tr class="Tablestyle1">
        <td height="127" align="center" valign="middle"><table width="800" height="66" border="0" class="Tablestyle1">
          <tr>
            <td><p align="center" class="font10 style1 style3">�L�֤��@���Ѥ@�ӯ����A�o���֡B�q�ۡB�Ч@�����x</p>
              <p align="center" class="font10 style1 style3">���A�����֫�Q�βz����Ǽ��X�h</p></td>
          </tr>
      </table>      </tr>
      <tr>
        <td align="center" valign="middle">
       <%
  while(rs.next()){
  %> 
       
        <table width="800" height="523" border="0" cellpadding="0" class="font10 formtype style1"  >
            <tr>
              <td colspan="3" bgcolor="#16A3EB" scope="row" class="style2 "><div align="center" >�|�����U���</div></td>
            </tr>
            
            <tr>
              <td   scope="row">&nbsp;</td>
              <td   scope="row">&nbsp;</td>
              <td   class="font10"></td>
            </tr>
            <tr>
              <td width="7"   scope="row">&nbsp;</td>
              <td width="116"   scope="row"><div align="center">�m�W:</div></td>
              <td width="673"   class="font10"><div align="left">
                  <p align="justify" name="user_name">
                    <%=rs.getString("user_name")%>
                  </p>
              </div></td>
            </tr>
            
            <tr>
              <td   scope="row" align="center">&nbsp;</td>
              <td   scope="row"><div align="center">�|���ʺ�:</div></td>
              <td ><div align="left" name="user_nkname">
                <%=rs.getString("user_nkname")%>
              </div></td>
            </tr>
            
            <tr>
              <td   scope="row">&nbsp;</td>
              <td   scope="row"><div align="center">�b��:</div></td>
              <td ><div align="left" name="user_id">
                  <p>
                    <%=rs.getString("user_id")%>
                  </p>
              </div></td>
            </tr>
            
            <tr>
              <td  scope="row">&nbsp;</td>
              <td  scope="row"><div align="center">�K�X:</div></td>
              <td ><div align="left" name="user_password">
                 <%=rs.getString("user_password")%>
              </div></td>
            </tr>
          
            <tr>
              <td  scope="row">&nbsp;</td>
              <td height="22"  scope="row"><div align="center">�T�{�K�X:</div></td>
              <td><div align="left" name="user_checkpswd">
                 <%=rs.getString("user_checkpswd")%>
              </div></td>
            </tr>
            
            <tr>
              <td   scope="row" align="center">&nbsp;</td>
              <td   scope="row"><div align="center">Email:</div></td>
              <td ><div align="left" name="user_email">
                 <%=rs.getString("user_email")%>
              </div></td>
            </tr>
            
            <tr>
              <td  scope="row" align="center">&nbsp;</td>
              <td  scope="row"><div align="center">�ʧO:</div></td>
              <td ><div align="left" name="user_gen">
              <%=rs.getString("user_gen")%>
                 </div></td>
            </tr>
            
            <tr>
              <td  scope="row" align="center">&nbsp;</td>
              <td  scope="row"><div align="center">�ͤ�:</div></td>
              <td ><p align="left" name="user_birth">
                <%=rs.getString("user_birth")%>
              </p></td>
            </tr>
           
            
            <tr>
              <td   scope="row" align="center">&nbsp;</td>
              <td   scope="row"><div align="center">�~����:</div></td>
              <td ><div align="left" name="user_city">
                <%=rs.getString("user_city")%>
              </div></td>
            </tr>
            
            
            
            <tr>
              <td colspan="3" align="center"  scope="row">&nbsp; </td>
            </tr>
           <tr>  
            <td colspan="3"  scope="row">&nbsp;</td>
            </tr>
          <tr>
            <td  scope="row">&nbsp;</td>
            <td  scope="row"><div align="center">
              <p>���w��������:<br />
                (�i�ƿ�)</p>
              <p>�@�����˭���<br />
                ���ѦҨ̾�</p>
            </div></td>
            <td >
              <div align="left">
                <table width="346" border="0" align="left" class="Tabletype2">
                  <tr>
                    <td ><div align="left">
                        <input name="Rock" type="checkbox" id="Rock" value="1"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("1")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Rock</div></td>
                    <td ><div align="left">
                        <input name="Pop" type="checkbox" id="Pop" value="2"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("2")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Pop</div></td>
                    <td ><div align="left">
                        <input name="Electronic" type="checkbox" id="Electronic" value="3"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("3")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Eletronic </div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Metal" type="checkbox" id="Metal" value="4"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("4")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Metal</div></td>
                    <td><div align="left">
                        <input name="HipHop" type="checkbox" id="HipHop" value="5"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("5")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Hip Hop</div></td>
                    <td><div align="left">
                        <input name="Jazz" type="checkbox" id="Jazz" value="6"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("6")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Jazz</div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Conutry" type="checkbox" id="Country" value="7"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("7")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Country</div></td>
                    <td><div align="left">
                        <input name="Folk" type="checkbox" id="Folk" value="8"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("8")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                        <span class="style4 Tabletype2">Folk</span></div></td>
                    <td><div align="left"><span class="style4 Tabletype2">
                        <input name="Classical" type="checkbox" id="Classical" value="9"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("9")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                      Classical</span></div></td>
                  </tr>
                  <tr>
                    <td><div align="left">
                        <input name="Dance" type="checkbox" id="Dance" value="10"<%
						music = music_type.executeQuery();
					while(music.next()){
					if(music.getString("music_id").equals("10")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                        <span class="style4 Tabletype2">Dance</span>                    </div></td>
                    <td><div align="left"></div></td>
                    <td><div align="left"></div></td>
                  </tr>
                </table>
              </div>              </td>
          </tr>
          <tr>
            <td  scope="row">&nbsp;</td>
            <td  scope="row">&nbsp;</td>
            <td ></td>
          </tr>
          <tr>
            <td  scope="row">&nbsp;</td>
            <td  scope="row">&nbsp;</td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3"  scope="row"><table width="800" border="0">
                <tr>
                  <td width="800" ><hr size="1" color="#B1D2F3"/></td>
                </tr>
                <tr>
                  <td><div align="center">
                      <input type="button"  value="�T�{" onClick="location.href('index.jsp')"/>
                    &nbsp;
                   
                    <input type="button" value="�^�W�@��" onClick="window.history.back()"/>
                  </div></td>
                </tr>
            </table></td>
          </tr>
        </table>
      
        <input type="hidden" name="MM_insert" value="form1" />
</form>
</td>
      </tr>
    </table>
  </div>
 <%
 }
  rs.close();
stmt.close();

con.close();
%>


<p align="center" class="style2">�L�֤��@-�W�߭��ֺ� Inc 2009</p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<script type="text/javascript">
<!--
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"../SpryAssets/SpryMenuBarDownHover.gif", imgRight:"../SpryAssets/SpryMenuBarRightHover.gif"});
var MenuBar2 = new Spry.Widget.MenuBar("MenuBar2", {imgDown:"../SpryAssets/SpryMenuBarDownHover.gif", imgRight:"../SpryAssets/SpryMenuBarRightHover.gif"});
//-->
</script>
</body>
</html>

