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

		var nRecordsPerPage = 10;
		var nCurrentPage = 1;
		if (structKeyExists(url, "page")) {
			nCurrentPage = JavaCast("int", url.page);
		}

		var aRecords = bankRecordsService.getRecordsWithLabel(nRecordsPerPage, nCurrentPage);
		var nTotalRecords = bankRecordsService.getRecordCount();

		structInsert(model, "records", aRecords);
		structInsert(model, "recordCount", JavaCast("int", nTotalRecords));
		structInsert(model, "recordsPerPage", JavaCast("int", nRecordsPerPage));
		structInsert(model, "currentPage", JavaCast("int", nCurrentPage));

		return request.Freemarker.render(model, "bankRecords/list.ftl");
	}
	
	
}