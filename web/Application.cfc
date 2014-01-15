component {

	this.name = "freemarker_" & hash(getCurrentTemplatePath());
	this.mappings = {
		"/components" = expandPath("../components")
	};
	this.datasource = "freemarker";	

	function onApplicationStart() {
		structClear(application);
		application.uploadPath = expandPath("../upload");

		return true;
	}

	/* function onSessionStart() {} */

	// the target page is passed in for reference, 
	// but you are not required to include it
	function onRequestStart( string targetPage ) {
		if (structKeyExists(url, "cacheClear"))
		/* {
			cacheRemoveAll();
			location("/", false);
		}
		if (structKeyExists(url, "appRestart"))
		{
			onApplicationStart();
			location("/", false);
		} */

		// important for importing data with decimals like 70,34
		setLocale("nl_NL");
		// request.freemarker = cacheGet("freemarker");
		request.freemarker = javaCast("null", 0);
		if (isNull(request.freemarker))
		{
			request.freemarker = new components.Freemarker();
			request.freemarker.setTemplateDirectory(expandPath("../views"));
			//cachePut("freemarker", request.freemarker);
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