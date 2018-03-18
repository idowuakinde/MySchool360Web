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
    <td align="center" valign="top"><span class="pageHeaderStyleAHALL"><u>TERM 1 CALENDAR (2011-2012)</u></span><br />&nbsp;&nbsp;</td>
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
            <td class="excel5" style="height:15.75pt;">End    of Ramadan</td>
            <td class="excel6">Sun</td>
            <td class="excel6">28</td>
            <td class="excel6">Aug</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">All    Staff Resume</td>
            <td class="excel8">Mon</td>
            <td class="excel8">29</td>
            <td class="excel8">Aug</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Muslim    Holiday</td>
            <td class="excel8">Tue</td>
            <td class="excel8">30</td>
            <td class="excel8">Aug</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Muslim    Holiday</td>
            <td class="excel8">Wed</td>
            <td class="excel8">31</td>
            <td class="excel8">Aug</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Teacher's    Training Day</td>
            <td class="excel8">Thu</td>
            <td class="excel8">1</td>
            <td class="excel8">Sept</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Teacher's    Training Day</td>
            <td class="excel8">Fri</td>
            <td class="excel8">2</td>
            <td class="excel8">Sept</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Arrival    of New Boarders</td>
            <td class="excel11">Sat</td>
            <td class="excel11">3</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Whole    Boarders Return</td>
            <td class="excel11">Sun</td>
            <td class="excel11">4</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Whole    School Resume/Yr 7 Orientation</td>
            <td class="excel11">Mon</td>
            <td class="excel11">5</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">6</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Wed</td>
            <td class="excel6">7</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Co-curricular    activities begins</td>
            <td class="excel11">Thu</td>
            <td class="excel11">8</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">9</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Parents    Forum KS 3&amp;4</td>
            <td class="excel11">Sat</td>
            <td class="excel11">10</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Happy    Sunday</td>
            <td class="excel6">Sun</td>
            <td class="excel6">11</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Nomination    of SRC members</td>
            <td class="excel11">Mon</td>
            <td class="excel11">12</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Election    of SRC executives</td>
            <td class="excel11">Tue</td>
            <td class="excel11">13</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">14</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Thu</td>
            <td class="excel6">15</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Fri</td>
            <td class="excel12">16</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">17</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">18</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Prefects    / SRC Executive Induction</td>
            <td class="excel11">Mon</td>
            <td class="excel11">19</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">20</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Wed</td>
            <td class="excel6">21</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Thu</td>
            <td class="excel12">22</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">23</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Leadership    Training for Prefects/SRC</td>
            <td class="excel11">Sat</td>
            <td class="excel11">24</td>
            <td class="excel11">Sept</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Visiting    Day</td>
            <td class="excel6">Sun</td>
            <td class="excel6">25</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Mon</td>
            <td class="excel12">26</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Tue</td>
            <td class="excel6">27</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">28</td>
            <td class="excel12">Sept</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Thu</td>
            <td class="excel6">29</td>
            <td class="excel6">Sept</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel13" style="height:15.75pt;">National    Day Celebration</td>
            <td class="excel14">Fri</td>
            <td class="excel14">30</td>
            <td class="excel14">Sept</td>
            <td class="excel14">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel13" style="height:15.75pt;">National    Day/Independent walk</td>
            <td class="excel14">Sat</td>
            <td class="excel14">1</td>
            <td class="excel14">Oct</td>
            <td class="excel14">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">2</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel13" style="height:15.75pt;">National    Day -Public Holiday</td>
            <td class="excel14">Mon</td>
            <td class="excel14">3</td>
            <td class="excel14">Oct</td>
            <td class="excel14">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">4</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Wed</td>
            <td class="excel6">5</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Year    11 Parents Forum</td>
            <td class="excel11">Thu</td>
            <td class="excel11">6</td>
            <td class="excel11">Oct</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">7</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">Inter    School swimming competition&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">8</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Happy    Sunday</td>
            <td class="excel6">Sun</td>
            <td class="excel6">9</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Mid    term Assessment Test</td>
            <td class="excel8">Mon</td>
            <td class="excel8">10</td>
            <td class="excel8">Oct</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Mid    term Assessment Test</td>
            <td class="excel8">Tue</td>
            <td class="excel8">11</td>
            <td class="excel8">Oct</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Mid    term Assessment Test</td>
            <td class="excel8">Wed</td>
            <td class="excel8">12</td>
            <td class="excel8">Oct</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Mid    term Assessment Test</td>
            <td class="excel8">Thu</td>
            <td class="excel8">13</td>
            <td class="excel8">Oct</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Mid    term Assessment Test</td>
            <td class="excel8">Fri</td>
            <td class="excel8">14</td>
            <td class="excel8">Oct</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Dads    and Daughters Seminar</td>
            <td class="excel11">Sat</td>
            <td class="excel11">15</td>
            <td class="excel11">Oct</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">16</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Trip    to Botanical Gardens Yr 8 &amp; 9</td>
            <td class="excel6">Mon</td>
            <td class="excel6">17</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">18</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel16" style="height:15.75pt;">Collection    of draft report</td>
            <td class="excel17">Wed</td>
            <td class="excel17">19</td>
            <td class="excel17">Oct</td>
            <td class="excel17">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Thu</td>
            <td class="excel12">20</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel16" style="height:15.75pt;">Collection    of mid term Reports</td>
            <td class="excel17">Fri</td>
            <td class="excel17">21</td>
            <td class="excel17">Oct</td>
            <td class="excel17">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">22</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Visiting    Day</td>
            <td class="excel6">Sun</td>
            <td class="excel6">23</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel19">Mon</td>
            <td class="excel19">24</td>
            <td class="excel19">Oct</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel19">Tue</td>
            <td class="excel19">25</td>
            <td class="excel19">Oct</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel19">Wed</td>
            <td class="excel19">26</td>
            <td class="excel19">Oct</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel19">Thu</td>
            <td class="excel19">27</td>
            <td class="excel19">Oct</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Mid    Term Break</td>
            <td class="excel19">Fri</td>
            <td class="excel19">28</td>
            <td class="excel19">Oct</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">29</td>
            <td class="excel6">Oct</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">30</td>
            <td class="excel12">Oct</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">2nd    Half Begins</td>
            <td class="excel11">Mon</td>
            <td class="excel11">31</td>
            <td class="excel11">Oct</td>
            <td class="excel11">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">1</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Teacher's    Training Day</td>
            <td class="excel19">Wed</td>
            <td class="excel19">2</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Thu</td>
            <td class="excel12">3</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">4</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">5</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sun</td>
            <td class="excel6">6</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">ID-EL    FITRI Muslim holiday</td>
            <td class="excel12">Mon</td>
            <td class="excel12">7</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">ID-EL    FITRI Muslim holiday</td>
            <td class="excel6">Tue</td>
            <td class="excel6">8</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">9</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Thu</td>
            <td class="excel6">10</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Fri</td>
            <td class="excel12">11</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">12</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">Happy    Sunday</td>
            <td class="excel12">Sun</td>
            <td class="excel12">13</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Anti    Bullying Week</td>
            <td class="excel19">Mon</td>
            <td class="excel19">14</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Anti    Bullying Week</td>
            <td class="excel19">Tue</td>
            <td class="excel19">15</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Anti    Bullying Week</td>
            <td class="excel19">Wed</td>
            <td class="excel19">16</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Anti    Bullying Week</td>
            <td class="excel19">Thu</td>
            <td class="excel19">17</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel18" style="height:15.75pt;">Anti    Bullying Week</td>
            <td class="excel19">Fri</td>
            <td class="excel19">18</td>
            <td class="excel19">Nov</td>
            <td class="excel19">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">19</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sun</td>
            <td class="excel6">20</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel12">Mon</td>
            <td class="excel12">21</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1st    Term Examination</td>
            <td class="excel6">Tue</td>
            <td class="excel6">22</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">23</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel6">Thu</td>
            <td class="excel6">24</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel12">Fri</td>
            <td class="excel12">25</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">26</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">Boarders    Visiting Day</td>
            <td class="excel12">Sun</td>
            <td class="excel12">27</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel6">Mon</td>
            <td class="excel6">28</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">29</td>
            <td class="excel12">Nov</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel6">Wed</td>
            <td class="excel6">30</td>
            <td class="excel6">Nov</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel15" style="height:15.75pt;">1st    Term Examination&nbsp;</td>
            <td class="excel12">Thu</td>
            <td class="excel12">1</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">1st    Term Examination Ends&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">2</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">3</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Visiting    Day</td>
            <td class="excel6">Sun</td>
            <td class="excel6">4</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Mon</td>
            <td class="excel12">5</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Tue</td>
            <td class="excel6">6</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">7</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Co-curricular    Day</td>
            <td class="excel6">Thu</td>
            <td class="excel6">8</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Fri</td>
            <td class="excel12">9</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">10</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">11</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel5" style="height:15.75pt;">Christmas    Carol Concert</td>
            <td class="excel6">Mon</td>
            <td class="excel6">12</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">13</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel10" style="height:15.75pt;">Parents    Consultation / End of Term</td>
            <td class="excel6">Wed</td>
            <td class="excel6">14</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Staff    only day</td>
            <td class="excel8">Thu</td>
            <td class="excel8">15</td>
            <td class="excel8">Dec</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel7" style="height:15.75pt;">Staff    only day</td>
            <td class="excel8">Fri</td>
            <td class="excel8">16</td>
            <td class="excel8">Dec</td>
            <td class="excel8">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">17</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sun</td>
            <td class="excel6">18</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Mon</td>
            <td class="excel12">19</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Tue</td>
            <td class="excel6">20</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Wed</td>
            <td class="excel12">21</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Thu</td>
            <td class="excel6">22</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Fri</td>
            <td class="excel12">23</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Sat</td>
            <td class="excel6">24</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sun</td>
            <td class="excel12">25</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Mon</td>
            <td class="excel6">26</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Tue</td>
            <td class="excel12">27</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Wed</td>
            <td class="excel6">28</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Thu</td>
            <td class="excel12">29</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel4" style="height:15.75pt;">&nbsp;</td>
            <td class="excel6">Fri</td>
            <td class="excel6">30</td>
            <td class="excel6">Dec</td>
            <td class="excel6">2011</td>
          </tr>
          <tr style="height:15.75pt;">
            <td class="excel9" style="height:15.75pt;">&nbsp;</td>
            <td class="excel12">Sat</td>
            <td class="excel12">31</td>
            <td class="excel12">Dec</td>
            <td class="excel12">2011</td>
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
