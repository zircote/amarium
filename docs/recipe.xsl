<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//@title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="//@title"/>
                </h1>
                <ul>
                    <dt>Genre:</dt>
                    <dd>
                        <xsl:value-of select="//@genre"/>
                    </dd>
                    <dt>Year:</dt>
                    <dd>
                        <xsl:value-of select="//@year"/>
                    </dd>
                    <dt>Diffuculty</dt>
                    <dd>
                        <xsl:value-of select="//statistics/diffuculty"/>
                    </dd>
                    <br/>
                    <xsl:for-each select="//statistics/times/time">
                        <dt>
                            <xsl:value-of select="@type"/>
                        </dt>
                        <dd>
                            <xsl:value-of select="."/>
                        </dd>
                    </xsl:for-each>
                </ul>
                <hr/>
                <table>
                    <xsl:for-each select="/recipe/componentGroups[1]/componentGroup">
                        <xsl:sort select="@sequence" data-type="number"/>
                        <tr>
                            <th>Amt </th>
                            <th>Ingredient</th>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <xsl:value-of select="@title"/>
                            </th>
                        </tr>
                        <xsl:for-each select="./component">
                            <xsl:sort select="@sequence" data-type="number"/>
                            <tr>
                                <td>
                                    <xsl:value-of select="@quantity"/>
                                    <xsl:value-of select="@unit"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@name"/>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
                <hr/>
                <ol>
                    <xsl:for-each select="//procedures/procedure">
                        <xsl:sort select="@sequence" data-type="number"/>
                        <dd>
                            <xsl:value-of select="@sequence"/>
                        </dd>
                        <dt>
                            <xsl:value-of select="."/>
                        </dt>
                    </xsl:for-each>
                </ol>
                <hr/>
                <xsl:value-of select="//@copyright"/> &quot; <xsl:value-of select="//@company"/> &quot;<br/>
                <b>Author:</b>
                <xsl:value-of select="//@author"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
