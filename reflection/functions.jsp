<%@ page import = "java.lang.reflect.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%  
String uri         = request.getRequestURI();
String className   = ( String )request.getParameter( "class" );
String pathName    = uri.substring( 0, uri.lastIndexOf( "/" ) );
String packageName = pathName.substring( pathName.lastIndexOf( "/" ) + 1 );
%>
<%!
void show( javax.servlet.jsp.JspWriter out, String packageName, String className )
{
	try
	{
		showClassInfo( out, packageName, className );
	}
	catch( Exception e )
	{
		e.printStackTrace();
	}
}

void outputLinks( javax.servlet.jsp.JspWriter out, String[] classArray ) throws IOException
{
	out.println( "<ul>" );

	for( int i = 0; i < classArray.length; i++ )
	{
		out.println( "<li><a href='?class=" + classArray[ i ] + "'>" +
			classArray[ i ] + "</a></li>" );
	}
	
	out.println( "</ul>" );
}

void showClassInfo( javax.servlet.jsp.JspWriter out, String packageName, String className ) throws Exception
{
	String pcName = packageName + "." + className;
	
	Class<?> cl = Class.forName( pcName );
	printClass( out, cl );
	
	showClassFields( out, pcName );
	
	out.println( "<h2>Methods</h2><ul>" );
	printConstructors( out, cl );
		
	for( Method m : cl.getDeclaredMethods() )
		printMethod( out, m );
	out.println( "</ul>" );
}

void showClassFields( javax.servlet.jsp.JspWriter out, String className ) throws Exception
{
	Class<?> cl = Class.forName( className );
	Field[] fields = cl.getFields();
	
	if( fields.length > 0 )
	{
		out.print( "<h2>Fields</h2><ul>" );
		
		//for( int i = 0; i < fields.length; i++ )
		for( Field field : fields )
		{
			out.println( "<li>" +
				field.getName() + ": " +
				field.get( null ) + "</li>" );
		}
		
		out.print( "</ul>" );
	}
}

void printClass( 
	javax.servlet.jsp.JspWriter out, Class cl ) throws IOException
{
	out.print( cl );
	printTypes( out, cl.getTypeParameters(), "&lt;", ", ", ">", true );
	Type sc = cl.getGenericSuperclass();
	
	if( sc != null )
	{
		String typeName    = sc.getTypeName();
		String packageName = typeName.substring( 0, typeName.lastIndexOf( "." ) );
		String className   = typeName.substring( typeName.lastIndexOf( "." ) + 1 );		
		
		out.print( ", extends " );
		
		if( !packageName.startsWith( "java." ) )
			out.print( "<a href='" + "/chanw/reflection/" + packageName +
				"/" + "index.jsp?class=" + className + "'>" );
		
		printType( out, sc, false, false );
		
		if( !packageName.startsWith( "java." ) )
			out.print( "</a>" );
	}
	printTypes( out, cl.getGenericInterfaces(), ", implements ", ", ", "", false );
}

void printConstructors( javax.servlet.jsp.JspWriter out, Class cl ) throws IOException
{
	Constructor<?>[] constructors = cl.getConstructors();
	
	if( constructors.length > 0 )
	{
		for( Constructor c: constructors )
		{
			out.print( "<li>" + 
				Modifier.toString( c.getModifiers() ) + " " +
				cl.getName() + "("
			);
		
			Class<?>[] array = c.getParameterTypes();

			if( array.length > 0 )
			{
				out.print( " " );
				
				for( int i = 0; i < array.length; i++ )
				{
					out.print( array[ i ].toString() );
					
					if( i < array.length - 1 )
					{
						out.print( ", " );
					}
				}
				out.print( " " );
			}

			out.println( ")</li>" );
		}
	}
}

void printMethod( javax.servlet.jsp.JspWriter out, Method m ) throws IOException
{
	String name = m.getName();
	out.print( "<li>" + Modifier.toString( m.getModifiers() ) );
	out.print( " " );
	printTypes( out, m.getTypeParameters(), "&lt;", ", ", "> ", true );

	printType( out, m.getGenericReturnType(), false, false );
	out.print( " " );
	out.print( name );
	out.print( "(" );
	printTypes( out, m.getGenericParameterTypes(), " ", ", ", " ", false );
	out.println( ")" + "</li>" );
}

void printTypes( javax.servlet.jsp.JspWriter out,
	Type[] types, String pre, String sep, String suf,
	boolean isDefinition ) throws IOException
{
	if( pre.equals( " extends " ) && 
		Arrays.equals( types, new Type[] { Object.class } ) ) return;
		
	if( types.length > 0 ) out.print( pre );
	
	for( int i = 0; i < types.length; i++ )
	{
		if( i > 0 ) out.print( sep );
		printType( out, types[i], isDefinition, false );
	}
	
	if( types.length > 0 ) out.print( suf );
}
    
void printType( javax.servlet.jsp.JspWriter out, Type type, boolean isDefinition, boolean isTitle ) 
	throws IOException
{
	if( type instanceof Class )
	{
		Class t = ( Class ) type;

		String typeName    = type.getTypeName();
		String packageName = "";
		String className   = "";
	
		if( isTitle == true )
		{
			packageName = typeName.substring( 0, typeName.lastIndexOf( "." ) );
			className   = typeName.substring( typeName.lastIndexOf( "." ) + 1 );
		}
	
		if( isTitle && !packageName.startsWith( "java." ) )
			out.print( "<a href='" + "/chanw/reflection/" + packageName +
				"/" + "index.jsp?class=" + className + "'>" );

		out.print( t.getName() );

		if( isTitle && !packageName.startsWith( "java." ) )
			out.print( "</a>" );

	}
	else if( type instanceof TypeVariable )
	{
		TypeVariable t = ( TypeVariable ) type;
		out.print( t.getName() );
		
		if( isDefinition )
			printTypes( out, t.getBounds(), " extends ", " & ", "", false );
	}
	else if( type instanceof WildcardType )
	{
		WildcardType t = ( WildcardType ) type;
		out.print( "?" );
		printTypes( out, t.getUpperBounds(), " extends ", " & ", "", false );
		printTypes( out, t.getLowerBounds(), " super ", " & ", "", false );
	}
	else if( type instanceof ParameterizedType )
	{
		ParameterizedType t = ( ParameterizedType ) type;
		Type owner = t.getOwnerType();
		
		if( owner != null )
		{
			printType( out, owner, false, false );
			out.print( "." );
		}
		printType( out, t.getRawType(), false, false );
		printTypes( out, t.getActualTypeArguments(), "&lt;", ", ", ">", false );
	}
	else if( type instanceof GenericArrayType )
	{
		GenericArrayType t = ( GenericArrayType ) type;
		out.print( "" );
		printType( out, t.getGenericComponentType(), isDefinition, false );
		out.print( "[]" );
	}
}
%>