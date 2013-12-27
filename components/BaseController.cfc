/**
*
* @file  /C/web/playground/freemarkertest/components/BaseController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.BaseController"  {

	public function init(){
		return this;
	}


	private struct function createModel() {
		var stModel = {};

		return stModel;
	}
	

	public string function dump(required struct catchInfo) {

		return request.Freemarker.render(arguments.catchInfo, "dump.ftl");

	}
	
	
	
	
}