	<cfscript>
		<!---Get alt tag else title is alt tag--->
			fileid = sub1.getValue('fileid');
				if ( sub1.hasImage() ) {
					fileMeta = $.getBean('fileMetaData').loadBy(fileid=sub1.getFileID());
				if ( Len(fileMeta.getAltText())){
					writeoutput('alt="#fileMeta.getAltText()#"');
				}
				else{
					writeoutput('alt="#sub1.getMenuTitle()#"');
				}
			}				
	</cfscript>	
	
	<!---Also get by item as shown below--->
	
	   <cfscript>
		<!---Get alt tag else title is alt tag--->
			fileid = local.item.getValue('fileid');
				if ( local.item.hasImage() ) {
					fileMeta = $.getBean('fileMetaData').loadBy(fileid=local.item.getFileID());
						if ( Len(fileMeta.getAltText())){
							writeoutput('alt="#fileMeta.getAltText()#"');
						}
						else{
							writeoutput('alt="#HTMLEditFormat(local.item.getTitle())#"');
						}
				}				
	</cfscript>