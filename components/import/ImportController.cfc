/**
*
* @file  /C/web/playground/freemarkertest/components/import/ImportController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.import.ImportController" extends="components.BaseController" {

	public components.import.ImportController function init(){
		importService = new components.import.ImportService();
		return this;
	}

	public string function index(){
		var query = new Query();
		var sSql = "select lastImport from system";
		var result = query.setSQL(sSql).execute().getResult();
		var model = createModel();
		structInsert(model, "lastUpdate", result.lastImport);

		return request.Freemarker.render(model, "import/index.ftl");
	}

	public string function form(){
		return request.Freemarker.render({}, "import/form.ftl");
	}

	public void function submit(){
		if (!structKeyExists(form, "submit"))
		{
			throw "No form received";
		}

		var stUploadResult = FileUpload(application.uploadPath, "uploadFile", "*", "MakeUnique");

		if (stUploadResult.fileWasSaved)
		{
			importService.importFile(stUploadResult.ServerDirectory & "/" & stUploadResult.ServerFile);
		}
		
		location("/import", false);

		return;
	}

	
	
}