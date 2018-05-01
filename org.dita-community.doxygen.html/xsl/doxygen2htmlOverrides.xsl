<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="xs xd" version="2.0">

  <!-- =====================================================================================
       Top-level XSLT to generate Doxygen-style HTML from DITA where the DITA reflects
       Doxygen-specific @outputclass values and/or specializations.
       
       This mostly just overrides base templates. It is structured as a separate transformation
       type so that it doesn't globally override normal HTML output.
       
       Copyright (c) 2015, 2016 DITA Community
       ====================================================================================== -->
  
  <!-- Generate "more..." link to the main part of the topic's output. -->
  <xsl:template match="*['compounddef' = tokenize(@outputclass, ' ')]/*[contains(@class, ' topic/shortdesc ')]" 
    mode="outofline">
    <p>
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates/>
      <a href="#details">More...</a>
    </p><xsl:text>&#x0a;</xsl:text>
  </xsl:template>
  
  <!-- start Include -->
  <xsl:template match="*[contains(@class, ' topic/ph ')][@outputclass = 'includes']">
    <xsl:variable name="keyref" select="xref/@keyref"/>
    <code><xsl:apply-templates mode="#current"/></code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/section ')][@outputclass = 'includes']">
    <div class="textblock">
      <xsl:apply-templates mode="#current"/>
    </div>
  </xsl:template>
  
  <!-- end Include -->  
  
  <!-- Handle nested topics that require special output -->
  
  <xsl:template match="*[contains(@class, ' topic/topic ')]['detaileddescription' = tokenize(@outputclass, ' ')]">
    <a id="details" name="details"/>
    <xsl:next-match/>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/topic ')]['declSummary' = tokenize(@outputclass, ' ')]">
    <!-- Declaration summary output puts everything in a table, including the topic title,
         so we basically skip right to the topic body processing.
      -->
    <xsl:apply-templates select="*[contains(@class, ' topic/body ')]"
      mode="#current"
    />
  </xsl:template>
  
  <!-- Handle topics that contain declaration summaries, which need to be rendered as tables 
  
       This is based on the topic/body template in dita2htmlImpl.xsl. It overrides
       the handling of the body content. All the rest is unchanged.
  -->
  <xsl:template match="*[contains(@class, ' reference/refbody ')]
    [*[contains(@class, ' topic/section')]['declSummary' = tokenize(@outputclass, ' ')]]" name="topic.body">
    <div>
      <xsl:call-template name="commonattributes"/>
      <xsl:call-template name="setidaname"/>
      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]" mode="out-of-line"/>
      <!-- here, you can generate a toc based on what's a child of body -->
      <!--xsl:call-template name="gen-sect-ptoc"/--><!-- Works; not always wanted, though; could add a param to enable it.-->
      
      <!-- Insert prev/next links. since they need to be scoped by who they're 'pooled' with, apply-templates in 'hierarchylink' mode to linkpools (or related-links itself) when they have children that have any of the following characteristics:
       - role=ancestor (used for breadcrumb)
       - role=next or role=previous (used for left-arrow and right-arrow before the breadcrumb)
       - importance=required AND no role, or role=sibling or role=friend or role=previous or role=cousin (to generate prerequisite links)
       - we can't just assume that links with importance=required are prerequisites, since a topic with eg role='next' might be required, while at the same time by definition not a prerequisite -->
      
      <!-- Added for DITA 1.1 "Shortdesc proposal" -->
      <!-- get the abstract para -->
      <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/abstract ')]" mode="outofline"/>
      
      <!-- get the shortdesc para -->
      <xsl:apply-templates select="preceding-sibling::*[contains(@class, ' topic/shortdesc ')]" mode="outofline"/>
      
      <!-- Insert pre-req links - after shortdesc - unless there is a prereq section about -->
      <xsl:apply-templates select="following-sibling::*[contains(@class, ' topic/related-links ')]" mode="prereqs"/>
      
      <xsl:call-template name="makeDeclSummaryTable">
        <xsl:with-param name="doDebug" as="xs:boolean" tunnel="yes" select="false()"/>
      </xsl:call-template>
      
      
      <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]" mode="out-of-line"/>
    </div><xsl:value-of select="$newline"/>
  </xsl:template>
  
  <xsl:template name="makeDeclSummaryTable">
    <!-- The table markup details are taken directly from the Doxygen-generated 
         HTML.
      -->
    <table class="memberdecls">
      <tbody>
        <xsl:apply-templates select="../*[contains(@class, ' topic/title ')]"
          mode="makeDeclSummaryTable"
        />
        <xsl:apply-templates mode="makeDeclSummaryTable"/>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:template mode="makeDeclSummaryTable" match="*[contains(@class, ' topic/title ')]">
    <tr class="heading">
      <td colspan="2">
        <h2 class="groupheader"><xsl:apply-templates/></h2>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template mode="makeDeclSummaryTable"
    match="*[contains(@class, ' topic/section' )]
    [tokenize(@outputclass, ' ') = ('declSummary', 'struct')]">
    
    <!-- This template handles different kinds of things so the apply-templates
         reflect the union of different detailed elements that can occur
         in differnt kinds and need to be reflected in the summary table.
      -->
    <!-- Literal class values are taken from doxygen-generated HTML -->
    <tr class="memitem:">
      <td class="memItemLeft">
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'kind']"
        />
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'type']"
        />
      </td>
      <td class="memItemRight">
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'name']"/>       
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'parameters']"/>
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'initializer']"/>
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'argsstring']"/>
        <xsl:apply-templates
          select="*[contains(@class, ' topic/sectiondiv ')]
          [@outputclass = 'enumvalues']"/>
      </td>
    </tr>
    <xsl:if test="not(matches(normalize-space(sectiondiv[@outputclass = 'briefdescription']), '^\s*$'))">
      <tr class="memdesc:">
        <td class="mdescLeft">&#xa0;</td>
        <td class="mdescRight">
          <xsl:apply-templates mode="#current"
            select="*[contains(@class, ' topic/sectiondiv ')]
            [@outputclass = 'briefdescription']"/>
          <xsl:apply-templates select="*[contains(@class, ' topic/xref ')]"/>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'parameters']">
    <xsl:text>(</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'param']">
    <xsl:if test="preceding-sibling::*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'param']">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'initializer']">
    <xsl:text>&#xa0;&#xa0;&#xa0;</xsl:text><xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'declname']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'argsstring']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template priority="10"
    match="*[contains(@class, ' topic/section ')]['function' = tokenize(@outputclass, ' ')]/
    *[contains(@class, ' topic/sectiondiv ')][('argsstring', 'kind') = tokenize(@outputclass, ' ')]">
    <!-- Suppress argsstring for functions as the params sectiondiv has the same information
         with hyperlinks.
      -->
    
    <!-- Suppress type for function as it's not used in the output -->
  </xsl:template>
  
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'type']">
    <xsl:text>&#x0a;</xsl:text><xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'kind']">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'enumvalues']">
    <xsl:text>{</xsl:text><br/>
    <xsl:text>&#xa0;&#xa0;</xsl:text><!-- Indent the first line by two spaces -->
    <!-- Avoid literal commas in the source: -->
    <xsl:apply-templates select="*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']"/>
    <br/><xsl:text>}</xsl:text>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']">
    <!-- Pad on left and break every 4th item -->
    <xsl:apply-templates/>
    <xsl:if test="following-sibling::*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:if test="following-sibling::*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue'] and
      ((count(preceding-sibling::*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']) + 1) mod 4) = 0">
      <br/>
      <xsl:text>&#xa0;&#xa0;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']/
                         *[contains(@class, ' topic/ph ')][@outputclass = 'name']">
    <b><xsl:apply-templates/></b>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' topic/ph ')][@outputclass = 'enumvalue']/
    *[contains(@class, ' topic/ph ')][@outputclass = 'initializer']">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template mode="makeDeclSummaryTable" match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'briefdescription']">
    <!-- Do not generate a <div> in this context -->
    <xsl:message> + [DEBUG] makeDeclSummaryTable: topic/sectiondiv, <xsl:value-of select="@outputclass"/> </xsl:message>
    
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template mode="makeDeclSummaryTable" match="*[contains(@class, ' topic/sectiondiv ')]/*[contains(@class, ' topic/p ')]">
    <xsl:message> + [DEBUG] makeDeclSummaryTable: topic/p </xsl:message>
    <!-- Do not generate a <p> in this context -->
    <xsl:apply-templates/>
  </xsl:template>
  

  <!-- start Public Member Functions -->
  <xsl:template match="*[@outputclass = ('function')]/sectiondiv[@outputclass = ('memberdefinition')]">    
    <a class="el" href="#a4c4152d07f41fc02cc694c2a7447fc2c">
      <xsl:value-of select="*[@outputclass='name']/text()"/>
    </a> 
    <xsl:value-of select="*[@outputclass='argsstring']/text()"/>
    
    <div class="mdescRight">&lt;  <a href="#a4c4152d07f41fc02cc694c2a7447fc2c">More...</a><br/></div>
  </xsl:template>
  
  <xsl:template match="*[@outputclass = ('function')]/sectiondiv[@outputclass = 'briefdescription']" />    
  <xsl:template match="*[@outputclass = ('function')]/sectiondiv[@outputclass = 'parameters']" />
  <xsl:template match="*[@outputclass = ('function')]/sectiondiv[@outputclass = 'detaileddescription']" />       
  <!-- end Public Member Functions -->


  <!-- start Data Fields -->
  <xsl:template
    match="//section[@outputclass = ('public-attrib')]/sectiondiv[@outputclass = ('memberdecls')]">
    <table class="memberdecls">
      <tbody>
        <xsl:apply-templates select="*[@outputclass = ('variable')]" mode="variablediv"/>
      </tbody>
    </table>
    
    <xsl:call-template name="detailedDescription"></xsl:call-template>
  </xsl:template>
  
  <xsl:template mode="variablediv" match="*[@outputclass = ('variable')]">
    <xsl:message> + [DEBUG] variablediv: Handling <xsl:value-of select="concat(name(..), '/', name(.))"/></xsl:message>
    <tr class="memitem:a0cbc54a3238dea8110e869897b93a4b9">
      <xsl:choose>
        <xsl:when test="sectiondiv/sectiondiv[@outputclass = 'type']/xref">
          <xsl:variable name="keyref"
            select="sectiondiv/sectiondiv[@outputclass = 'type']/xref/@keyref"/>
          <td class="memItemLeft" align="right" valign="top">
            <a class="anchor" id="a0cbc54a3238dea8110e869897b93a4b9"/>
            <a class="el" href="{$keyref}.html">
              <xsl:value-of select="sectiondiv/sectiondiv/*[@outputclass = 'compound']/text()"/>
            </a>
          </td>
        </xsl:when>
        <xsl:otherwise>
          <td class="memItemLeft" align="right" valign="top">
            <xsl:value-of select="sectiondiv/sectiondiv[@outputclass = 'type']/text()"/>
          </td>
        </xsl:otherwise>
      </xsl:choose>
      <td class="memItemRight" valign="bottom">
        <a class="el" href="structovr_d3_d11_texture_data.html#a0cbc54a3238dea8110e869897b93a4b9">
          <xsl:value-of select="sectiondiv/*[@outputclass = 'name']/text()"/>
        </a>
      </td>
    </tr>
    <xsl:if test="not(matches(normalize-space(sectiondiv[@outputclass = 'briefdescription']), '^\s*$'))">
      <!-- Don't put out the row if there's no text. -->
      <tr class="memdesc:a0cbc54a3238dea8110e869897b93a4b9">
        <td class="mdescLeft">&#xa0;</td>
        <td class="mdescRight">
          <xsl:apply-templates  
            select="sectiondiv[@outputclass = 'briefdescription']"/>
        </td>
      </tr>
    </xsl:if>
    <tr class="separator:a0cbc54a3238dea8110e869897b93a4b9">
      <td class="memSeparator" colspan="2"/>
    </tr>
  </xsl:template>
  <!-- end Data Fields -->
  
  
  <!-- start Detailed Description -->
  <xsl:template name="detailedDescription">
    <h2 class="groupheader">Detailed Description</h2>
    
    <xsl:call-template name="memberFunctionDocumentation"></xsl:call-template>    
  </xsl:template>  
  <!-- end Detailed Description -->


  <!-- start Member Function Documentation -->
  <xsl:template name="memberFunctionDocumentation">
    <h2 class="groupheader">Member Function Documentation</h2>
  </xsl:template>
  <!-- end Member Function Documentation -->
  
  
  
  <xsl:template match="*[@outputclass = ('collaborationgraph')]" />

  <xsl:template match="*[contains(@class, ' topic/sectiondiv ')][@outputclass = 'name']">
    <!-- FIXME: Need to generate link to the corresponding definition of the thing. -->
    <b>
      <xsl:apply-templates/>
    </b>
  </xsl:template>

</xsl:stylesheet>
