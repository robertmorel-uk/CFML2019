		<cfscript>
		<!---Set alt tag to be user defined or title as fallback--->
		function altAltTags(getFileIdVal){
					fileid = sub1.getValue('fileid');
						if ( sub1.hasImage() ) {
							fileMeta = getFileIdVal;
								if ( Len(fileMeta.getAltText())){
									writeoutput('alt="#fileMeta.getAltText()#"');
								}
								else{
									writeoutput('alt="#sub1.getMenuTitle()#"');
								}
						}		
			}
		</cfscript>	
		
		<cfscript>#altAltTags($.getBean('fileMetaData').loadBy(fileid=sub1.getFileID()))#</cfscript>