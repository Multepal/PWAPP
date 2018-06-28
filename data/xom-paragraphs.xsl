<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    <xsl:variable name="themes_ajax_root">http://multepal.spanitalport.virgina.edu/api/temas/</xsl:variable>

    <!-- Not sure if this is doing anything -->
    <xsl:strip-space elements="p" /> 

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;        
        </xsl:text>
<html>
            <head>
                <title>Popol Vuh, Multepal Edition, Paragraphs</title>
                <link rel="stylesheet" type="text/css" href="xom-paragraphs.css"> </link>
                <script src="https://code.jquery.com/jquery-3.3.1.min.js" 
                    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
                    crossorigin="anonymous"> </script>
                <script src="xom-paragraphs.js"> </script>
            </head>
            <body>
                <!--
                <div>
                    <xsl:apply-templates select="//tei:text//tei:body//tei:div[@xml:lang='quc']"/>
                </div>
                <div>
                    <xsl:apply-templates select="//tei:text//tei:body//tei:div[@xml:lang='spa']"/>
                </div>
                -->
                <xsl:apply-templates select="//tei:text//tei:body"/>
                <script>
                for (p in document.getElementsByName('p')) {
                    p.value.replace("-", "FOO")
                }
                </script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:div[@xml:lang='quc']">
        <div class="col quc" xml:lang="quc">
            <b>K'iche'</b>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@xml:lang='spa']">
        <div class="col spa" xml:lan="spa">
            <b>Castellano</b>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:p">
        <p><xsl:apply-templates /></p>
    </xsl:template>

    <!--
    <xsl:template match="tei:lb[@n]">
        <span class="lb"><xsl:value-of select="@n"/></span>    
    </xsl:template>
    -->
    
    <xsl:template match="tei:pc">
        <xsl:text>-</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <span class="pb">
            <xsl:text>&#x25C4;</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:value-of select="@corresp"/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <span class="note {@resp} {@place}"><xsl:apply-templates /></span>
    </xsl:template>
    
    <xsl:template match="tei:rs">
        <span class="rs" data-ana="{@ana}"><xsl:apply-templates /></span>
    </xsl:template>
    
    <xsl:template match="tei:corr">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:hi">
        <span class="hi {@rend}"><xsl:apply-templates /></span>
    </xsl:template>

    <xsl:template match="tei:num">
        <span class="num {@rend}"><xsl:apply-templates /></span>
    </xsl:template>

    <xsl:template match="tei:del">
        <span class="del {@rend}"><xsl:apply-templates /></span>
    </xsl:template>

    <!--
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()" />
    </xsl:template>
    -->

</xsl:stylesheet>