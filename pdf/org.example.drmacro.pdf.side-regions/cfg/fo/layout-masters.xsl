<?xml version="1.0"?>
<!-- Overrides to provide side regions on the pages. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    
    <xsl:template name="createLayoutMasters">
      <xsl:call-template name="createDefaultLayoutMasters"/>
    </xsl:template>

    <xsl:template name="createDefaultLayoutMasters">
        <fo:layout-master-set>
            <!-- Frontmatter simple masters -->
            <fo:simple-page-master master-name="front-matter-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"
                  
                />
            </fo:simple-page-master>

            <fo:simple-page-master master-name="front-matter-first-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
                <fo:region-before  region-name="even-frontmatter-header"
                   xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-frontmatter-footer"
                   xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>

            <fo:simple-page-master master-name="front-matter-first-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
                <fo:region-before  region-name="odd-frontmatter-header"
                   xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-frontmatter-footer"
                   xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>

            <fo:simple-page-master master-name="front-matter-last" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
                <fo:region-before  region-name="last-frontmatter-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="last-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
                  <fo:region-start extent="{$page-margin-inside}"/>
                  <fo:region-end extent="{$page-margin-outside}"/>
            </fo:simple-page-master>

            <xsl:if test="$mirror-page-margins">
              <fo:simple-page-master master-name="front-matter-even" xsl:use-attribute-sets="simple-page-master">
                  <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
                  <fo:region-before region-name="even-frontmatter-header" xsl:use-attribute-sets="region-before"/>
                  <fo:region-after region-name="even-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
                  <fo:region-start extent="{$page-margin-inside}"/>
                  <fo:region-end extent="{$page-margin-outside}"/>
              </fo:simple-page-master>
            </xsl:if>

            <fo:simple-page-master master-name="front-matter-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
            </fo:simple-page-master>

            <!--TOC simple masters-->
            <xsl:if test="$mirror-page-margins">
              <fo:simple-page-master master-name="toc-even" xsl:use-attribute-sets="simple-page-master">
                  <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                  <fo:region-before region-name="even-toc-header" xsl:use-attribute-sets="region-before"/>
                  <fo:region-after region-name="even-toc-footer" xsl:use-attribute-sets="region-after"/>
                  <fo:region-start extent="{$page-margin-inside}"/>
                  <fo:region-end extent="{$page-margin-outside}"/>
              </fo:simple-page-master>
            </xsl:if>

            <fo:simple-page-master master-name="toc-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="odd-toc-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-toc-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}"/>
                <fo:region-end extent="{$page-margin-outside}"/>
            </fo:simple-page-master>

            <fo:simple-page-master master-name="toc-last" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                <fo:region-before region-name="even-toc-header" xsl:use-attribute-sets="region-before"
                />
                <fo:region-after region-name="even-toc-footer" xsl:use-attribute-sets="region-after"
                />
                <fo:region-start extent="{$page-margin-inside}"
              />
                <fo:region-end extent="{$page-margin-outside}"
                />
            </fo:simple-page-master>

            <fo:simple-page-master master-name="toc-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="odd-toc-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-toc-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}"/>
                <fo:region-end extent="{$page-margin-outside}"/>
            </fo:simple-page-master>

            <!--BODY simple masters
            
                NOTE: No special masters for first or last pages of the sequence.
                
                Because we have even/odd differences for all page footers, if we
                need specific masters for first and last will need two masters each,
                one for first odd and one for first even, because we are not forcing
                chapters to start on odd pages.
            -->
            <fo:simple-page-master master-name="body-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="body-last" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>

          <xsl:if test="$mirror-page-margins">
              <fo:simple-page-master master-name="body-even" xsl:use-attribute-sets="simple-page-master">
                  <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                  <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"
                />
                  <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"
                />
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
              </fo:simple-page-master>
            </xsl:if>

            <fo:simple-page-master master-name="body-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"
                />
                <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"
                />
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>

            <!--INDEX simple masters-->
            <fo:simple-page-master master-name="index-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
                <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>

            <xsl:if test="$mirror-page-margins">
              <fo:simple-page-master master-name="index-even" xsl:use-attribute-sets="simple-page-master">
                  <fo:region-body xsl:use-attribute-sets="region-body__index.even"/>
                  <fo:region-before region-name="even-index-header" xsl:use-attribute-sets="region-before"/>
                  <fo:region-after region-name="even-index-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
              </fo:simple-page-master>
            </xsl:if>

            <fo:simple-page-master master-name="index-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
                <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>

            <!--GLOSSARY simple masters-->
            <fo:simple-page-master master-name="glossary-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>

            <xsl:if test="$mirror-page-margins">
              <fo:simple-page-master master-name="glossary-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                <fo:region-before region-name="even-glossary-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-glossary-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
              </fo:simple-page-master>
            </xsl:if>

            <fo:simple-page-master master-name="glossary-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
                <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
                <fo:region-start extent="{$page-margin-inside}" background-color="yellow"/>
                <fo:region-end extent="{$page-margin-outside}" background-color="yellow"/>
            </fo:simple-page-master>


            <!--Sequences-->
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'toc-sequence'"/>
            <xsl:with-param name="master-reference" select="'toc'"/>
          </xsl:call-template>
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
          </xsl:call-template>
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'ditamap-body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
            <xsl:with-param name="first" select="false()"/>
            <xsl:with-param name="last" select="false()"/>
          </xsl:call-template>
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'index-sequence'"/>
            <xsl:with-param name="master-reference" select="'index'"/>
            <xsl:with-param name="last" select="false()"/>
          </xsl:call-template>
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'front-matter'"/>
            <xsl:with-param name="master-reference" select="'front-matter'"/>
            <xsl:with-param name="first" select="true()"/>
          </xsl:call-template>
          <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'glossary-sequence'"/>
            <xsl:with-param name="master-reference" select="'glossary'"/>
            <xsl:with-param name="last" select="false()"/>
          </xsl:call-template>
        </fo:layout-master-set>
    </xsl:template>
  
  <!-- Generate a page sequence master -->
  <xsl:template name="generate-page-sequence-master">
    <xsl:param name="master-name"/>
    <xsl:param name="master-reference"/>
    <xsl:param name="first" select="false()"/>
    <xsl:param name="last" select="false()"/>
    <fo:page-sequence-master master-name="{$master-name}">
      <fo:repeatable-page-master-alternatives>
        <xsl:if test="$first">
          <fo:conditional-page-master-reference master-reference="{$master-reference}-first"
                                                odd-or-even="odd"
                                                page-position="first"/>
          <fo:conditional-page-master-reference master-reference="{$master-reference}-first-even"
                                                odd-or-even="even"
                                                page-position="first"/>
        </xsl:if>
        <xsl:if test="$last">
          <fo:conditional-page-master-reference master-reference="{$master-reference}-last"
                                                odd-or-even="even"
                                                page-position="last"
                                                blank-or-not-blank="blank"/>
          <fo:conditional-page-master-reference master-reference="{$master-reference}-last-odd"
                                                odd-or-even="odd"
                                                page-position="last"
                                                blank-or-not-blank="blank"/>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$mirror-page-margins">
            <fo:conditional-page-master-reference master-reference="{$master-reference}-odd"
                                                  odd-or-even="odd"/>
            <fo:conditional-page-master-reference master-reference="{$master-reference}-even"
                                                  odd-or-even="even"/>
          </xsl:when>
          <xsl:otherwise>
            <fo:conditional-page-master-reference master-reference="{$master-reference}-odd"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>
    
  </xsl:template>
  
</xsl:stylesheet>