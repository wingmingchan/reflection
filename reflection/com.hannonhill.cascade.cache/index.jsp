<%@ include file = "../functions.jsp" %>
<%@ page import  = "com.hannonhill.cascade.cache.*" %>
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
		"BaseCache",
		"BaseEhcacheIndexBlockRenderCache",
		"CascadeEhCacheManagerFactoryBean",
		"DefaultEhcacheIndexBlockRenderCache",
		"IndexBlockRenderCache",
		"IndexBlockRenderCacheFactory",
		"IndexBlockRenderCacheKey",
		"IndexBlockRenderCacheValue",
		"IndexBlockRenderPropertiesCache",
		"IndexBlockRenderPropertiesCacheKey$IndexBlockRenderPropertiesCacheKeyType",
		"IndexBlockRenderPropertiesCacheKey",
		"NewMenuCache",
		"NewMenuCacheKey",
		"OldIndexBlockRenderCache",
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