
<!--- http://purecss.io/ --->
<cfscript>
	sResult="empty";
	if (structKeyExists(url, "url") && len(url.url))
	{
		aParts = listToArray(url.url, "/");

		// first part is controller name
		controllerName = aParts[1];

		if(arrayLen(aParts) > 1)
		{
			// second part is action in controller
			action = aParts[2];
		}
		else
		{
			action = "index";
		}

		try {
			controllerNameLowerCase = lCase(controllerName);
			controllerNameFistCapital = rereplace(controllerNameLowerCase, "(^\w)", "\u\1");
			controller = createObject("component", "components.#controllerNameLowerCase#.#controllerNameFistCapital#Controller").init();

			sResult = invoke(controller, "#action#");
		}
		catch(any variable) {
			// set browser header to 404
			createObject("component", "components.CFTags").header("404");
			savecontent variable="sContent" { writeDump(variable); };
			sResult = request.Freemarker.render({"content" = sContent}, "404.ftl");
		} finally {
			
		}
		
	}
	else
	{
		// loading home page
		savecontent variable="sDump" 
		{ 
			writeDump(url); 
			writeDump(application); 
			writeDump(CGI);
		};
		sResult = request.Freemarker.render({"dump" = sDump}, "home.ftl");
	}

	writeOutput(request.freemarker.renderPage(sResult));
</cfscript>