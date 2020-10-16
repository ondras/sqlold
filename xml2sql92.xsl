<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:template match="/sql">
		<html>
		<body id="body">
		<xsl:for-each select="table">
			<xsl:text>CREATE TABLE </xsl:text>
			<xsl:value-of select="@title" />
			<xsl:text> (
</xsl:text>
			<xsl:for-each select="row">
				<xsl:text></xsl:text>
				<xsl:value-of select="title" />
				<xsl:text> </xsl:text>
				
				<xsl:if test="type = 'Integer'">
					<xsl:text>INTEGER</xsl:text>
				</xsl:if> 
				
				<xsl:if test="type = 'Byte'">
					<xsl:text>SMALLINT</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Single precision'">
					<xsl:text>REAL</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Double precision'">
					<xsl:text>DOUBLE PRECISION</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'String'">
					<xsl:text>VARCHAR</xsl:text>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@special" />
					<xsl:text>) </xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Text'">
					<xsl:text>CLOB</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Binary'">
					<xsl:text>BLOB</xsl:text>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@special" />
					<xsl:text>) </xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'BLOB'">
					<xsl:text>BLOB</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Date'">
					<xsl:text>DATE</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Time'">
					<xsl:text>TIME</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Datetime'">
					<xsl:text>DATETIME</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Timestamp'">
					<xsl:text>TIMESTAMP</xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Enum'">
					<xsl:text>ENUM</xsl:text>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@special" />
					<xsl:text>) </xsl:text>
				</xsl:if> 

				<xsl:if test="type = 'Set'">
					<xsl:text>SET</xsl:text>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="@special" />
					<xsl:text>) </xsl:text>
				</xsl:if> 
				
				<xsl:text> </xsl:text>

				<xsl:if test="@nn">
					<xsl:text>NOT NULL </xsl:text>
				</xsl:if> 

				<xsl:text>default '</xsl:text>
				<xsl:value-of select="default" />
				<xsl:text>'</xsl:text>
				
				<xsl:if test="not (position()=last())">
					<xsl:text>,
</xsl:text>
				</xsl:if> 
			</xsl:for-each>

			<xsl:for-each select="row">
				<xsl:choose>
					<xsl:when test="@pk">
						<xsl:text>,
</xsl:text>
						<xsl:text>PRIMARY KEY (</xsl:text>
						<xsl:value-of select="title" />
						<xsl:text>)</xsl:text>
					</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>

			</xsl:for-each>
			<xsl:text>
);

</xsl:text>
		</xsl:for-each>
		</body>
		</html>
	</xsl:template>

</xsl:stylesheet>