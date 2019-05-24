<!---Create class extension attribute with name plede_image and type of file--->
<cfset pledgeImage = #$.content().getpledge_image()#>
<a href="/contact-us/"><img src="#$.getURLForImage(pledgeImage)#"/></a>