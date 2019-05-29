<!---
  This is an uber simple method to output children, grandchildren, etc. based on the parent's contentid
  If you're looking for an easy way to output a child nav, you could also just use Mura's baked-in $.dspNestedNav(contentid) method.
  See the file located under /requirements/mura/content/contentRenderer.cfc for details.
--->
<cffunction name="dspDecendants">
	<cfargument name="contentid" required="true" />
	<cfset var local = {} />
	<cfset local.str = '' />
	<cfset local.cBean = $.getBean('content').loadBy(contentid=arguments.contentid) />
	<cfif local.cBean.exists()>
		<cfset local.itKids = local.cBean.getKidsIterator() />
		<cfif local.itKids.hasNext()>
			<cfsavecontent variable="local.str">
				<cfoutput>
					<ul>
						<cfloop condition="local.itKids.hasNext()">
							<cfset local.itKid = local.itKids.next() />
							<li>
								#local.itKid.get('menuTitle')#
								<!--- grandkids --->
								#dspDecendants(contentid=local.itKid.get('contentid'))#
							</li>
						</cfloop>
					</ul>
				</cfoutput>
			</cfsavecontent>
		</cfif>
	</cfif>
	<cfreturn local.str />
</cffunction>

<cfoutput>
#dspDecendants(#$.content().getContentId()#)#
</cfoutput>