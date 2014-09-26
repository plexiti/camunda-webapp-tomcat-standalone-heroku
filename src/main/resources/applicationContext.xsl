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
            <beans:bean class="java.net.URI" id="dbUrl">
                <beans:constructor-arg>
                    <xsl:attribute name="value">#{systemEnvironment['DATABASE_URL']}</xsl:attribute>
                </beans:constructor-arg>
            </beans:bean>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="beans:bean[@id='dataSource']//beans:property[@name='driverClassName']">
        <beans:property name="driverClassName" value="org.postgresql.Driver"/>
    </xsl:template>

    <xsl:template match="beans:bean[@id='dataSource']//beans:property[@name='url']">
        <beans:property name="url">
            <xsl:attribute name="value">#{ 'jdbc:postgresql://' + @dbUrl.getHost() + ':' + @dbUrl.getPort() + @dbUrl.getPath() }</xsl:attribute>
        </beans:property>
    </xsl:template>

    <xsl:template match="beans:bean[@id='dataSource']//beans:property[@name='username']">
        <beans:property name="username">
            <xsl:attribute name="value">#{ @dbUrl.getUserInfo().split(':')[0] }</xsl:attribute>
        </beans:property>
    </xsl:template>

    <xsl:template match="beans:bean[@id='dataSource']//beans:property[@name='password']">
        <beans:property name="password">
            <xsl:attribute name="value">#{ @dbUrl.getUserInfo().split(':')[1] }</xsl:attribute>
        </beans:property>
    </xsl:template>

</xsl:stylesheet>