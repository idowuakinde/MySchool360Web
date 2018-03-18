<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="900"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: Trinity Term Report 2009-2010</span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      
      <tr>
        <td align="left" valign="top"><hr /></td>
        </tr>
      <tr>
        <td align="left" valign="top"><table width="100%" border="0">
          
          <tr>
            <td width="15%"><strong>Student:</strong></td>
            <td width="35%">&nbsp;</td>
            <td width="15%"><strong>House:</strong></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Date of Birth:</strong></td>
            <td>&nbsp;</td>
            <td><strong>Boarding House:</strong></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><strong>Class:</strong></td>
            <td>&nbsp;</td>
            <td><strong>Form Tutor:</strong></td>
            <td>&nbsp;</td>
          </tr>
          
        </table></td>
        </tr>
      <tr>
        <td align="left" valign="top"><hr /></td>
      </tr>
      <tr>
        <td align="left" valign="top"><table width="100%" border="0">
          <tr>
            <td width="28%" align="center" class="defaultHeaderTextStyle">Subject</td>
            <td width="28%" align="center" class="defaultHeaderTextStyle">Teacher</td>
            <td width="15%" align="center" class="defaultHeaderTextStyle">Attainment</td>
            <td width="15%" align="center" class="defaultHeaderTextStyle">Effort</td>
            <td align="center" class="defaultHeaderTextStyle">Exam (%) </td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Art</td>
            <td align="center" class="defaultHeaderTextStyle">Mr. Ajiboye </td>
            <td align="center" class="defaultHeaderTextStyle">B</td>
            <td align="center" class="defaultHeaderTextStyle">3</td>
            <td align="center" class="defaultHeaderTextStyle">77</td>
          </tr>
          <tr>
            <td colspan="5" align="left"><div align="justify">This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ... This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...</div></td>
            </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Subject</td>
            <td align="center" class="defaultHeaderTextStyle">Teacher</td>
            <td align="center" class="defaultHeaderTextStyle">Attainment</td>
            <td align="center" class="defaultHeaderTextStyle">Effort</td>
            <td align="center" class="defaultHeaderTextStyle">Exam (%) </td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Art</td>
            <td align="center" class="defaultHeaderTextStyle">Mr. Ajiboye </td>
            <td align="center" class="defaultHeaderTextStyle">B</td>
            <td align="center" class="defaultHeaderTextStyle">3</td>
            <td align="center" class="defaultHeaderTextStyle">77</td>
          </tr>
          <tr>
            <td colspan="5" align="left"><div align="justify">This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ... This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...</div></td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Subject</td>
            <td align="center" class="defaultHeaderTextStyle">Teacher</td>
            <td align="center" class="defaultHeaderTextStyle">Attainment</td>
            <td align="center" class="defaultHeaderTextStyle">Effort</td>
            <td align="center" class="defaultHeaderTextStyle">Exam (%) </td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Art</td>
            <td align="center" class="defaultHeaderTextStyle">Mr. Ajiboye </td>
            <td align="center" class="defaultHeaderTextStyle">B</td>
            <td align="center" class="defaultHeaderTextStyle">3</td>
            <td align="center" class="defaultHeaderTextStyle">77</td>
          </tr>
          <tr>
            <td colspan="5" align="left"><div align="justify">This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ... This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...</div></td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Subject</td>
            <td align="center" class="defaultHeaderTextStyle">Teacher</td>
            <td align="center" class="defaultHeaderTextStyle">Attainment</td>
            <td align="center" class="defaultHeaderTextStyle">Effort</td>
            <td align="center" class="defaultHeaderTextStyle">Exam (%) </td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Art</td>
            <td align="center" class="defaultHeaderTextStyle">Mr. Ajiboye </td>
            <td align="center" class="defaultHeaderTextStyle">B</td>
            <td align="center" class="defaultHeaderTextStyle">3</td>
            <td align="center" class="defaultHeaderTextStyle">77</td>
          </tr>
          <tr>
            <td colspan="5" align="left">This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ... This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...</td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Subject</td>
            <td align="center" class="defaultHeaderTextStyle">Teacher</td>
            <td align="center" class="defaultHeaderTextStyle">Attainment</td>
            <td align="center" class="defaultHeaderTextStyle">Effort</td>
            <td align="center" class="defaultHeaderTextStyle">Exam (%) </td>
          </tr>
          <tr>
            <td align="center" class="defaultHeaderTextStyle">Art</td>
            <td align="center" class="defaultHeaderTextStyle">Mr. Ajiboye </td>
            <td align="center" class="defaultHeaderTextStyle">B</td>
            <td align="center" class="defaultHeaderTextStyle">3</td>
            <td align="center" class="defaultHeaderTextStyle">77</td>
          </tr>
          <tr>
            <td colspan="5" align="left">This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ... This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...This term, Year 7 have investigated the Pop Art movement. They have produced work based on repetition, logos and colour. {xxx} has shown a good understanding of ...</td>
          </tr>
          
          <tr>
            <td colspan="5" align="left"><table width="100%" border="0" cellpadding="0" cellspacing="10" class="borderedTable">
              <tr>
                <td width="33%" height="75" class="borderedTableGrey"><table width="100%" border="0">
                  <tr>
                    <td width="60%" class="defaultHeaderTextStyle">House Points:</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="defaultHeaderTextStyle">Merit:</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="defaultHeaderTextStyle">Demerit:</td>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td width="33%" class="borderedTableGrey"><table width="100%" border="0">
                  <tr>
                    <td width="60%" class="defaultHeaderTextStyle">Days Late: </td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="defaultHeaderTextStyle">&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="defaultHeaderTextStyle">Days Absent: </td>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td class="borderedTableGrey"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="10%" align="center" class="defaultHeaderTextStyle">A</td>
                    <td class="defaultHeaderTextStyle">Outstanding</td>
                    <td width="10%" align="center" class="defaultHeaderTextStyle">1</td>
                  </tr>
                  <tr>
                    <td align="center" class="defaultHeaderTextStyle">B</td>
                    <td class="defaultHeaderTextStyle">Good</td>
                    <td align="center" class="defaultHeaderTextStyle">2</td>
                  </tr>
                  <tr>
                    <td align="center" class="defaultHeaderTextStyle">C</td>
                    <td class="defaultHeaderTextStyle">Satisfactory</td>
                    <td align="center" class="defaultHeaderTextStyle">3</td>
                  </tr>
                  <tr>
                    <td align="center" class="defaultHeaderTextStyle">D</td>
                    <td class="defaultHeaderTextStyle">Less than satisfactory </td>
                    <td align="center" class="defaultHeaderTextStyle">4</td>
                  </tr>
                  <tr>
                    <td align="center" class="defaultHeaderTextStyle">E</td>
                    <td class="defaultHeaderTextStyle">Poor, cause for concern </td>
                    <td align="center" class="defaultHeaderTextStyle">5</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="5" align="left"><table width="100%" border="0" cellpadding="0" cellspacing="10" class="borderedTable">
              <tr>
                <td class="defaultHeaderTextStyle"><u>Form Tutor Comments:</u></td>
              </tr>
              <tr>
                <td><p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="5" align="left"><table width="100%" border="0" cellpadding="0" cellspacing="10" class="borderedTable">
              <tr>
                <td class="defaultHeaderTextStyle"><u>Boarding House  Comments (if applicable):</u></td>
              </tr>
              <tr>
                <td><p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="left"><table width="250" border="0" align="right">
              <tr>
                <td>_______________________________________</td>
              </tr>
              <tr>
                <td class="defaultHeaderTextStyle">Mr. H. Bullock </td>
              </tr>
              <tr>
                <td class="defaultHeaderTextStyle">Principal</td>
              </tr>
              <tr>
                <td class="defaultHeaderTextStyle">30 June 2010</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        </tr>
      
    </table></td>
  </tr>
</table>
</body>
</html>
