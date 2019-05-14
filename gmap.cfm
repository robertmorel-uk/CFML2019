<cfoutput>
	<!-- Distributors Grid Display -->
	<cfset distributorsIT=$.content().getKidsIterator()>
	<cfset distributorsIT.setNextN(0)>
	<!-- Get categories -->
	<cfset categoryBean=$.getBean('category').loadBy(name='Distribution Categories')>
	<cfset categoryGateway=$.getBean('categoryGateway')>
	<cfset categoryQuery=categoryGateway.getCategories(siteID=$.event('siteid'), parentID=categoryBean.get('categoryid'))>
	<cfset categoryIT=$.getBean('categoryIterator').setQuery(categoryQuery)>
		
	<div class="page">
		<div class="container-fluid">
			<div class="row">
				
			<section>
				<script src=""></script>
				<div id="container" style="min-width:1200px;">	
				  <div id="map" style="width: 100%; height: 400px; margin-bottom: 30px;"></div>
				</div>

				  <script type="text/javascript">  
					  var geocoder = new google.maps.Geocoder();
					  var distMapCompanyName = [];
					  var distMapCompanyLat = [];
					  var distMapCompanyLong = [];
					  function getLatFromName(name) {
						var address = name;

						geocoder.geocode( { 'address': address}, function(results, status) {
							
						if (status == google.maps.GeocoderStatus.OK) {
							var latitude = results[0].geometry.location.lat();
							var longitude = results[0].geometry.location.lng();
								distMapCompanyName.push(name);
								distMapCompanyLat.push(latitude);
								distMapCompanyLong.push(longitude);
								console.log(name + " coordinates: " + latitude+', '+longitude);					
								localStorage.setItem("distMapCompanyName", JSON.stringify(distMapCompanyName));
								localStorage.setItem("distMapCompanyLat", JSON.stringify(distMapCompanyLat));
								localStorage.setItem("distMapCompanyLong", JSON.stringify(distMapCompanyLong));
							} else console.log(name + " coordinates not found");
						}); 
					  }
					  
				  </script>
				
				  <script type="text/javascript">
					  
					  function showMapUsingData(){
						  var distMapCompanyName = JSON.parse(localStorage.getItem("distMapCompanyName"));
						  var distMapCompanyLat = JSON.parse(localStorage.getItem("distMapCompanyLat"));
						  var distMapCompanyLong = JSON.parse(localStorage.getItem("distMapCompanyLong"));
					  
						var locations = [
						  [distMapCompanyName[0], 'A description of the distributor', distMapCompanyLat[0],distMapCompanyLong[0], 4],
						  [distMapCompanyName[1], 'A description of the distributor', distMapCompanyLat[1],distMapCompanyLong[1], 3],
						  [distMapCompanyName[2], 'A description of the distributor', distMapCompanyLat[2],distMapCompanyLong[2], 2],
						  [distMapCompanyName[3], 'A description of the distributor', distMapCompanyLat[3],distMapCompanyLong[3], 1]
						]; 

						var map = new google.maps.Map(document.getElementById('map'), {
						  zoom: 2,
						  center: new google.maps.LatLng(54.3998971,-55.2188123),
						  mapTypeId: google.maps.MapTypeId.ROADMAP
						});

						var infowindow = new google.maps.InfoWindow();
						var marker, i;

						for (i = 0; i < locations.length; i++) {  
						  marker = new google.maps.Marker({
							position: new google.maps.LatLng(locations[i][2], locations[i][3]),
							map: map
						  });

						 var eeeDistInfo = "<div><h4>" + locations[i][0] + "</h4>" + "<p>" + locations[i][1] + "</p></div>";

						  google.maps.event.addListener(marker, 'click', (function(marker, i) {
							return function() {
							  infowindow.setContent("<div class='eeeDistDescPopup'><h4>" + locations[i][0] + "</h4>" + "<p>" + locations[i][1] + "</p></div>");
							  infowindow.open(map, marker);
							}
						  })(marker, i));
						}
						   }//end function
				  </script>
				
				</section>
				<cfscript>
				companyNames = []
				writeDump(companyNames)
				</cfscript>
					
				<cfloop condition=categoryIT.hasNext()>
					<cfset category=categoryIT.next()>
					<cfset catHasDists=false>
					<div class="col-12">
						<h2>#category.getName()#</h3>
					</div>
					<cfset distributorsIT.reset()>
					<cfif distributorsIT.hasNext()>
						<cfloop condition="distributorsIT.hasNext()">
							<cfset sub1=distributorsIT.next()>
							<cfset distCategoryIT=sub1.getCategoriesIterator()>
							<cfloop condition=distCategoryIT.hasNext()>
								<cfset distCategory=distCategoryIT.next()>
								<cfif distCategory.getName() EQ category.getName()>
									<div class="col-12 col-md-6 col-lg-3 mb-3">
										<h2>#sub1.getMenuTitle()#</h2>
										<cfif len(sub1.getSummary())>
											<p>#sub1.getSummary()#</p>
											<h4 style="word-wrap: break-word;">Map LATLONG: #sub1.getValue('mapUrl')#</h4>
											<h4>#sub1.getValue('distributorCompanyName')#</h4>
											<h4>#sub1.getValue('postcode')#</h4>
										</cfif>
										<p>
											<a href="mailto:#sub1.getContactEmailAddress()#">#sub1.getContactEmailAddress()#<br>
											<a href="http://#sub1.getContactWebsiteAddress()#" target="_blank">#sub1.getContactWebsiteAddress()#</a><br>
											<a href="tel:#ReReplace(sub1.getContactTelNo(), '[\s\(\)]', '', 'all')#" class="font-weight-bold">
												#sub1.getContactTelNo()#
											</a>
										</p>
										<a href="http://#sub1.getContactWebsiteAddress()#" target="_blank">
											<img src="#sub1.getImageURL()#" class="img-fluid" border=0 style="max-height: 50px;"/>
										</a>
									</div>
									<cfscript>
									toAppend=ArrayAppend(companyNames,#sub1.getMenuTitle()#,true)
									</cfscript>
									<!---
										<div class="col-12 col-md-6 col-lg-3 mb-4">
										<cfif len(#sub1.getValue('mapUrl')#)>
										<iframe src="#sub1.getValue('mapUrl')#" width="100%" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
										<cfelse>
										Map not found
										</cfif>
										</div>
											--->
									<cfset catHasDists=true>
								</cfif>
							</cfloop>
						</cfloop>
						<cfif !catHasDists>
							<div class="col-12">
								<p>This category has no Distributors.</p>
							</div>
						</cfif>				
					</cfif>
				</cfloop>
								
	<script type="text/javascript" language="JavaScript">
			var #toScript(companyNames, "companyNamesJS")#;
	</script>
			<script type="text/javascript" language="JavaScript">
				var i;
					for (i = 0; i < companyNamesJS.length; i++) { 
					  	getLatFromName(companyNamesJS[i]);
					}
				showMapUsingData();
			</script>

			</div>
		</div>
	</div>
	<!-- /Distributors Grid Display -->
</cfoutput>