<%@ include file = "../functions.jsp" %>
<%@ page import  = "com.hannonhill.cascade.api.adapters.*" %>
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
		"APIAdapterFactory",
		"APIAdapterUtil",
		"AssetFactoryAPIAdapter",
		"BaseAssetAPIAdapter",
		"BlockAPIAdapter",
		"DestinationAPIAdapter",
		"DestinationContainerAPIAdapter",
		"DynamicMetadataFieldImpl",
		"FeedBlockAPIAdapter",
		"FileAPIAdapter",
		"FilenameNormalizerImpl",
		"FolderAPIAdapter",
		"FolderContainedAssetAPIAdapter",
		"FormatAPIAdapter",
		"FTPTransportAPIAdapter",
		"IdentifierImpl",
		"IndexBlockAPIAdapter",
		"MetadataAPIAdapter",
		"MetadataAwareAssetAPIAdapter",
		"NamedAssetAPIAdapter",
		"PageAPIAdapter",
		"PageConfigurationAPIAdapter",
		"PathIdentifierImpl",
		"PathImpl",
		"PermissionsCapableAssetAPIAdapter",
		"PublishableAssetAPIAdapter",
		"ReferenceAPIAdapter",
		"ScriptFormatAPIAdapter",
		"SiteDestinationContainerAPIAdapter",
		"StructuredDataNodeAPIAdapter",
		"StructuredDataNodeAPIAdapter$1",
		"StructuredDataNodeAPIAdapter$2",
		"SymlinkAPIAdapter",
		"TargetAPIAdapter",
		"TemplateAPIAdapter",
		"TextBlockAPIAdapter",
		"TwitterFeedBlockAPIAdapter",
		"UserAPIAdapter",
		"UtilityProviderImpl",
		"XHTMLDataDefinitionBlockAPIAdapter",
		"XMLBlockAPIAdapter",
		"XSLTFormatAPIAdapter",
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