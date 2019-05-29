<cfscript>
    rs = $.getBean('contentManager').getCategoriesByHistID($.content('contenthistid'));
    currentCategories = ValueList(rs.name);
</cfscript>
<cfdump var="#currentCategories#" />