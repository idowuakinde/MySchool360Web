<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<%
	pictureCount = 21
	Randomize
 	rndPicture = Int((pictureCount * Rnd) + 1)
%>
<%	
	schoolId = request.querystring("b")
		
	Dim rstSchoolTheme
	Dim rstSchoolTheme_numRows
	
	Set rstSchoolTheme = Server.CreateObject("ADODB.Recordset")
	rstSchoolTheme.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSchoolTheme.Source = "SELECT SchoolId, SchoolAbbr, SchoolName, ExtensionField1 FROM dbo.Core_School WHERE SchoolId = " & CINT(schoolId) & ""
	rstSchoolTheme.CursorType = 0
	rstSchoolTheme.CursorLocation = 2
	rstSchoolTheme.LockType = 1
	rstSchoolTheme.Open()
	
	rstSchoolTheme_numRows = 0
%>
<%
	Dim rstAnnouncements
	Dim rstAnnouncements_numRows
	
	Set rstAnnouncements = Server.CreateObject("ADODB.Recordset")
	rstAnnouncements.ActiveConnection = MM_cnnSmartSchool_STRING
	rstAnnouncements.Source = "SELECT AnnouncementId, DatePublished, Message FROM dbo.TEMPAnnouncements WHERE Expired = 'N'"
	rstAnnouncements.CursorType = 0
	rstAnnouncements.CursorLocation = 2
	rstAnnouncements.LockType = 1
	rstAnnouncements.Open()
	
	rstAnnouncements_numRows = 0
%>
<%
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstAnnouncements_numRows = rstAnnouncements_numRows + Repeat1__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
.style17 {
	font-size: 12px;
	font-weight: bold;
	color: #ffffff;
}
</style>

<script language="JavaScript">
<!--

//Top Nav Bar I v2.1- By Constantin Kuznetsov Jr.
//Modified by Dynamic Drive for various improvements
//Visit http://www.dynamicdrive.com for this script

var keepstatic=1 //specify whether menu should stay static (works only in IE4+)
var menucolor="#BEC9DB" //specify menu color
var submenuwidth=200 //specify sub menus' width

var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbar=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<script language="JavaScript" src="menu.js"></script>
<script language="JavaScript" src="menucontext.js"></script>
<script language="JavaScript">
//showToolbar();
</script>
<script language="JavaScript">
function UpdateIt(){
if (ie&&keepstatic&&!opr6)
document.all["MainTable"].style.top = document.body.scrollTop;
setTimeout("UpdateIt()", 200);
}
UpdateIt();
// Comma separated list of images to rotate
var imgs = new Array('images/rotate/1.jpg','images/rotate/2.jpg','images/rotate/3.jpg','images/rotate/4.jpg','images/rotate/5.jpg','images/rotate/6.jpg','images/rotate/7.jpg','images/rotate/8.jpg','images/rotate/9.jpg','images/rotate/10.jpg','images/rotate/11.jpg','images/rotate/12.jpg');
// delay in milliseconds between image swaps 1000 = 1 second
var delay = 5000;
var counter = 0;

function preloadImgs(){
  for(var i=0;i<imgs.length;i++){
    MM_preloadImages(imgs[i]);
  }
}

function randomImages(){
  if(counter == (imgs.length)){
    counter = 0;
  }
  MM_swapImage('rotator', '', imgs[counter++]);
  setTimeout('randomImages()', delay);
}
</script>

<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: Welcome to the <%= rstSchoolTheme("SchoolName") %> Online Portal</span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      <tr>
        <td width="45%" rowspan="4" align="center" valign="top">
          <table width="307"  border="0">
            <tr>
              <td width="301" align="center"><img src="images/rotate/<%= rndPicture %>.jpg" border="10" width="400" /></td>
            </tr>
        </table></td>
        <td valign="top"> <p><br />
          The <strong>MySchool360</strong> portal enables you to:</p>
          <ul>
            <li><strong><a href="#"><font color="<%= rstSchoolTheme("ExtensionField1") %>">Practise systematic administration within your school</font></a></strong>.<br />
Getting everyone (your students and staff alike) to use this portal, you will be able to inculcate a work and learning culture that promotes efficiency and transparency for all.<br />
&nbsp; </li>
            <li><strong><a href="#"><font color="<%= rstSchoolTheme("ExtensionField1") %>">Communicate more effectively!</font></a></strong><br />
              You can leverage the power of 21st-Century Information Technologies to better communicate with fellow staff as well as with students and their parents.<br />
  &nbsp;</li>
            <li><strong><a href="#"><font color="<%= rstSchoolTheme("ExtensionField1") %>">Prepare exam scores for students and parents in the shortest possible time</font></a></strong>.<br />
You can input exam scores for your students via this portal and make them available in the shortest possible time. You just enter the scores, and the portal engine will do the analysis and charting for you as well as for the students. <br />
&nbsp;</li>
            <li><strong><a href="#"><font color="<%= rstSchoolTheme("ExtensionField1") %>">Enjoy improved administration tools.</font></a></strong><br />
              This portal provides you with dynamic and robust administration tools that cover every aspect of administering your school. Examples are:
                <ul>
                  <li>School Revenue-Monitoring tools</li>
                  <li> Results-Entry and Publishing tools</li>
                  <li>Student Profile Management tools</li>
                  <li>Staff Profile Management tools</li>
                  <li>Accounting &amp; Finance Management tools,</li>
                  <li>Human Resource Management tools,</li>
                  <li>etc.</li>
                </ul>
            </li>
          </ul>          </td>
      </tr>
      <tr>
        <td valign="top" bgcolor="<%= rstSchoolTheme("ExtensionField1") %>"><span class="style17">Announcements from the Head of School</span></td>
      </tr>
      <tr bgcolor=''>
        <td align="left" valign="top"><table width="100%" border="0">
          <tr>
            <td width="50" align="right" valign="top" class="borderedTableGrey"><strong>S/N</strong></td>
            <td width="150" valign="top" class="borderedTableGrey"><strong>Date</strong></td>
            <td valign="top" class="borderedTableGrey"><strong>Title</strong></td>
          </tr>
<% 	
	if rstAnnouncements.EOF AND rstAnnouncements.BOF then
%>
           <tr>
            <td align="right" valign="top" class="borderedTableGrey">&nbsp;</td>
            <td colspan="2" valign="top" class="borderedTableGrey">No data. </td>
            </tr>
<%  
	end if
%>			
          <% 
		  	SN = 0
While ((Repeat1__numRows <> 0) AND (NOT rstAnnouncements.EOF)) 
			SN = SN + 1
%>
            <tr>
              <td align="right" valign="top" class="borderedTableGrey"><%= SN %></td>
              <td valign="top" class="borderedTableGrey"><%= FormatDateTime(rstAnnouncements("DatePublished"),1) %></td>
              <td valign="top" class="borderedTableGrey"><%= rstAnnouncements("Message") %></td>
            </tr>
            <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rstAnnouncements.MoveNext()
Wend
%>

        </table></td>
      </tr>
      
      <tr>
        <td valign="top">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
	rstAnnouncements.Close()
	Set rstAnnouncements = Nothing
%>
<% 	
	rstSchoolTheme.Close()
	Set rstSchoolTheme = Nothing
 %>