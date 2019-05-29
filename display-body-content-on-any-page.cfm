<cfscript>
public any function dspBodyByPageTitle(required string pageTitle, string siteid=$.event('siteid')) {
		var contentBody = '';
		var contentBean = $.getBean('content').loadBy(title=arguments.pageTitle, siteid=arguments.siteid);
		if ( contentBean.exists() && contentBean.getValue('isOnDisplay') ) {
			contentBody = $.setDynamicContent(contentBean.getBody());
			return contentBody;
		} else {
				writeDump(var = $.globalConfig().getAllValues(), label = "CGI Scope");
	}

	}
</cfscript>

<cfoutput>
<cfscript>
<!---Params are page title and site id--->
	writeOutput(dspBodyByPageTitle('services','iconic-db'));	
</cfscript>