<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="2.0">

  <!-- common attribute sets -->
  
  <xsl:attribute-set name="body_header_pubtitle">
    <xsl:attribute name="font-size" select="'7pt'"/>
    <xsl:attribute name="font-family" select="'serif'"/>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__top">
    <xsl:attribute name="border-top-style">solid</xsl:attribute>
    <xsl:attribute name="border-top-width">1pt</xsl:attribute>
    <xsl:attribute name="border-top-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__bottom">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__right">
    <xsl:attribute name="border-right-style">solid</xsl:attribute>
    <xsl:attribute name="border-right-width">1pt</xsl:attribute>
    <xsl:attribute name="border-right-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.border__left">
    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="table__tableframe__all" use-attribute-sets="table__tableframe__topbot">
    <!-- Remove reference to side frame attributes -->
  </xsl:attribute-set>

  <xsl:attribute-set name="thead.row.entry">
    <!--head cell-->
    <xsl:attribute name="background-color">lightblue</xsl:attribute>
  </xsl:attribute-set>
 
  <!-- See instructions in DITA For Print on how to customize table rules and borders. -->

  <xsl:attribute-set name="table.frame__left">
    <xsl:attribute name="border-left-style">none</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="table.frame__right">
    <xsl:attribute name="border-left-style">none</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.frame__top">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.frame__bottom">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.rule__bottom">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.rule__top">
    <xsl:attribute name="border-top-style">solid</xsl:attribute>
    <xsl:attribute name="border-top-width">1pt</xsl:attribute>
    <xsl:attribute name="border-top-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.rule__bottom">
    <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
    <xsl:attribute name="border-bottom-width">1pt</xsl:attribute>
    <xsl:attribute name="border-bottom-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.rule__right">
    <xsl:attribute name="border-right-style">solid</xsl:attribute>
    <xsl:attribute name="border-right-width">1pt</xsl:attribute>
    <xsl:attribute name="border-right-color">black</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="table.rule__left">
    <xsl:attribute name="border-left-style">solid</xsl:attribute>
    <xsl:attribute name="border-left-width">1pt</xsl:attribute>
    <xsl:attribute name="border-left-color">black</xsl:attribute>
  </xsl:attribute-set>


  <xsl:attribute-set name="common.border" use-attribute-sets="common.border__top common.border__right common.border__bottom common.border__left"/>

  <xsl:attribute-set name="base-font">
    <xsl:attribute name="font-size" select="$default-font-size"/>
  </xsl:attribute-set>

  <!-- titles -->
  <xsl:attribute-set name="common.title">
    <xsl:attribute name="font-family" select="'Arial', sans-serif"/>
  </xsl:attribute-set>

  <!-- paragraph-like blocks -->
  <xsl:attribute-set name="common.block">
    <xsl:attribute name="space-before">10pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="common.link">
    <xsl:attribute name="color">blue</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>

  <!-- common element specific attribute sets -->

    <xsl:attribute-set name="tm">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tm__content">
        <xsl:attribute name="font-size">75%</xsl:attribute>
        <xsl:attribute name="baseline-shift">20%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tm__content__service">
        <xsl:attribute name="font-size">40%</xsl:attribute>
        <xsl:attribute name="baseline-shift">50%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="author">
    </xsl:attribute-set>

    <xsl:attribute-set name="source">
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.title" use-attribute-sets="common.title">
		    <xsl:attribute name="border-bottom">0pt solid #FCFCFC</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.title__content">
        <xsl:attribute name="line-height">100%</xsl:attribute>
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.title__content">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.title__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="start-indent" select="$side-col-width"/>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.title__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent" select="$side-col-width"/>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.title__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent" select="$side-col-width"/>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="related-links.title" use-attribute-sets="common.title">
		  <xsl:attribute name="font-weight">bold</xsl:attribute>
		  <xsl:attribute name="space-before">12pt</xsl:attribute>
	   </xsl:attribute-set>

    <xsl:attribute-set name="fig">
      <xsl:attribute name="space-before">12pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic" use-attribute-sets="base-font">
    </xsl:attribute-set>

    <xsl:attribute-set name="titlealts" use-attribute-sets="common.border">
        <xsl:attribute name="background-color">#f0f0d0</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="navtitle" use-attribute-sets="common.title">
    </xsl:attribute-set>

    <xsl:attribute-set name="navtitle__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="searchtitle">
    </xsl:attribute-set>

    <xsl:attribute-set name="searchtitle__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="body__toplevel" use-attribute-sets="base-font">
        <xsl:attribute name="start-indent" select="$side-col-width"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="body__secondLevel" use-attribute-sets="base-font">
        <xsl:attribute name="start-indent" select="$side-col-width"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="body" use-attribute-sets="base-font">
        <xsl:attribute name="start-indent" select="$side-col-width"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="abstract" use-attribute-sets="body">
    </xsl:attribute-set>

    <xsl:attribute-set name="shortdesc">
    </xsl:attribute-set>

    <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body">
    </xsl:attribute-set>

    <xsl:attribute-set name="section" use-attribute-sets="base-font">
        <xsl:attribute name="line-height" select="$default-line-height"/>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="section__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="example" use-attribute-sets="base-font common.border">
        <xsl:attribute name="line-height" select="$default-line-height"/>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="example__content">
    </xsl:attribute-set>

    <xsl:attribute-set name="desc">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="prolog" use-attribute-sets="base-font">
        <xsl:attribute name="start-indent">72pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="p" use-attribute-sets="common.block">
        <xsl:attribute name="text-indent">0em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq" use-attribute-sets="base-font common.border">
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="padding-left">6pt</xsl:attribute>
        <xsl:attribute name="start-indent">92pt</xsl:attribute>
        <xsl:attribute name="end-indent">92pt</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq_simple" use-attribute-sets="base-font common.border">
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="padding-left">6pt</xsl:attribute>
        <xsl:attribute name="start-indent">92pt</xsl:attribute>
        <xsl:attribute name="end-indent">92pt</xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq_link" use-attribute-sets="base-font common.link">
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="end-indent">92pt</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lq_title" use-attribute-sets="base-font">
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="end-indent">92pt</xsl:attribute>
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="q">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="figgroup">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>
  
    <xsl:attribute-set name="fig.title-and-desc">
      <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="fig.body">
      <xsl:attribute name="border">solid 0pt white</xsl:attribute>
      <xsl:attribute name="padding">0pt</xsl:attribute>
      <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>
  
  <xsl:attribute-set name="figure.label" use-attribute-sets="common.title">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>

    <xsl:attribute-set name="note" use-attribute-sets="common.block">
      <xsl:attribute name="padding-before" select="'2pt'"/>
      <xsl:attribute name="padding-after" select="'2pt'"/>
      <xsl:attribute name="space-after" select="'12pt'"/>
      <xsl:attribute name="margin-bottom" select="'4pt'"/>
      <xsl:attribute name="border-before-style" select="'solid'"/>
      <xsl:attribute name="border-before-width" select="'0.5pt'"/>
      <xsl:attribute name="border-before-color" select="'black'"/>
      <xsl:attribute name="border-after-style" select="'solid'"/>
      <xsl:attribute name="border-after-width" select="'0.5pt'"/>
      <xsl:attribute name="border-after-color" select="'black'"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__table" use-attribute-sets="common.block">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__image__column">
        <xsl:attribute name="column-number">1</xsl:attribute>
        <xsl:attribute name="column-width">32pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__text__column">
      <xsl:attribute name="column-number">2</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__image__entry">
        <xsl:attribute name="padding-right">5pt</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__text__entry">
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label">
      <xsl:attribute name="border-left-width">0pt</xsl:attribute>
      <xsl:attribute name="border-right-width">0pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="font-family" select="'sans-serif'"/>
      <xsl:attribute name="font-variant" select="'small-caps'"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__note">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__notice">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__tip">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__fastpath">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__restriction">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__important">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__remember">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__attention">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__caution">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__danger">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__warning">
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__other">
    </xsl:attribute-set>

    <xsl:attribute-set name="pre" use-attribute-sets="base-font common.block">
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
        <xsl:attribute name="font-family">monospace</xsl:attribute>
        <xsl:attribute name="line-height">106%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__spectitle">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__border__top">
        <xsl:attribute name="border-top-color">black</xsl:attribute>
        <xsl:attribute name="border-top-width">thin</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__border__bot">
        <xsl:attribute name="border-bottom-color">black</xsl:attribute>
        <xsl:attribute name="border-bottom-width">thin</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__border__sides">
        <xsl:attribute name="border-left-color">black</xsl:attribute>
        <xsl:attribute name="border-left-width">thin</xsl:attribute>
        <xsl:attribute name="border-right-color">black</xsl:attribute>
        <xsl:attribute name="border-right-width">thin</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__border__all" use-attribute-sets="common.border">
    </xsl:attribute-set>

    <xsl:attribute-set name="lines" use-attribute-sets="base-font">
        <xsl:attribute name="space-before">0.8em</xsl:attribute>
        <xsl:attribute name="space-after">0.8em</xsl:attribute>
