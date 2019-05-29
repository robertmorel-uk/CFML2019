<cfscript>
    public any function onSite404(m) {
    if (m.event('currentFilenameAdjusted') == 'some/bad-url') {

        // If you want to preserve the requested URL ...
        // var cb = m.getBean('content').loadBy(filename='some/good-url');
        // m.setContentBean(cb);

        // If you want to redirect to the new URL ...
        location(url=arguments.m.createHREF(filename='some/good-url'), addtoken=false);
    }
    }
</cfscript>

\\Example use
<cfscript>
    public any function redirectPage(m) {
    if (m.event('currentFilenameAdjusted') == 'news/iconic-win-highly-commended-at-the-evening-standard-new-homes-awards-2019') {
        location(url=arguments.m.createHREF(filename='404'), addtoken=false);
    }
    }

    redirectPage(m);
</cfscript>