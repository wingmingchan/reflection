<%@ include file = "../functions.jsp" %>
<%@ page import  = "com.cms.workflow.function.*" %>
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
		"AbstractTrigger",
		"AssignStepIfUser",
		"AssignToGroupOwningAsset",
		"AssignToSpecifiedGroup",
		"AssignToWorkflowOwner",
		"CopyFolder$CopyFolderTriggerWorker",
		"CopyFolder",
		"CreateNewWorkflowsTrigger$AssetDefPair",
		"CreateNewWorkflowsTrigger$AssetToBeCreatedInfo",
		"CreateNewWorkflowsTrigger$IdPathPair",
		"CreateNewWorkflowsTrigger",
		"Delete",
		"DeleteAndUnpublish",
		"DeleteParentFolderTrigger",
		"EmailProvider$RecipientInfo",
		"EmailProvider",
		"InternalWorkflowTriggerProvider",
		"Merge",
		"PreserveCurrentUser",
		"PublishContainingPublishSetTrigger",
		"Publisher",
		"PublishParentFolderTrigger",
		"PublishSetTrigger",
		"Version",
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