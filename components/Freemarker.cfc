/**
*
* @file  /C/web/playground/freemarkertest/freemarker.cfc
* @author  
* @description
*
*/

component output="false" displayname="Freemarker" hint="implements the freemarker renderer" extends="components.BaseService" {

	public function init(){
		freemarkerConfig = CreateObject("java", "freemarker.template.Configuration").init();
		freemarkerConfig.setObjectWrapper(CreateObject("java", "freemarker.template.DefaultObjectWrapper").init());
		freemarkerConfig.setDefaultEncoding("UTF-8");
		freemarkerConfig.setTemplateExceptionHandler(CreateObject("java", "freemarker.template.TemplateExceptionHandler").HTML_DEBUG_HANDLER);
		freemarkerConfig.setIncompatibleImprovements(CreateObject("java", "freemarker.template.Version").init(2, 3, 20));

		freemarkerConfig.setSetting("locale", "nl");
		freemarkerConfig.setSetting("number_format", "computer");

		if(structKeyExists(arguments, "path"))
		{
			setTemplateDirectory(arguments.path);
		}

		return this; 
	}

	public void function setTemplateDirectory( required string path ) {
		if(directoryExists(path))
		{
			freemarkerConfig.setDirectoryForTemplateLoading(CreateObject("java", "java.io.File").init("#path#"));
		}
		else
		{
			throw "path does not exist: #path#";
		}

		return;
	}
	
	
	public string function render( required struct model, required string templateName ) {
		var stringWriter = createObject("java", "java.io.StringWriter").init();
		var template = freemarkerConfig.getTemplate(arguments.templateName);
		template.process(arguments.model, stringWriter);

		return stringWriter.toSTring();
	}


	public string function renderPage( required struct model ) {
		return render(arguments.model, "basicHTMLTemplate.ftl");
	}
}