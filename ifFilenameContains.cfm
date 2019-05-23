<!---Does current filename contain product--->
<cfset var curFileName = #$.content().getFileName()#>
<cfset var isProductChild = FindNoCase("Product",curFileName)>
<cfif #isProductChild# NEQ 0><!---if filename contains product--->
	123
<cfelse>
	456
</cfif>