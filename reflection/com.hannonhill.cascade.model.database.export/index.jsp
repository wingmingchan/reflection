<%@ include file = "../functions.jsp" %>
<%@ page import  = "com.hannonhill.cascade.model.database.export.*" %>
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
		"CascadeFlatXmlProducer",
		"CascadeMsSqlDataTypeFactory",
		"CascadeMySQLDataTypeFactory",
		"DatabaseMigrationService",
		"DatabaseMigrationServiceImpl",
		"DatabaseMigrator",
		"DatabaseMigratorFactory",
		"DatabaseMigratorFactory$1",
		"DatabaseParameters",
		"DemoExport",
		"MSSqlXMLMigrator",
		"MySqlXMLMigrator",
		"MySqlXMLMigrator$Constraint",
		"OracleXMLMigrator",
		"SystemImport",
		"XMLDatabaseMigrator",
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