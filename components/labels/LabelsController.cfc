/**
*
* @file  /C/web/playground/freemarkertest/components/labels/LabelsController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.labels.LabelsController" extends="components.BaseController" {

	public components.labels.LabelsController function init(){
		labelsService = new components.labels.LabelsService();
		return this;
	}


	public string function index() {
		var model = createModel();

		return request.Freemarker.render(model, "labels/index.ftl") & list();
	}
	
	public string function list(includeLinks = true) {
		var model = createModel();
		
		structInsert(model, "labels", labelsService.getLabels());
		structInsert(model, "includeLinks", javaCast("boolean", arguments.includeLinks));

		return request.Freemarker.render(model, "labels/list.ftl");
	}

	public string function edit() {
		var stLabel = {};
		if (structKeyExists(url, "id"))
		{
			if(url.id == "new")
			{
				stLabel = {
					"ID" = "",
					"Name" = ""
				};
			}
			else
			{
				stLabel = labelsService.getLabel(url.id);
			}
		}

		if (!structKeyExists(url, "id") || !structCount(stLabel))
		{
			Throw(type="myError", message="Label not found!");
		}

		var model = createModel();
		structInsert(model, "label", stLabel);
		return request.Freemarker.render(model, "labels/form.ftl");
	}
	
	public void function save() {
		if (structKeyExists(form, "fieldnames"))
		{
			labelsService.saveOrUpdate(form);
		}
		else
		{
			Throw(type="myError", message="No form submitted");
		}

		location(url="/labels");
		return;
	}
	
	public string function delete() {
		if (structKeyExists(url, "id") && structKeyExists(url, "confirmed") && url.confirmed)
		{
			labelsService.delete(url.id);
			location(url="/labels");
		}
		else
		{
			Throw(type="myError", message="Deletion not confirmed!");
		}
	}
	
	
}