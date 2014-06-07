<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

  <xsl:attribute-set name="page__header">
    <xsl:attribute name="text-align">start</xsl:attribute>
    <xsl:attribute name="end-indent">0pt</xsl:attribute>
    <xsl:attribute name="margin-top">10pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="odd__header" use-attribute-sets="page__header"/>

  <xsl:attribute-set name="even__header" use-attribute-sets="page__header"/>

  <xsl:attribute-set name="page__footer">
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="end-indent">0pt</xsl:attribute>
    <xsl:attribute name="margin-bottom">10pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="odd__footer" use-attribute-sets="page__footer"/>

  <xsl:attribute-set name="even__footer" use-attribute-sets="page__footer"/>
  
  <xsl:attribute-set name="pagenum">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>


    <xsl:attribute-set name="__body__odd__footer" use-attribute-sets="odd__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__footer__heading">
      <xsl:attribute name="font-size" select="$default-font-size"/>
      <xsl:attribute name="line-height" select="$default-line-height"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__footer" use-attribute-sets="even__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__footer__heading">
      <xsl:attribute name="font-size" select="$default-font-size"/>
      <xsl:attribute name="line-height" select="$default-line-height"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__header" use-attribute-sets="odd__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__header__heading">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__odd__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header" use-attribute-sets="even__header">
      <xsl:attribute name="text-align" select="'start'"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header__heading">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__header" use-attribute-sets="odd__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__footer" use-attribute-sets="odd__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__header__heading">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__footer__heading">
      <xsl:attribute name="font-size" select="'7pt'"/>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__last__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__last__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__footer" use-attribute-sets="odd__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__footer" use-attribute-sets="even__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__header" use-attribute-sets="odd__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__header" use-attribute-sets="even__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__odd__footer" use-attribute-sets="odd__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__odd__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__even__footer" use-attribute-sets="even__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__even__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__odd__header" use-attribute-sets="odd__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__odd__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__even__header" use-attribute-sets="even__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__even__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__footnote__separator">
        <xsl:attribute name="leader-pattern">rule</xsl:attribute>
        <xsl:attribute name="leader-length">25%</xsl:attribute>
        <xsl:attribute name="rule-thickness">0.5pt</xsl:attribute>
        <xsl:attribute name="rule-style">solid</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__chapter__frontmatter__name__container">
        <xsl:attribute name="font-size">20pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">2pt</xsl:attribute>
        <xsl:attribute name="border-bottom-width">2pt</xsl:attribute>
        <xsl:attribute name="padding-top">10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__chapter__frontmatter__number__container">
        <xsl:attribute name="font-size">40pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__odd__footer" use-attribute-sets="odd__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__odd__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__even__footer" use-attribute-sets="even__footer">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__even__footer__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__odd__header" use-attribute-sets="odd__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__odd__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__even__header" use-attribute-sets="even__header">
    </xsl:attribute-set>

    <xsl:attribute-set name="__glossary__even__header__pagenum" use-attribute-sets="pagenum">
    </xsl:attribute-set>

</xsl:stylesheet>