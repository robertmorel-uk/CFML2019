<cfoutput>
    <article>
        #$.content('summary')#<!---Outputs summary as literal string--->
        #$.setDynamicContent($.content('summary'))#<!---Output summary that contains variables or functions---->
    </article>
</cfoutput>