<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:d="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt"
                xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20"
                xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal" ddwrt:oob="true">
  <xsl:output method="html" indent="no"/>
	<xsl:key name="title" match="Row" use="@Title.groupindex" />
	<xsl:template match="/dsQueryResponse/Rows" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:d="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls" ddwrt:ghost="" xmlns:ddwrt2="urn:frontpage:internal">
		<style type="text/css">
.ms-bodyareacell {
  background-color: #E0E0E0;
}

}
.dd {
  max-width: 100%;
  margin: 0 auto;
  display: block;
  vertical-align: top;
}

ol {
  transition: border-color 2s ease, all 0.1s ease;
}

ol.list {
  padding-top: 2em;
  padding-left: 15px;
  max-width: 650px;
  margin: 0 auto;
  border-left: 2px solid #29B6F6;
}

ol.list .text {
  float: right;
  width: 60%;
}

ol.list h3 {
  float: left;
  width: 30%;
}

ol.list &gt; li,
ol.list &gt; h3 {
  max-width: 600px;
  margin: 0 auto;
}

ol.list &gt; h2 {
  padding-bottom: 6px;
}		
		
.dd h2 {
  margin-left: 5px;
}

.dd h2 {
  color: #607D8B;
}		
		
.dd-item:hover {
  color: #00838F;
  border-collapse: separate;
  will-change: box-shadow;
  transition: box-shadow .2s cubic-bezier(.4, 0, 1, 1), background-color .2s cubic-bezier(.4, 0, .2, 1), color .2s cubic-bezier(.4, 0, .2, 1);
  box-shadow: 0 5px 6px 0 rgba(0, 0, 0, .14), 0 3px 1px -6px rgba(0, 0, 0, .2), 2px 5px 3px 0 rgba(0, 0, 0, .12);
  filter: progid:DXImageTransform.Microsoft.Shadow(Color=#aaaaaa, Direction=160, Strength=3);
}		
		
ol.kanban {
  border-top: 5px solid #78909C;
  width: 20%;
  height: auto;
  margin: 1%;
  max-width: 250px;
  min-width: 120px;
  display: inline-block;
  vertical-align: top;
  border-collapse: separate;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, .14), 0 3px 1px -2px rgba(0, 0, 0, .2), 0 1px 5px 0 rgba(0, 0, 0, .12);
  filter: progid:DXImageTransform.Microsoft.Shadow(Color=#aaaaaa, Direction=160, Strength=3);
  flex-direction: column;
  min-height: 200px;
  z-index: 1;
  position: relative;
  background: #fff;
  padding: 1em;
  border-radius: 2px;
}

.dd-item {
  display: block;
  position: relative;
  list-style: none;
  min-height: 48px;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  font-size: 16px;
  min-height: 120px;
  overflow: hidden;
  z-index: 1;
  position: relative;
  background: #fff;
  border-radius: 2px;
  box-sizing: border-box;
}

.title {
  align-self: flex-end;
  color: inherit;
  display: block;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  line-height: normal;
  overflow: hidden;
  -webkit-transform-origin: 149px 48px;
  transform-origin: 149px 48px;
  margin: 0;
}

.text {
  color: grey;
  border-top: 1px solid font-size: 1rem;
  font-weight: 400;
  line-height: 18px;
  overflow: hidden;
  padding: 16px;
  width: 90%;
}		
		
.dd {
  position: relative;
  display: block;
  list-style: none;
}

.dd-list {
  display: block;
  position: relative;
  margin: 0;
  padding: 0;
  list-style: none;
}

.dd-list .dd-list {
  padding-left: 30px;
}

.dd-item {
  display: block;
  margin: 5px 0;
  padding: 5px 10px;
  color: #333;
  text-decoration: none;
  font-weight: bold;
  border: 1px solid #ccc;
  background: #fafafa;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  border-right: 5px solid green;
}

.overdue {
	border-right: 5px solid red;
}
		</style> <div class="dd">
			<xsl:apply-templates select="Row[generate-id(.)=generate-id(key('title', @Title.groupindex))]" />
		</div>
	</xsl:template>
	
	<xsl:template match="Row[@Title.groupindex]">
		<ol class="kanban">
		<div class="kanban__title">
			<h2><xsl:value-of select="@Title" /></h2>
			<xsl:for-each select="key('title', @Title.groupindex)">
				<li>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="ddwrt:DateTimeTick(ddwrt:GenDisplayName(string(@DueDate))) &lt; ddwrt:DateTimeTick(string(ddwrt:Today()))">overdue dd-item</xsl:when>
							<xsl:otherwise>dd-item</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<a href="{@WorkflowLink}">
						<h3 class="title dd-handle"><xsl:value-of select="@WorkflowLink.desc" /></h3>
					</a>
					<div class="text"><xsl:value-of select="@AssignedTo" disable-output-escaping="yes" /><br /><xsl:value-of select="@DueDate" /></div>
				</li>
			</xsl:for-each>
		</div>
		</ol>
	</xsl:template>
</xsl:stylesheet>
