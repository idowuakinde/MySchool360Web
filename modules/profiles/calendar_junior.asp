<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")	
	v_Class = request.querystring("b")
	'v_Class = left(v_Class,InStr(v_Class,".")-1)		': response.Write(v_Class): response.End()
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MySchool360, powered by Smart Systems</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../inc_functions_js.js" ></script>
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
.style18 {font-size: 14px}
.style22 {font-size: 6px}
</style>
<style type="text/css">
<!--
.excel1 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
}
.excel2 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:700;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:1.0pt solid white;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#B8CCE4;
}
.excel3 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:700;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:1.0pt solid white;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#B8CCE4;
}
.excel5 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#DBE5F1;
}
.excel6 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#DBE5F1;
}
.excel7 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#D8D8D8;
}
.excel8 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#D8D8D8;
}
.excel10 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#FFFF99;
}
.excel11 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#FFFF99;
}
.excel9 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#B8CCE4;
}
.excel12 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#B8CCE4;
}
.excel4 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#DBE5F1;
}
.excel13 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#92D050;
}
.excel14 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#92D050;
}
.excel15 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#B8CCE4;
}
.excel16 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#FFFFCC;
}
.excel17 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#FFFFCC;
}
.excel18 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:general;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#BFBFBF;
}
.excel19 {
padding-top:1px;
padding-right:1px;
padding-left:1px;
color:black;
font-size:11.0pt;
font-weight:400;
font-style:normal;
text-decoration:none;
font-family:Calibri, sans-serif;
text-align:center;
vertical-align:bottom;
border:none;
white-space:nowrap;
border-top:none;
border-right:1.0pt solid white;
border-bottom:1.0pt solid white;
border-left:none;
background:#BFBFBF;
}
-->
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="880"  border="0" class="borderedTableGrey">
  
  <tr>
    <td width="70%" valign="top"><table width="100%" border="0">
      <tr>
        <td align="center" valign="middle">&nbsp;</td>
        <td align="right" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();document.getElementById('btnPrint').style.display = 'none';" /></td>
      </tr>
      <tr>
        <td width="20%" align="center" valign="middle"><img src="../../images/logos/logo.15.jpg" width="107" height="120" border="2" /></td>
        <td align="center" valign="middle" class="pageHeaderStyleAHALL">Childville Schools<br />
          <span class="style18">&nbsp;</span><br />
LAGOS, NIGERIA</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><span class="pageHeaderStyleAHALL"><u>TERM 1 (AUTUMN) CALENDAR (2011-2012)</u></span><br />
      &nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td width="10%">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="10%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="borderedTableGrey"><table width="100%" cellpadding="0" cellspacing="0" class="excel1">
          <col width="64" span="5" style="width:48pt;" />
          <tr style="height:15.75pt;">
            <td class="excel2" width="64" style="height:15.75pt;width:48pt;">EVENTS</td>
            <td class="excel3" width="64" style="width:48pt;">Day</td>
            <td class="excel3" width="64" style="width:48pt;">Date</td>
            <td class="excel3" width="64" style="width:48pt;">Month</td>
            <td class="excel3" width="64" style="width:48pt;">Year</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1<sup>st</sup> Day of Academic Year</td>
            <td class="excel5">Mon</td>
            <td class="excel5">5</td>
            <td class="excel5">Sept</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Afternoon Activities and Swimming classes begin</td>
            <td class="excel5">Mon</td>
            <td class="excel5">12</td>
            <td class="excel5">Sept</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">&ldquo;Meet the Teacher Night&rdquo; from 1500h to 1600h</td>
            <td class="excel5">Thu</td>
            <td class="excel5">22</td>
            <td class="excel5">Sept</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;"> Day</td>
            <td class="excel5">Sun</td>
            <td class="excel5">25</td>
            <td class="excel5">Sept</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Independence Day Assembly @ 10.00am</td>
            <td class="excel5">Fri</td>
            <td class="excel5">30</td>
            <td class="excel5">Sept</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Independence Day Holiday (School Closed)</td>
            <td class="excel5">Mon</td>
            <td class="excel5">3</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Parent Teacher Consultation days</td>
            <td class="excel5">Wed</td>
            <td class="excel5">19</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Classes finish at 12.00pm for Half-Term</td>
            <td class="excel5">Fri</td>
            <td class="excel5">21</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel5">Mon</td>
            <td class="excel5">24</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel5">Tue</td>
            <td class="excel5">25</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel5">Wed</td>
            <td class="excel5">26</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel5">Thu</td>
            <td class="excel5">27</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel5">Fri</td>
            <td class="excel5">28</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">School resumes</td>
            <td class="excel5">Mon</td>
            <td class="excel5">31</td>
            <td class="excel5">Oct</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Christmas concert</td>
            <td class="excel5">Thu</td>
            <td class="excel5">8</td>
            <td class="excel5">Dec</td>
            <td class="excel5">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">End of 1st Term</td>
            <td class="excel5">Fri</td>
            <td class="excel5">9</td>
            <td class="excel5">Dec</td>
            <td class="excel5">2011</td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
</table>
</body>
</html>
