
<!--- http://purecss.io/ --->
<cfscript>
	sResult="empty";

	request.baseModel = {
		"cssLinks" = [
			"/css/pure.css",
			//"/js/jquery-ui-1.10.3/themes/base/jquery-ui.css"
			"//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css",
			"/css/style.css"
		],
		"javascriptHeaders" = [
			"/js/jquery-ui-1.10.3/jquery-1.9.1.js",
			"/js/jquery-ui-1.10.3/ui/jquery-ui.js"
		],
		"javascriptFooters" = [
		]
	};

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
		catch(myError variable) {
			createObject("component", "components.CFTags").header("404");
			sResult = request.Freemarker.render({"content" = variable.message}, "404.ftl");
		}
		catch(any variable) {
			// set browser header to 404
			createObject("component", "components.CFTags").header("404");
			// used duplicate to make variable a struct. for some reason cfcatch info does not identify as a struct.
			sResult = createObject("component", "components.BaseController").dump(duplicate(variable)); 
			savecontent variable="sDump" { writeDump(var=variable, label="full dump", expand=false); };
			sResult &= sDump;
			sResult = request.Freemarker.render({"content" = sResult}, "404.ftl");
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

	structInsert(request.baseModel, "content", sResult);
	writeOutput(request.freemarker.renderPage(request.baseModel));
</cfscript>