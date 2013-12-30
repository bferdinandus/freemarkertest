/**
*
* @file  /C/web/playground/freemarkertest/components/sortinghat/SortinghatController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.sortinghat.SortinghatController" extends="components.BaseController" {

	public components.sortinghat.SortinghatController function init(){
		sortinghatService = new components.sortinghat.SortinghatService();
		return this;
	}


	public string function index() {
		var model = createModel();

		var sRecordsList = new components.bankRecords.BankRecordsController().list();
		structInsert(model, "listContent", sRecordsList);

		var sLabelsContent = new components.labels.LabelsController().list(includeLinks=false);
		structInsert(model, "labelsContent", sLabelsContent);

		return request.Freemarker.render(model, "sortinghat/index.ftl");
	}
	
	
}