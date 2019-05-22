			<div class="row">
				<cfset iconlist="Platforms,WealthManagement,nonprofit,Management," />
				<cfloop condition="it.hasNext()">
					<cfset sub1=it.next()>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3"> 
						<div class="card">
							<cfif ListLen(iconlist) GTE it.currentRow()>
								<img data-src="#$.siteConfig('themeAssetPath')#/images/design/icons/Salesforce-#listGetAt(iconlist, it.currentRow())#-Icon.png" class="mx-auto d-block js-lazy" alt="Card image cap" height="65" width="86">
							<cfelse>
								&nbsp;
							</cfif>
							<div class="card-body">
								<h3 class="h3 mb-3">#sub1.getMenuTitle()#</h3>
								<div data-mh="solutions-group" style="font-size: 16px;">
									#sub1.getSummary()#
								</div>								
							</div>
							<div class="card-footer">
								<a href="#sub1.getURL()#" class="btn btn-primary">Learn More</a>
							</div>
						</div>
					</div> 
				</cfloop>
			</div>