<!--        <xsl:attribute name="white-space-treatment">ignore-if-after-linefeed</xsl:attribute>-->
        <xsl:attribute name="white-space-collapse">true</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="keyword">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="term">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ph">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="boolean">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="color">green</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="state">
        <xsl:attribute name="border-left-width">0pt</xsl:attribute>
        <xsl:attribute name="border-right-width">0pt</xsl:attribute>
        <xsl:attribute name="color">red</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="alt">
    </xsl:attribute-set>

    <xsl:attribute-set name="object">
    </xsl:attribute-set>

    <xsl:attribute-set name="param">
    </xsl:attribute-set>

    <xsl:attribute-set name="draft-comment" use-attribute-sets="common.border">
        <xsl:attribute name="background-color">#FF99FF</xsl:attribute>
        <xsl:attribute name="color">#CC3333</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="draft-comment__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="required-cleanup">
        <xsl:attribute name="background">yellow</xsl:attribute>
        <xsl:attribute name="color">#CC3333</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="required-cleanup__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fn">
        <xsl:attribute name="font-size">8pt</xsl:attribute>
        <xsl:attribute name="color">purple</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fn__id">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fn__callout">
        <xsl:attribute name="keep-with-previous.within-line">always</xsl:attribute>
        <xsl:attribute name="baseline-shift">super</xsl:attribute>
        <xsl:attribute name="font-size">75%</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fn__body" use-attribute-sets="base-font">
        <xsl:attribute name="provisional-distance-between-starts">8mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">2mm</xsl:attribute>
        <xsl:attribute name="line-height">1.2</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__align__left">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="display-align">before</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__align__right">
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="display-align">before</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__align__center">
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="display-align">before</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__align__justify">
        <xsl:attribute name="text-align">justify</xsl:attribute>
        <xsl:attribute name="display-align">before</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="indextermref">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="cite">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="concept">
    </xsl:attribute-set>

    <xsl:attribute-set name="conbody" use-attribute-sets="body">
    </xsl:attribute-set>

    <xsl:attribute-set name="topichead">
    </xsl:attribute-set>

    <xsl:attribute-set name="topicgroup">
    </xsl:attribute-set>

    <xsl:attribute-set name="topicmeta">
    </xsl:attribute-set>

    <xsl:attribute-set name="searchtitle">
    </xsl:attribute-set>

    <xsl:attribute-set name="searchtitle__label">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="publisher">
    </xsl:attribute-set>

    <xsl:attribute-set name="copyright">
    </xsl:attribute-set>

    <xsl:attribute-set name="copyryear">
    </xsl:attribute-set>

    <xsl:attribute-set name="copyrholder">
    </xsl:attribute-set>

    <xsl:attribute-set name="critdates">
    </xsl:attribute-set>

    <xsl:attribute-set name="created">
    </xsl:attribute-set>

    <xsl:attribute-set name="revised">
    </xsl:attribute-set>

    <xsl:attribute-set name="permissions">
    </xsl:attribute-set>

    <xsl:attribute-set name="category">
    </xsl:attribute-set>

    <xsl:attribute-set name="audience">
    </xsl:attribute-set>

    <xsl:attribute-set name="keywords">
    </xsl:attribute-set>

    <xsl:attribute-set name="prodinfo">
    </xsl:attribute-set>

    <xsl:attribute-set name="prodname">
    </xsl:attribute-set>

    <xsl:attribute-set name="vrmlist">
    </xsl:attribute-set>

    <xsl:attribute-set name="vrm">
    </xsl:attribute-set>

    <xsl:attribute-set name="brand">
    </xsl:attribute-set>

    <xsl:attribute-set name="series">
    </xsl:attribute-set>

    <xsl:attribute-set name="platform">
    </xsl:attribute-set>

    <xsl:attribute-set name="prognum">
    </xsl:attribute-set>

    <xsl:attribute-set name="featnum">
    </xsl:attribute-set>

    <xsl:attribute-set name="component">
    </xsl:attribute-set>

    <xsl:attribute-set name="othermeta">
    </xsl:attribute-set>

    <xsl:attribute-set name="resourceid">
    </xsl:attribute-set>

    <xsl:attribute-set name="reference">
    </xsl:attribute-set>

    <xsl:attribute-set name="refbody" use-attribute-sets="body">
    </xsl:attribute-set>

    <xsl:attribute-set name="refsyn">
    </xsl:attribute-set>

    <xsl:attribute-set name="metadata">
    </xsl:attribute-set>

    <xsl:attribute-set name="image__float">
    </xsl:attribute-set>

    <xsl:attribute-set name="image__block">
    </xsl:attribute-set>

    <xsl:attribute-set name="image__inline">
    </xsl:attribute-set>

    <xsl:attribute-set name="image">
    </xsl:attribute-set>

    <xsl:attribute-set name="flag.image" use-attribute-sets="image">
    </xsl:attribute-set>

    <xsl:attribute-set name="__unresolved__conref">
        <xsl:attribute name="color">#CC3333</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__fo__root" use-attribute-sets="base-font">
        <xsl:attribute name="font-family" select="'Arial', 'sans-serif'"/>
        <xsl:attribute name="xml:lang" select="translate($locale, '_', '-')"/>
        <xsl:attribute name="writing-mode" select="$writing-mode"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__force__page__count">
      <!-- Don't force chapters to start on odd pages. -->
      <xsl:attribute name="force-page-count" select="'auto'"/>        
    </xsl:attribute-set>

</xsl:stylesheet>
