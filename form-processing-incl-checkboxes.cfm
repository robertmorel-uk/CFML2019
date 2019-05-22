	<!--- list of expected form field names, in order that they will appear in the email --->	
	<cfset formFieldNames = "FullName,Company,Telephone,Email,Website,Referrer,businessNature,logisticsGroup,productChannels,numOrdersPerMonth,numItemsPerOrder,aveOrderVal,packagingReq,productRange,productContainer,numBoxesStored,specialRequirements,addInfo" />
	<!--- list of field labels, in order that they will appear in the email --->	
	<cfset formFieldLabels = "Full Name,Company,Telephone,Email,Website,Referrer,Business Nature,How do you manage your logistics currently?,What channels do you use to sell your product info?,numOrdersPerMonth,numItemsPerOrder,aveOrderVal,packagingReq,productRange,How will your products arrive?,numBoxesStored,Please select any special storage and handling requirements you may have?,addInfo
" />
	<!--- mail to --->
	<cfset mailTo = "email@company.com" />
	<cfif (Find('.test', $.siteConfig('domain')) GT 0)>
		<cfset mailTo = "email@company.com" />
	</cfif>	
	<!--- mail cc --->
	<cfset mailcc = "" />
	<cfif (Find('.test', $.siteConfig('domain')) GT 0)>
		<cfset mailcc = "" />
	</cfif>
	<!--- mail bcc --->
	<cfset mailbcc = "email@company.com" />
	<!--- mail from --->
	<cfset mailFrom = #application.settingsManager.getSite($.event('siteID')).getMailserverUsernameEmail()# />
	<!--- mail subject --->	
	<cfset mailSubject = #variables.rsform.title# />
	<!--- mail attachment --->	
	<cfset mailAttachment = "" />
	
	<cfsavecontent variable="formContent">
		<cfoutput>
		
		<p style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">
			This form was sent at #DateFormat(Now(), "dd mmm yyyy ")# #TimeFormat(Now(), "HH:mm:ss")#<br />
			Please do not reply to this email; use the email address submitted with the enquiry. 
		</p>
		

		<cfloop from="1" to="#ListLen(formFieldNames)#" index="i">
			<p>
				<!---Print form labels as declared above--->
				<font style="font-weight:bold;">#ListGetAt(formFieldLabels, i)#</font><br /><!---FONT tag used as it has no style so suits HTML4 email layout--->
				<!---Print items in list of form fields declared above--->
				<cfif findNoCase('_attachment', ListGetAt(formFieldNames, i)) AND  isValid("UUID",StructFind($.event('FormResult'), ListGetAt(formFieldNames, i)))>
					http://#$.siteConfig('domain')#/tasks/render/file/index.cfm?fileID=#StructFind($.event('FormResult'), ListGetAt(formFieldNames, i))#&method=attachment

				<!---If field exists in form field then output value--->
				<cfelseif findNoCase('logisticsGroup', ListGetAt(formFieldNames, i))>
					<cfif StructKeyExists(form, 'inHouse') >
						#form.inHouse#,
					</cfif>
					<cfif StructKeyExists(form, 'thirdParty') >
						#form.thirdParty#,
					</cfif>
					<cfif StructKeyExists(form, 'newBusiness') >
						#form.newBusiness#
					</cfif>
					
					<!---inHouse,thirdParty,newBusiness--->
				<cfelseif findNoCase('productChannels', ListGetAt(formFieldNames, i))>
					<!---OUTPUT LOGISTICS GROUP DATA--->
					<cfif StructKeyExists(form, 'retail') >
						#form.retail#,
					</cfif>
					<cfif StructKeyExists(form, 'consumer') >
						#form.consumer#,
					</cfif>
					<cfif StructKeyExists(form, 'wholesale') >
						#form.wholesale#
					</cfif>
					<cfif StructKeyExists(form, 'educational') >
						#form.educational#,
					</cfif>
					<cfif StructKeyExists(form, 'hospitality') >
						#form.hospitality#,
					</cfif>
					<cfif StructKeyExists(form, 'replenishment') >
						#form.replenishment#
					</cfif>
					<!---retail,consumer,wholesale,educational,hospitality,replenishment--->
					
				<cfelseif findNoCase('productContainer', ListGetAt(formFieldNames, i))>
					<!---OUTPUT LOGISTICS GROUP DATA--->
					<cfif StructKeyExists(form, 'pallet') >
						#form.pallet#,
					</cfif>
					<cfif StructKeyExists(form, 'box') >
						#form.box#,
					</cfif>
					<cfif StructKeyExists(form, 'container') >
						#form.container#
					</cfif>
					
					<cfif StructKeyExists(form, ListGetAt(formFieldNames, i))>
						#Replace(StructFind(form, ListGetAt(formFieldNames, i)), chr(10), '<br />', 'ALL')#
					</cfif>
					
				<cfelseif findNoCase('specialRequirements', ListGetAt(formFieldNames, i))>
					<!---OUTPUT LOGISTICS GROUP DATA--->
					<cfif StructKeyExists(form, 'highValue') >
						#form.highValue#,
					</cfif>
					<cfif StructKeyExists(form, 'hazardous') >
						#form.hazardous#,
					</cfif>
					<cfif StructKeyExists(form, 'perishable') >
						#form.perishable#
					</cfif>
					<cfif StructKeyExists(form, 'tempSensitive') >
						#form.tempSensitive#,
					</cfif>
					<cfif StructKeyExists(form, 'oversized') >
						#form.oversized#,
					</cfif>
					<cfif StructKeyExists(form, 'fragile') >
						#form.fragile#
					</cfif>
					<cfif StructKeyExists(form, 'medical') >
						#form.medical#
					</cfif>
					<!---highValue,hazardous,perishable,tempSensitive,oversized,fragile,medical--->
					
				<cfelse>
					
					<cfif StructKeyExists(form, ListGetAt(formFieldNames, i))>
						#Replace(StructFind(form, ListGetAt(formFieldNames, i)), chr(10), '<br />', 'ALL')#
					</cfif>
				</cfif>
			</p>
		</cfloop>
		</table>
		</cfoutput>
	</cfsavecontent>

	<cftry>
		<cfmail 
			to="#mailTo#"
			cc="#mailcc#"
			bcc="#mailbcc#"
			from="#mailFrom#"
			subject="#mailSubject#"
			type="html">
			<cfoutput>
				#formcontent#
			</cfoutput>
		</cfmail>
		<cfcatch type="any">
			<!---
				Do nothing, we'd just like it to fail gracefully (it would only 
				get to this area if user had badly formed email address which should
				be prevented by the regEx match at client side on form submission.)
			--->
			<cfdump var="#cfcatch.message#" />
			<cfdump var="#cfcatch.detail#" />
		</cfcatch>
	</cftry>