<%@ Page Language="VB" AutoEventWireup="false" CodeFile="vle_menu.aspx.vb" Inherits="modules_vle_vle_menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: My e-Learning Center"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                        Target="operationFrame">My Virtual Classroom</asp:HyperLink>
                  </td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Target="operationFrame">My Practice Questions</asp:HyperLink>
                  </td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td>
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" 
                        NavigateUrl="http://50.56.227.124:8080/m_foru_chi/index.php?p=/" 
                        Target="operationFrame">My Discussion Forums</asp:HyperLink>
                  </td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr>
                <td>
            <table width="100%"  border="0" cellpadding="2" cellspacing="2">
              <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My OpenCourseWare:</strong></td>
              </tr>
              <tr>
                <td align="left" bgcolor="White" width="5">
                    &nbsp;</td>
                <td align="left">
                    <a href="http://www.ocwconsortium.org/index.php?option=com_coursefinder" target="operationFrame">OCW Course Catalog</a></td>
              </tr>
              <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select name="lstOCW" class="defaultFormElementStyle" onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
      <option value="javascript:parent.frames['operationFrame'].location;">Please choose one...</option>
      <optgroup label="Afghanistan">
      <option value="http://www.kpu.edu.af/">Kabul Polytechnic</option>
      </optgroup>
      <optgroup label="Australia">
      <option value="http://ocw.usq.edu.au/">Southern Queensland</option>
      </optgroup>
      <optgroup label="Canada">
      <option value="http://ocw.athabascau.ca/">Athabasca University</option>
      <option value="http://ocw.capilanou.ca/">Capilano University</option>
      </optgroup>
      <optgroup label="Israel">
      <option value="http://ocw.openu.ac.il/eng_files/english.html">Open University</option>
      </optgroup>
      <optgroup label="Japan">
      <option value="http://opencourse.doshisha.ac.jp/english/index.html">Doshisha University</option>
      <option value="http://ocw.hokudai.ac.jp/index.php?lang=en">Hokkaido University</option>
      <option value="http://ocw.eiyo.ac.jp/english/index.html">Kagawa University</option>
      <option value="http://ocw.kyoto-u.ac.jp/front-page/view?set_language=en">Kyoto University</option>
      <option value="http://ocw.kyushu-u.ac.jp/english/index.html">Kyushu University</option>
      <option value="http://ocw.nagoya-u.jp/index.php?lang=en">Nagoya University</option>
      <option value="http://ocw.osaka-u.ac.jp/index.php">Osaka University</option>
      <option value="http://www.ocw.titech.ac.jp/index.php?lang=EN">Tokyo Tech</option>
      <option value="http://ocw.unu.edu/">United Nations Uni.</option>
      <option value="http://ocw.u-tokyo.ac.jp/english/">University of Tokyo</option>
      <option value="http://www.waseda.jp/ocw/index_e.html">Waseda University</option>
      </optgroup>
      <optgroup label="Korea">
      <option value="http://ocw.korea.edu/">Korea University</option>
      <option value="http://ocw.pusan.ac.kr/front/phtml/index.php">Pusan National Uni.</option>
      </optgroup>
      <optgroup label="Mexico">
      <option value="http://ocw.udem.edu.mx/">Uni. of Monterrey</option>
      </optgroup>
      <optgroup label="Netherlands">
      <option value="http://ocw.tudelft.nl/">Delft Uni. of Tech.</option>
      </optgroup>
      <optgroup label="South Africa">
      <option value="http://freecourseware.uwc.ac.za/">Uni. of Western Cape</option>
      </optgroup>
      <optgroup label="Spain">
      <option value="http://ocw.uv.es/ocw/">Valencia Uni.</option>
      <option value="http://ocw.ua.es/">Alicante Uni.</option>
      <option value="http://ocw.unia.es/">Andalucia Uni.</option>
      <option value="http://ocw.uab.cat/">Autonoma Barcelona</option>
      <option value="http://ocw.uca.es/front-page?set_language=en">Cadiz Uni.</option>
      <option value="http://ocw.unican.es/">Cantabria Uni.</option>
      <option value="http://ocw.uc3m.es/">Carlos III de Madrid</option>
      <option value="http://ocw.deusto.es:8080/OCW/front-page?set_language=en">Deusto Uni.</option>
      <option value="http://ocw.ugr.es/">Granada Uni.</option>
      <option value="http://www.udg.edu/Default.aspx">Girona Uni.</option>
      <option value="http://www.uhu.es/sevirtual/ocw/">Huelva Uni.</option>
      <option value="http://ocw.uji.es/">Jaume Uni.</option>
      <option value="http://ocw.upm.es/">Madrid Polytechnic</option>
      <option value="http://ocw.uma.es/">Malaga Uni.</option>
      <option value="http://ocw.um.es/ocw?set_language=en">Murcia Uni.</option>
      <option value="http://ocw.innova.uned.es/ocwuniversia">National Uni. of Educ.</option>
      <option value="http://www.unav.es/ocw/">Navarra Uni.</option>
      <option value="http://ocw.uoc.edu/">Oberta Uni.</option>
      <option value="http://ocw.uniovi.es/">Oviedo Uni.</option>
      <option value="http://ocw.ehu.es/front-page?set_language=en&cl=en">Pais Vasco Uni.</option>
      <option value="http://ocw.usal.es/">Salamanca Uni.</option>
      <option value="http://ocw.usc.es/en/servizos/ceta/opencourseware/index.html">Santiago Compostella</option>
      <option value="http://www.upv.es/entidades/OCW/">Valencia Polytechnic</option>
      <option value="http://ocw.unizar.es/">Zaragoza Uni.</option>
      </optgroup>
      <optgroup label="Taiwan">
      <option value="http://ics.nccu.edu.tw/eced/eocw/">National Chengchi Uni.</option>
      <option value="http://ocw.nctu.edu.tw/main.php">National Chiao Tung</option>
      <option value="http://ocw.tmu.edu.tw/index.php">Taipei Medical Uni.</option>
      </optgroup>
      <optgroup label="Thailand">
      <option value="http://www.courseware.thaicyberu.go.th/">Thailand Cyber Uni.</option>
      </optgroup>
      <optgroup label="Turkey">
      <option value="http://ocw.metu.edu.tr/">Middle East Tech. Uni.</option>
      <option value="http://ocw.org.tr/index_eng.htm">Turkish Consortium</option>
      </optgroup>
      <optgroup label="United Kingdom">
      <option value="http://www.peoples-uni.org/">Peoples Open Access</option>
      <option value="http://openlearn.open.ac.uk/">The Open University</option>
      <option value="http://unow.nottingham.ac.uk/">Uni. of Nottingham</option>
      </optgroup>
      <optgroup label="United States">
      <option value="http://ocw.asu.edu">Arizona State Uni.</option>
      <option value="http://ocw.ceu.edu/">Coll. of Eastern Utah</option>
      <option value="http://ocw.dixie.edu/">Dixie State College</option>
      <option value="http://mycourses.med.harvard.edu/public/">Harvard University</option>
      <option value="http://ocw.jhsph.edu/">Johns Hopkins Uni.</option>
      <option value="http://ocw.msu.edu/">Michigan State Uni.</option>
      <option value="http://ocw.mit.edu/">MIT</option>
      <option value="http://ocw.nd.edu/">Notre Dame Uni.</option>
      <option value="http://www.core.org.cn/sofia/">Sofia</option>
      <option value="http://ocw.tufts.edu/">Tufts University </option>
      <option value="http://oer.uaf.edu/">U. of Alaska Fairbanks</option>
      <option value="http://webcast.berkeley.edu/">UC Berkeley</option>
      <option value="http://ocw.uci.edu/">UC Irvine</option>
      <option value="http://ocw.umb.edu/">Uni. of Mass., Boston</option>
      <option value="http://open.umich.edu/">Uni. of Michigan</option>
      <option value="http://ocw.utah.edu/">Uni. of Utah</option>
      <option value="http://uocwa.org/">Utah OCW Alliance</option>
      <option value="http://ocw.usu.edu/">Utah State Uni.</option>
      <option value="http://ocw.weber.edu/">Weber State Uni.</option>
      <option value="http://ocw.wgu.edu/">Western Governors</option>
      <option value="http://wikiversity.org/">Wikiversity</option>
      </optgroup>
        </select></td>
              </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My e-Libraries (Free e-books):</strong></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select name="lstLibraries" class="defaultFormElementStyle" onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
      <option value="javascript:parent.frames['operationFrame'].location;" selected="selected">Please choose one... </option>
      <option value="http://www.accessmylibrary.com/">AccessMyLibrary</option>
      <option value="http://portal.acm.org/dl.cfm">ACM Digital Library</option>
      <option value="http://www.ajol.info/">African Journals Online</option>
      <option value="http://www.audible.com/">Audible.com</option>
      <option value="http://adt.caul.edu.au/">Australian Digital Theses</option>
      <option value="http://www.bookboon.com/">BookBoon</option>
      <option value="http://ebooks.eb.com/">Britannica e-Books</option>
      <option value="http://www.bl.uk/">The British Library</option>
      <option value="http://drmfree.calibre-ebook.com/">Calibre e-Books</option>
      <option value="http://www.delos.info/">DELOS</option>
      <option value="http://dlg.galileo.usg.edu/">Digital Library of Georgia</option>
      <option value="http://www.doaj.org/">DOAJ</option>
      <option value="http://www.theeuropeanlibrary.org/">The European Library</option>
      <option value="http://www.thefreelibrary.com/">The Free Library</option>
      <option value="http://www.galileo.usg.edu/welcome/">Galileo</option>
      <option value="http://lib.harvard.edu/">Harvard Libraries</option>
      <option value="http://hul.harvard.edu/">Harvard University Library</option>
      <option value="http://www.ibiblio.org/">ibiblio</option>
      <option value="http://www.dlib.indiana.edu/">Indiana Uni.</option>
      <option value="http://www.libraries.iub.edu/">Indiana Uni. Libraries</option>
      <option value="http://www.archive.org/">The Internet Archive</option>
      <option value="http://www.jstor.org/">JStor</option>
      <option value="http://www.loc.gov/index.html">Library of Congress</option>
      <option value="http://cdl.library.cornell.edu/moa/moa_browse.html">MoA Cornell Uni.</option>
      <option value="http://quod.lib.umich.edu/m/moagrp/">MoA Uni. of Michigan</option>
      <option value="http://www.michael-culture.org/en/home">MICHAEL</option>
      <option value="http://www.lib.umich.edu/mdp/">Michigan Digitization Proj.</option>
      <option value="http://www.archive.org/details/millionbooks">Million Book Project</option>
      <option value="http://www.digitalpreservation.gov/">Digital Preservation</option>
      <option value="http://www.nypl.org/">New York Public Library</option>
      <option value="http://digital.library.okstate.edu/">OSU Library</option>
      <option value="http://www.lib.utexas.edu/books/etext.html">UT Library Online</option>
      <option value="http://www.opencontentalliance.org/">Open Content Alliance</option>
      <option value="http://library.open.ac.uk/">Open University Library</option>
      <option value="http://ota.ahds.ac.uk/">Oxford Text Archive</option>
      <option value="http://pandora.nla.gov.au/">Pandora Archive</option>
      <option value="http://www.perseus.tufts.edu/">Perseus Project</option>
      <option value="http://www.questia.com/Index.jsp">Questia</option>
      <option value="http://www.rarebookroom.org/">Rare Book Room</option>
      <option value="http://www.terasaur.org/">Terasaur</option>
      <option value="http://www.lib.umich.edu/tcp/">Text Creation Partnership</option>
      <option value="http://www.webarchive.org.uk/">The UK Web Archive</option>
      <option value="http://www.ulib.org/">Universal Digital Library</option>
      <option value="http://www.umdl.umich.edu/">UMich Digital Library</option>
      <option value="http://uwdc.library.wisc.edu/">UWisc Digital Collections</option>
      <option value="http://www.sos.mo.gov/mdh/">Missouri Digital Heritage</option>
      <option value="http://www.jisc.ac.uk/whatwedo/programmes/digitisation/welshjournals.aspx">Welsh Journals Online</option>
      <option value="http://en.wikibooks.org/">Wikibooks</option>
      <option value="http://wikisource.org/">Wikisource</option>
      <option value="http://wiredforbooks.org/">Wired for Books</option>
      <option value="http://www.worlddigitallibrary.org/">World Digital Library</option>
    </select></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My Encyclopedias:</strong></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select name="lstLibraries0" class="defaultFormElementStyle" 
                        onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
      <option value="javascript:parent.frames['operationFrame'].location;" selected="selected">Please choose one... </option>
      <option value="http://www.botanicus.org/">Botanicus</option>
      <option value="http://www.britannica.com/">Britannica</option>
      <option value="http://mathincontext.eb.com/">Britannica Mathematics</option>
      <option value="http://www.forestencyclopedia.net/">Forest Encyclopedia</option>
    </select></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My Dictionaries:</strong></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <a href="vle_dictionary_lookup.htm" target="operationFrame">Quick Dictionary / Thesaurus</a></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select name="lstLibraries1" class="defaultFormElementStyle" 
                        onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
      <option value="javascript:parent.frames['operationFrame'].location;" selected="selected">Please choose one... </option>
      <option value="http://legal-dictionary.avvo.com/">AVVO Legal Dictionary</option>
      <option value="http://www.thefreedictionary.com/">The Free Dictionary</option>
      <option value="http://financial-dictionary.thefreedictionary.com/">The Free Financial Dictionary</option>
      <option value="http://legal-dictionary.thefreedictionary.com/">The Free Legal Dictionary</option>
      <option value="http://medical-dictionary.thefreedictionary.com/">The Free Medical Dictionary</option>
      <option value="http://www.websters-online-dictionary.org/">Webster's Online Dictionary</option>
      <option value="http://www.wiktionary.org/">Wiktionary.org</option>
    </select></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My Leadership Development:</strong></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select name="lstLeadership" class="defaultFormElementStyle" onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
                          <option value="javascript:parent.frames['operationFrame'].location;" selected="selected">Please choose one...</option>
                          <option value="http://www.bestpracticeinstitute.org/">Best Practice Institute</option>
                          <option value="http://www.ccl.org/">CCL</option>
                          <option value="http://www.the-chiefexecutive.com/">The CEO</option>
                          <option value="http://www.christopheravery.com/blog/">Christopher Avery's Blog</option>
                          <option value="http://www.dalecarnegie.com/">Dale Carnegie Institute</option>
                          <option value="http://www.dlaonline.org/">Daystar Leadership Acad.</option>
                          <option value="http://www.fatefoundation.com/">Fate Foundation</option>
                          <option value="http://www.leadershiptools.com/">Leadership Tools</option>
                          <option value="http://www.microsoft.com/smallbusiness/startup-toolkit/?xid=C0094">Microsoft Startup Center</option>
                          <option value="http://www.pals.co.uk/">PALS</option>
                          <option value="http://www.revanscenter.com/">Revans Center USA</option>
                          <option value="http://www.sba.gov/">US Small Business Admin</option>
                    </select></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My e-Learning Aids:</strong></td>
                </tr>
              <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <select class="defaultFormElementStyle" name="lstOthers" 
                        onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
                        <option selected="selected" value="javascript:parent.frames['operationFrame'].location;">Please choose one...</option>
                        <option value="http://www.aapt.org/resources">AAPT</option>
                        <option value="http://www.abcteach.com/">abcTeach</option>
                        <option value="http://www.academicearth.org/">Academic Earth</option>
                        <option value="http://www.audible.com/">Audible.com</option>
                        <option value="http://www.edhelper.com/">edHelper.com</option>
                        <option value="http://www.edx.org">edX</option>
                        <option value="http://www.bookboon.com">Bookboon</option>
                        <option value="http://ebooks.eb.com">Britannica e-Books</option>
                        <option value="http://www.bl.uk/">British Library</option>
                        <option value="http://drmfree.calibre-ebook.com/">Calibre e-Books</option>
                        <option value="https://www.teachers.cambridgeesol.org/ts/">Camb. Eng. Teaching Support</option>
                        <option value="http://cnx.org/">Connexions</option>
                        <option value="http://www.coursera.org">Coursera</option>
                        <option value="http://www.crscience.org/">CRS</option>
                        <option value="http://www.curriki.org/">Curriki</option>
                        <option value="http://www.discoveryeducation.com/teachers/">Discovery Education</option>
                        <option value="http://books.google.com">Google Books</option>
                        <option value="http://www.goorulearning.org/">Gooru</option>
                        <option value="http://ilab.harvard.edu/">Harvard Innovation Lab</option>
                        <option value="http://lib.harvard.edu/">Harvard Library</option>
                        <option value="http://www.khanacademy.org">Khan Academy</option>
                        <option value="http://www.khanacademy.org/r/exercise-browser">Khan Academy Exercise Browser</option>
                        <option value="http://www.learnzillion.com">LearnZillion</option>
                        <option value="http://www.loc.gov/teachers/">Library of Congress</option>
                        <option value="http://www.literatureencore.com">Literature Encore</option>
                        <option value="http://www.mathworks.com/academia/classroom-resources/">MathWorks</option>
                        <option value="http://ocw.mit.edu/">MIT OpenCourseWare</option>
                        <option value="http://www.nypl.org/">New York Public Library</option>
                        <option value="http://www.oerafrica.org/">OER Africa</option>
                        <option value="http://www.primaryresources.co.uk/">Primary Resources</option>
                        <option value="http://www.plos.org/">PLoS</option>
                        <option value="http://www.plosone.org/">PLoS ONE</option>
                        <option value="http://www.readwritethink.org/">ReadWriteThink</option>
                        <option value="http://www.scholastic.com/teachers/teaching-resources">Scholastic</option>
                        <option value="http://www.sitesforteachers.com/">Sites for Teachers</option>
                        <option value="http://sparklebox.co.uk/">SparkleBox</option>
                        <option value="http://www.teachers.net/">Teachers.Net</option>
                        <option value="http://www.teachingideas.co.uk/">Teaching Ideas</option>
                        <option value="http://www.ted.com">TED</option>
                        <option value="http://www.tes.co.uk/teaching-resources/">TESConnect</option>
                        <option value="http://en.wikibooks.org/wiki/Main_Page">WikiBooks</option>
                        <option value="http://wikinews.org/">WikiNews</option>
                        <option value="http://wikipedia.org/">WikiPedia</option>
                        <option value="http://wikiquote.org/">WikiQuote</option>
                        <option value="http://wikisource.org/">WikiSource</option>
                        <option value="http://species.wikimedia.org/">WikiSpecies</option>
                        <option value="http://wikiversity.org/">WikiVersity</option>
                        <option value="http://blog.wolfram.com/">Wolfram Blog</option>
                        <option value="http://demonstrations.wolfram.com/">Wolfram Demonstrations</option>
                        <option value="http://forums.wolfram.com/">Wolfram Forums</option>
                        <option value="http://functions.wolfram.com/">Wolfram Functions</option>
                        <option value="http://gallery.wolfram.com/">Wolfram Gallery</option>
                        <option value="http://library.wolfram.com/">Wolfram Library</option>
                        <option value="http://www.wolfram.com/products/mathematica/index.html">Wolfram Mathematica</option>
                        <option value="http://www.mathematica-journal.com/">Wolfram Mathematica Journal</option>
                        <option value="http://mathworld.wolfram.com/">Wolfram Mathworld</option>
                        <option value="http://mathworld.wolfram.com/classroom/">Wolfram Mathworld Classroom</option>
                        <option value="http://numb3rs.wolfram.com/">Wolfram NUMB3RS</option>
                        <option value="http://integrals.wolfram.com/">Wolfram Integrals</option>
                        <option value="http://www.wolframscience.com/">Wolfram Science</option>
                        <option value="http://tones.wolfram.com/">Wolfram Tones</option>
                        <option value="http://www.wolfram.com/tutorialcollection">Wolfram Tutorials</option>
                    </select></td>
              </tr>
                <tr>
                <td align="left" bgcolor="White" colspan="2">
                    <strong>My Additional Resources:</strong></td>
                </tr>
                <tr>
                <td align="left" bgcolor="White">
                    &nbsp;</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlNewResources" 
                        DataTextField="ResourceTitle" DataValueField="ResourceURL" 
                        AppendDataBoundItems="True" onchange="MM_jumpMenu('parent.frames[\'operationFrame\']',this,0)">
                        <asp:ListItem Value="javascript:parent.frames['operationFrame'].location;">Please choose one... </asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsSqlNewResources" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ResourceTitle], [ResourceURL] FROM [TEMP_eResource] WHERE ([ResourceCategory] = @ResourceCategory) ORDER BY [ResourceURL]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Student" Name="ResourceCategory" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                </tr>
                </table>
                  </td>
              </tr>
              </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
