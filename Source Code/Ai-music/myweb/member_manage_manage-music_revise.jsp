<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>修改音樂資料</title>
<!--標籤面板-->
<script src="../SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="js/member_manage.js" type="text/javascript"></script>
<script src="js/prototype.js"type="text/javascript"></script>
<script language='javascript'>
function changeMenuFMGS(id){
	objDaughter=document.getElementById('iDMenu'+id);
	if (objDaughter.style.display=='none'){
		objDaughter.style.display='block';
	} else {
		if(objDaughter.style.display=='block'){
			objDaughter.style.display='none'; 
		} 
	} 
}

</script>
<!--這裡用的css-->

<link href="../CSSfile/member_manage.css" rel="stylesheet" type="text/css" />
</head>
<%
 String track_id=request.getParameter("music_id");//歌曲的編號
 String login_user=(String)session.getAttribute("user_id");
 Statement track=con.createStatement();//抓歌曲資料
 String track_sql="SELECT *, REPLACE(track_intro, '<br>', '') AS change_track_intro, REPLACE(track_lyrics, '<br>', '') AS change_track_lyrics FROM track WHERE track_id='"+track_id+"'";
 ResultSet track_data;
 track_data=track.executeQuery(track_sql);
 while(track_data.next()){
  String user_id=track_data.getString("user_id");//抓登入的使用者資料
  int db_classify_id=track_data.getInt("classify_id");//抓資料庫音樂分類編號
 
 Statement user=con.createStatement();
 String user_sql="select * from users where user_id='"+login_user+"'";
 ResultSet user_data;
 user_data=user.executeQuery(user_sql);

 %>
<body vlink="#5F5F5F" class="oneColFixCtrHdr" >
<div id="header">
  <div style="padding-left:30px" align="left"><a href="index.jsp">
    <div style="width:320px" class="info_index"><img src="../music3.jpg" width="320" /> <span class="font10">回首頁</span> </div>
    </a>
      <%
	if (login_user == null)
	{
%>
      <div class="font10" style="position:absolute; left: 924px; top: 19px; width: 34px; height: 14px;"><a href="#" onclick="openConfirm()">登入</a></div>
    <%
	}
	else
	{
%>
      <!--<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a> <span >我要檢舉</span> </div>-->
    <div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> <span>我的空間</span> </div>
    <div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
    <div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a> <span>我的管理頁面</span> </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a> <span>登出</span> </div>
    <%
	}
%>
      <form action="search_website.jsp" method="post" name="search_form" id="search_form" onsubmit="return check_search()">
        <div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search"> <span class="font10 style4">請輸入搜尋字串</span>
            <table width="290" border="0">
              <tr>
                <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style" /></td>
                <td width="82"><select name="search_type" id="search_type" class="font10 search-style">
                    <option value="song_name" selected="selected">歌名</option>
                    <option value="member_name">會員</option>
                </select></td>
                <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
              </tr>
            </table>
        </div>
      </form>
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar link" >
    <table width="972">
      <tr>
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=login_user%>">個人空間</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=login_user%>">最新訊息</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=login_user%>">音樂作品</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=login_user%>"> 音樂收藏 </a></td>
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=login_user%>">我的朋友</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=login_user%>">留言版</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container"  align="left">
<!--會員標頭-->
<div id="showid" class="font10 style4" align="left"><a href="member_manage.jsp">我的管理中心</a> <span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理 </a><span class="style12">&gt;&nbsp;</span>修改音樂資料</div>




<!---------------------bigleft--------------------->
<div id="bigleft"  align="left">
  <div class="font10 grayblock roundedTopCorners">
    <div class="style2 roundedTopCorners  title" >我的管理中心</div>
    <div class="bigleft-content style4 pointer color" ><span class="style12">&gt;&nbsp;</span><a href="member_manage.jsp">個人資料管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_interactive.jsp">音樂收藏管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_friends.jsp">好友管理</a></div>
  </div>
  <div class="font10 grayblock roundedTopCorners" style="margin-top:50px">
    <div class="style2 roundedTopCorners title" >音樂管理</div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_manage-music.jsp">音樂作品管理</a></div>
    <div class="bigleft-content style4 pointer"><span class="style12">&gt;&nbsp;</span><a href="member_manage_classified.jsp">管理自定分類</a></div>
  </div>
  <!--end of bigleft-->
</div>
<!---------------------bigright--------------------->
<div  id="bigright" class="font10" align="left">
  <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <li class="TabbedPanelsTab" tabindex="0">修改音樂資料</li>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <div class="TabbedPanelsContent"><div class="space">
          <div class="table-padding">   
          <form action="manage_music_basic_update.jsp" name="music_basic_update" method="post" enctype="multipart/form-data" onsubmit="return music_revise_check()">
            <table width="622" border="0" class="style4">
              <tr>
                <td  height="20" align="right"><span class="col-padding btm10px">歌曲名稱</span></td>
                <td colspan="3"><span class="btm10px">
                  <input type="text" name="track_name" id="track_name" value="<%=track_data.getString("track_name")%>" class="input-style" />
                </span></td>
              </tr>
              <tr>
                <td  height="20" align="right"><span class="col-padding minwidth">圖片</span></td>
                <td colspan="3"><span style="margin-bottom:10px">
    			<div style="border:1px solid #E5E5E5;width:100px;margin-top:20px"><img src="user/<%=login_user%>/music/<%=track_data.getString("track_pic")%>" alt="" width="100" height="100"/></div>
    			</span></td>
              </tr>
              <tr>
                <td  height="20" align="right">&nbsp;</td>
                <td colspan="3"><input type="button" onclick="document.getElementById('pic').style.display='block'" value="變更圖片" class="save-block style4"/></td>
              </tr>
              <tr>
                <input type="hidden" name="track_id" value="<%=track_data.getInt("track_id")%>" />
                <!--隱藏音樂編號-->
                <td width="73"  height="20" align="right">&nbsp;</td>
                <td colspan="3"><div class="btm10px">
                    <input id="pic" type="file" name="track_pic" style="display:none" />
                    <input id="pic_text" type="text" name="track_pic" value="<%=track_id%>" style="display:none" />
                ※上傳圖片檔案大小不得超過<span style="color:#ff091a"><b>1MB</b></span>;檔案名稱須為<span style="color:#ff091a"><b>英文檔名</b></span>。</div></td>
              </tr>
              <tr>
                <td align="right" ><div class="col-padding" style="margin-bottom:5px;margin-top:10px">演唱類型</div></td>
                <td colspan="3"><div class="btm10px" style="margin-top:10px">
                    <select name="sing_type" class="font10 input-style">
                      <option value="1" <%
					if(track_data.getInt("sing_type")==1){
						out.print("selected");
						}
					%>
                    >創作</option>
                      <option value="2" <%
					if(track_data.getInt("sing_type")==2){
						out.print("selected");
						}
					%>
                  >翻唱</option>
                    </select>
                </div></td>
              </tr>
              <%
		  	Statement classified=con.createStatement(); //從自定分類表格讀分類名稱出來
			String classified_sql="select * from user_track_classify where user_id='"+login_user+"'";
			ResultSet classified_data;
 			classified_data=classified.executeQuery(classified_sql);
			
		%>
              <tr>
                <td height="22" align="right" ><div class="col-padding btm10px">自定分類</div></td>
                <td colspan="3"><div class="btm10px">
                    <select name="classified" class="font10 input-style">
                      <option value="0">不分類</option>
                      <%
				  while(classified_data.next()){
				  int classify_id=classified_data.getInt("classify_id");
			      String classify_name=classified_data.getString("classify_name");
			      %>
                      <option value="<%=classify_id%>" 
					<%if(db_classify_id==classify_id){
					//把track中存的classify_id(line37)與user_track_classify(line125)做比較 若相等就選他為預定欄位
					   out.print("selected");
					 }
					%>
                    ><%=classify_name%></option>
                      <%}%>
                    </select>
                </div></td>
              </tr>
              <%
			  //讀取選的語言
             PreparedStatement language=con.prepareStatement("SELECT * FROM track WHERE track_id=?");
	         language.setString(1,track_id);
	         ResultSet language_type;
			  %>
              <tr>
                <td height="23" align="right" ><div class="col-padding" style="margin:10px 0">語言</div></td>
                <td colspan="3"><div style="margin:10px 0">
				<input name="language" type="radio" class="style4" id="radio" value="1" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("1")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                國語
                <input type="radio" name="language" id="radio2" value="2" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("2")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                台語
                <input type="radio" name="language" id="radio3" value="3" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("3")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                客家
                <input type="radio" name="language" id="radio4" value="4" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("4")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                演奏
                <input type="radio" name="language" id="radio5" value="5" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("5")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                英語
                <input type="radio" name="language" id="radio6" value="6" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("6")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                日語
                <input type="radio" name="language" id="radio7" value="7" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("7")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                其他
                <input name="others_text" class="input-style" type="text" size="3" value="<%
						language_type = language.executeQuery();
					while(language_type.next()){
					if(language_type.getString("track_language_id").equals("7")){
					    String track_language_other=language_type.getString("track_language_other");
					    out.print(track_language_other);
						}
					}
				%>"/>
                <input type="radio" name="language" id="radio8" value="8" <%
				language_type = language.executeQuery();
				while(language_type.next()){
					if(language_type.getString("track_language_id").equals("8")){
						out.print("checked=\"checked\"");
					}
				}
				%>/>
                未定義</div></td>
              </tr>
              <%
			   //讀取選的語言 end
			  %>
              <%
			  //讀取選的風格
   PreparedStatement track_type=con.prepareStatement("SELECT * FROM track_type WHERE track_id=?");
	track_type.setString(1,track_id);
	ResultSet track_genre;
			  %>
              <tr>
                <td align="right" ><div class="col-padding" style="margin-bottom:5px;">風格</div></td>
                <td colspan="3"><div class="col-padding" style="margin-bottom:5px;">至多勾選<span class="style9">3</span>項</div></td>
              </tr>
              <tr>
                <td align="right" >&nbsp;</td>
                <td width="168"><span style="margin-top:10px;">
                  <input name="Rock" type="checkbox" id="Rock" value="1" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("1")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  搖滾(Rock)</span></td>
                <td width="168"><input name="Pop" type="checkbox" id="Pop" value="2" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("2")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  流行(Pop)</td>
                <td width="195"><input name="Electronic" type="checkbox" id="Electronic" value="3" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("3")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  電子(Electronic)</td>
              </tr>
              <tr>
                <td align="right" class="col-padding"></td>
                <td><input name="Metal" type="checkbox" id="Metal" value="4" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("4")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  金屬(Metal) </td>
                <td><input name="HipHop" type="checkbox" id="HipHop" value="5" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("5")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  饒舌(Hip Hop) </td>
                <td><input name="Jazz" type="checkbox" id="Jazz" value="6" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("6")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  爵士(Jazz)</td>
              </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td><input name="Conutry" type="checkbox" id="Country" value="7" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("7")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  鄉村(Country) </td>
                <td><input name="Folk" type="checkbox" id="Folk" value="8" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("8")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  民謠(Folk)</td>
                <td><input name="Classical" type="checkbox" id="Classical" value="9" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("9")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  經典(Classical)</td>
              </tr>
              <tr>
                <td align="right"><div style="margin-bottom:25px"></div></td>
                <td><div style="margin-bottom:25px">
                    <input name="Dance" type="checkbox" id="Dance" value="10" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("10")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  舞曲(Dance) </div></td>
                <td><div style="margin-bottom:25px">
                    <input name="RnB" type="checkbox" id="RnB" value="11" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("11")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  R&amp;B </div></td>
                <td><div style="margin-bottom:25px">
                    <input name="undefined" type="checkbox" id="undefined" value="12" <%
						track_genre = track_type.executeQuery();
					while(track_genre.next()){
					if(track_genre.getString("music_id").equals("12")){
						out.print("checked=\"checked\"");
						}
					}
				%>/>
                  無法定義 </div></td>
              </tr>
              <%
			  //讀取選的風格
			  
			  %>
              <tr>
                <td align="right" ><div class="col-padding btm10px">演唱人</div></td>
                <td colspan="3"><div class="btm10px">
                    <input name="track_singer" type="text" value="<%=track_data.getString("track_singer")%>" class="input-style"/>
                  &nbsp;&nbsp;作詞人 &nbsp;&nbsp;
                  <input name="track_lyricist" type="text" value="<%=track_data.getString("track_lyricist")%>" class="input-style"/>
                </div></td>
              </tr>
              <tr>
                <td align="right" ><div class="col-padding btm10px">作曲人</div></td>
                <td colspan="3"><div class="btm10px">
                    <input name="track_composer" type="text" value="<%=track_data.getString("track_composer")%>" class="input-style"/>
                  &nbsp;&nbsp;編曲人 &nbsp;&nbsp;
                  <input name="track_arranger" type="text" value="<%=track_data.getString("track_arranger")%>" class="input-style"/>
                </div></td>
              </tr>
              <tr>
                <td align="right" ><div class="col-padding btm10px">收錄專輯</div></td>
                <td colspan="3"><div class="btm10px">
                    <input name="track_album" type="text" value="<%=track_data.getString("track_album")%>" class="input-style"/>
                  &nbsp;&nbsp;版權所有&nbsp;
                  <input name="track_right" type="text" value="<%=track_data.getString("track_right")%>" class="input-style"/>
                </div></td>
              </tr>
              <tr >
                <td align="right">&nbsp;</td>
                <td colspan="3" >&nbsp;</td>
              </tr>
              <tr >
                <td align="right"><div class="col-padding btm10px">歌曲簡介</div></td>
                <td colspan="3" ><div class="btm10px style11">(限<span class="style9">1000</span>中文字以內)</div></td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td colspan="3" ><textarea name="track_intro" cols="55" rows="8" class="input-style"><%=track_data.getString("change_track_intro")%></textarea></td>
              </tr>
              <tr >
                <td align="right" >&nbsp;</td>
                <td colspan="3" >&nbsp;</td>
              </tr>
              <tr >
                <td align="right" ><div class="col-padding btm10px">歌詞</div></td>
                <td colspan="3" ><div class="btm10px"><span class="btm10px style11">(限<span class="style9">1000</span>中文字以內)</span></div></td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td colspan="3" ><textarea name="track_lyrics" cols="55" rows="8" class="input-style"><%=track_data.getString("change_track_lyrics")%></textarea></td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td colspan="3" >&nbsp;</td>
              </tr>
              <tr >
                <td align="right" class="col-padding minwidth">&nbsp;</td>
                <td colspan="3"><div><input type="submit" class="save-block" style="float:left" value="完成"/> <input type="button" class="save-block" style="float:left" onclick="history.back();" value="回上一頁" /></div></td>
              </tr>
            </table>
          </form>
          </div>
          <%
    }//track_data
    track_data.close();
	track.close();	
	
%>
          <!--end of 包起來的padding-->
        </div></div>
    </div>
  </div>
</div>

  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>


<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>
</body>
</html>
