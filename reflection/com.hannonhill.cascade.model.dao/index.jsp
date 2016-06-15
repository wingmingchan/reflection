<%@ include file = "../functions.jsp" %>
<%@ page import  = "com.hannonhill.cascade.model.dao.*" %>
<html>
<head>
<% if( null == className ) { %>
<title><%= packageName %></title>
<% } else { %>
<title><%= className %></title>
<% } %>
</head>

<body class="bg_white">
<% if( null == className )
{
	String[] classArray = new String[] {
		"ACLEntryDAO",
		"AssetFactoryContainerDAO",
		"AssetFactoryDAO",
		"AssetStatsDAO",
		"AuditDAO",
		"BlobEntityDAO",
		"BlockDAO",
		"BrokenLinkReportDAO",
		"CascadeDAO",
		"ConfigurationFileDAO",
		"ConnectorContainerDAO",
		"ConnectorDAO",
		"ConnectorPageMappingDAO",
		"ContentTypeContainerDAO",
		"ContentTypeDAO",
		"DAOProvider",
		"DAOProviderHolderBean",
		"DAOProviderImpl",
		"DashboardDAO",
		"DatabasePublishingDAO",
		"DestinationDAO",
		"DynamicMetadataFieldDAO",
		"DynamicMetadataFieldDefinitionDAO",
		"EntityDAO",
		"EntityDAO$Order",
		"EntityRelationDAO",
		"FileDAO",
		"FolderContainedEntityDAO",
		"FolderContentsDAO",
		"FolderDAO",
		"FormatDAO",
		"GroupDAO",
		"HistoryItemDAO",
		"JdbcLexiconDAO",
		"JdbcLexiconDAO$1",
		"LexiconDAO",
		"LockDAO",
		"LoginDAO",
		"MessageDAO",
		"MetadataDAO",
		"MetadataSetContainerDAO",
		"MetadataSetDAO",
		"OptimizeDatabaseDAO",
		"PageConfigurationDAO",
		"PageConfigurationSetContainerDAO",
		"PageConfigurationSetDAO",
		"PageDAO",
		"PageRegionDAO",
		"PermissionsDAO",
		"PreferenceDAO",
		"PublishRequestDAO",
		"PublishSetContainerDAO",
		"PublishSetDAO",
		"PublishSetRecordDAO",
		"RecycleRecordDAO",
		"ReferenceDAO",
		"RoleDAO",
		"SiteDAO",
		"SiteDestinationContainerDAO",
		"StaleFilterDAO",
		"StructuredDataDAO",
		"StructuredDataDefinitionContainerDAO",
		"StructuredDataDefinitionDAO",
		"SymlinkDAO",
		"SystemAreaEntityContainerContentsDAO",
		"SystemAreaEntityContainerDAO",
		"SystemAreaEntityDAO",
		"SystemPropertyDAO",
		"TargetDAO",
		"TemplateDAO",
		"TransportContainerDAO",
		"TransportDAO",
		"UnpublishableEntityDAO",
		"UserDAO",
		"WorkflowActionDAO",
		"WorkflowDAO",
		"WorkflowDefinitionContainerDAO",
		"WorkflowDefinitionDAO",
		"WorkflowHistoryDAO",
		"WorkflowStepDAO",
		"WorkflowTriggerDAO",
		"WorkflowTriggerParameterDAO",
	};
%>
<h1>The <%= packageName %> Package</h1>
<% 
	outputLinks( out, classArray );
	out.print( "<p>" );
} 
else 
{ %>
<h1><%= className %></h1>
<% 
	show( out, packageName, className );
	out.print( "<p>" );
%>
<a href="index.jsp">Back to Index</a> |
<% } %>
<a href="/chanw/reflection/index.jsp">Home</a></p>
</body>
</html>