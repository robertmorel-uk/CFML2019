<cfset itKids = $.content().getKidsIterator() />
<cfif itKids.hasNext()>
    <ul>
        <cfloop condition="itKids.hasNext()">
            <li>
                <cfscript>
                        item = itKids.next();
                        fileid = item.getValue('fileid');
                        if ( item.hasImage() ) {
                        fileMeta = $.getBean('fileMetaData').loadBy(fileid=item.getFileID());
                        //WriteDump(var=fileMeta.getAllValues());
                        WriteOutput('<img src="#item.getImageUrl()#">');
                        } else {
                        WriteOutput('Child page: (#item.getTitle()#), does not have an associated image.');
                        }
                </cfscript>
            </li>
        </cfloop>
    </ul>
</cfif>