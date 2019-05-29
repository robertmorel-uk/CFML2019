<cfset exampleString = "Today is [m]DateFormat(Now(), 'yyyy-mm-dd')[/m]" />
<cfoutput>
    <div>
        #exampleString# <!---will literally output string--->
        #$.setDynamicContent(exampleString)# <!---will output variables--->
    </div>
</cfoutput>
			