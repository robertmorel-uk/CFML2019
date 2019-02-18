<cfoutput>
<cfheader name="expires" value="#now()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<!---
The first line says any existing cached items must be expired immediately
The second line informs the browser not to cache
The third line is like telling the browser to do ctrl F5 and always get a fresh copy from the server when loading the page.
--->
</cfoutput>

