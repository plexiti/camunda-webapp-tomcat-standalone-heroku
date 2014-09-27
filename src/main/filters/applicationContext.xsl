<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:beans="http://www.springframework.org/schema/beans"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:output indent="yes" omit-xml-declaration="yes" method="xml"/>
    <xsl:namespace-alias stylesheet-prefix="beans" result-prefix="#default"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="beans:beans">
        <xsl:copy>
            <xsl:attribute name="xsi:schemaLocation">http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd</xsl:attribute>
            <beans:import resource="dataSource.xml"/>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="beans:bean[@id='dataSource']"/>

</xsl:stylesheet>