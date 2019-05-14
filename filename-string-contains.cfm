	<!---Does URL contain string?--->
	<cfset pageTitle="#$.content().getFilename()#">
	<cfset nInString = find( "products/download-documents/", pageTitle )>
	<cfif #nInString# GT 0>Filename: #pageTitle# contains string</cfif>