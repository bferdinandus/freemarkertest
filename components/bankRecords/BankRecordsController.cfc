/**
*
* @file  /C/web/playground/freemarkertest/components/bankRecords/BankRecordsController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.bankRecords.BankRecordsController" extends="components.BaseController" {

	public function init(){
		bankRecordsService = new components.bankRecords.BankRecordsService();
		return this;
	}



	public string function list(param) {
		var model = createModel();

		var aRecords = bankRecordsService.getRecordsWithLabel();
		structInsert(model, "records", aRecords);

		return request.Freemarker.render(model, "bankRecords/list.ftl");
	}
	
	
}