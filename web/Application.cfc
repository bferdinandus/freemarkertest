component {

	this.name = "freemarker_" & hash(getCurrentTemplatePath());
	this.datasource = "peoplexs_test";	
	this.mappings = {
		"/components" = expandPath("../components")
	};

/* 	function onApplicationStart() {
		return true;
	}

	function onSessionStart() {}
 */
	// the target page is passed in for reference, 
	// but you are not required to include it
	function onRequestStart( string targetPage ) {
		if (structKeyExists(url, "refresh"))
		{
			cacheRemoveAll();
		}

		request.freemarker = cacheGet("freemarker");
		if (isNull(request.freemarker))
		{
			request.freemarker = new components.Freemarker();
			request.freemarker.setTemplateDirectory(expandPath("../views"));
			cachePut("freemarker", request.freemarker);
		}
	}

/* 	function onRequest( string targetPage ) {
		include arguments.targetPage;
	}

	function onRequestEnd() {}

	function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

	function onApplicationEnd( struct ApplicationScope ) {}

	function onError( any Exception, string EventName ) {}
 */	
}