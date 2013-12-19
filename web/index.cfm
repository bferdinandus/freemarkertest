<cfscript>
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
			writeDump(variable);
			abort;
		} finally {
			
		}
		
	}

	writeOutput(request.freemarker.renderPage(sResult));
</cfscript>