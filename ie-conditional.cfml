			<cfif arrayLen(REMatch("Trident/7.*rv:11", CGI.HTTP_USER_AGENT)) neq 0>
	  		  <div class="hero" style="background-image: url(#$.content().getImageURL('carouselimage')#);">
		    <cfelse>
			  <img class="ram-hero-cover-img" src="#$.content().getImageURL('carouselimage')#" alt="#esapiEncode('html', $.content('title'))#">
			</cfif>