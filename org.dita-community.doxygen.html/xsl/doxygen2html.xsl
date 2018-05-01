<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="xs xd" version="2.0">

  <!-- =====================================================================================
       Top-level XSLT to generate Doxygen-style HTML from DITA where the DITA reflects
       Doxygen-specific @outputclass values and/or specializations.
       
       This mostly just overrides base templates. It is structured as a separate transformation
       type so that it doesn't globally override normal HTML output.
       
       It does not directly include the doxygen2htmlOverrides.xsl
       because that module is a global override that is included 
       using the normal XHTML extension point.
       
       Copyright (c) 2015, 2016 DITA Community
       ====================================================================================== -->
  
  <xsl:import href="plugin:org.dita.xhtml:xsl/dita2xhtml.xsl"/>
  
  <xsl:param name="input.map.url" as="xs:string?"/>
  
  <xsl:variable name="inputMapDoc" as="document-node()?"
    select="if ($input.map.url) 
               then document($input.map.url) 
               else ()"
  />
  
  <xsl:template name="gen-user-header">
    <xsl:param name="doDebug" as="xs:boolean" tunnel="yes" select="false()"/>

    <xsl:if test="$doDebug">
      <xsl:message> + [DEBUG] input.map.url="<xsl:value-of select="$input.map.url"/>"</xsl:message>
      <xsl:message> + [DEBUG] inputMapDoc=<xsl:value-of select="$inputMapDoc"/></xsl:message>
    </xsl:if>

    <xsl:variable name="prodname"
      select="$inputMapDoc/*/*[contains(@class, ' map/topicmeta ')]/
                              *[contains(@class, ' topic/metadata ')]/
                              *[contains(@class, ' topic/prodinfo ')]/
                              *[contains(@class, ' topic/prodname ')]"
    />   
    <xsl:variable name="vrm"
      select="$inputMapDoc/*/*[contains(@class, ' map/topicmeta ')]/
                              *[contains(@class, ' topic/metadata ')]/
                              *[contains(@class, ' topic/prodinfo ')]/
                              *[contains(@class, ' topic/vrmlist ')]/
                              *[contains(@class, ' topic/vrm ')][1]"
    />   
    <xsl:variable name="projectnumber" as="xs:string"
      select="if ($vrm)
      then string-join(($vrm/@version, $vrm/@release, $vrm/@modification), '.')
      else '0.0.0'
      "
    />
    
    <xsl:if test="$doDebug">
      <xsl:message> + [DEBUG] gen-user-header: prodname="<xsl:value-of select="$prodname"/>"</xsl:message>      
      <xsl:message> + [DEBUG] gen-user-header: vrm="<xsl:sequence select="$vrm"/>"</xsl:message>      
      <xsl:message> + [DEBUG] gen-user-header: projectnumber="<xsl:value-of select="$projectnumber"/>"</xsl:message>      
    </xsl:if>
    <div id="top">
      <div id="titlearea">
        <table cellspacing="0" cellpadding="0">
          <tbody>
            <tr style="height: 56px;">
              <td id="projectlogo">
                <img alt="Logo" src="../resources/images/OculusLogoSmall.png"/>
              </td>
              <td style="padding-left: 0.5em;">
                <div id="projectname">
                  <xsl:sequence select="if ($prodname) then $prodname else 'ProductName'"/>
                  &#xa0;<span id="projectnumber"><xsl:value-of select="$projectnumber"/></span>
                </div>
                <div id="projectbrief">
                  <xsl:apply-templates
                    select="$inputMapDoc/*/*[contains(@class, ' topic/title ')]/node()"
                  />
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <!--
      <script type="text/javascript">
        var searchBox = new SearchBox("searchBox", "search",false,'Search');
      </script>
      -->
      <div id="navrow1" class="tabs">
        <ul class="tablist">
          <li>
            <a href="index.html">
              <span>Main&#160;Page</span>
            </a>
          </li>
          <li class="current">
            <a href="annotated.html">
              <span>Data&#160;Structures</span>
            </a>
          </li>
          <li>
            <a href="files.html">
              <span>Files</span>
            </a>
          </li>
          <li>
            <div id="MSearchBox" class="MSearchBoxInactive">
              <span class="left">
                <img id="MSearchSelect" src="../resources/images/mag_sel.png"
                  onmouseover="return searchBox.OnSearchSelectShow()"
                  onmouseout="return searchBox.OnSearchSelectHide()" alt=""/>
                <input type="text" id="MSearchField" value="Search" accesskey="S"
                  onfocus="searchBox.OnSearchFieldFocus(true)"
                  onblur="searchBox.OnSearchFieldFocus(false)"
                  onkeyup="searchBox.OnSearchFieldChange(event)"/>
              </span>
              <span class="right">
                <a id="MSearchClose" href="javascript:searchBox.CloseResultsWindow()">
                  <img id="MSearchCloseImg" border="0" src="../resources/images/close.png" alt=""/>
                </a>
              </span>
            </div>
          </li>
        </ul>
      </div>
      <div id="navrow2" class="tabs2">
        <ul class="tablist">
          <li>
            <a href="annotated.html">
              <span>Data&#160;Structures</span>
            </a>
          </li>
          <li>
            <a href="classes.html">
              <span>Data&#160;Structure&#160;Index</span>
            </a>
          </li>
          <li>
            <a href="functions.html">
              <span>Data&#160;Fields</span>
            </a>
          </li>
        </ul>
      </div>
      <!-- window showing the filter options -->
      <div id="MSearchSelectWindow" onmouseover="return searchBox.OnSearchSelectShow()"
        onmouseout="return searchBox.OnSearchSelectHide()"
        onkeydown="return searchBox.OnSearchSelectKey(event)">
        <a class="SelectItem" onclick="searchBox.OnSelectItem(0)" href="javascript:void(0)"><span
          class="SelectionMark">•</span>All</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(1)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Data Structures</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(2)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Files</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(3)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Functions</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(4)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Variables</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(5)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Typedefs</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(6)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Enumerations</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(7)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Enumerator</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(8)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Macros</a>
        <a class="SelectItem" onclick="searchBox.OnSelectItem(9)" href="javascript:void(0)"><span
          class="SelectionMark">&#160;</span>Pages</a>
      </div>
    </div>
  </xsl:template>
  

</xsl:stylesheet>
