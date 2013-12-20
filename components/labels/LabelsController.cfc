/**
*
* @file  /C/web/playground/freemarkertest/components/labels/LabelsController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.labels.LabelsController"  {

	public components.labels.LabelsController function init(){
		return this;
	}


	public string function index() {
		var model = {};
		return request.Freemarker.render(model, "labels/index.ftl");
	}
	
	
}