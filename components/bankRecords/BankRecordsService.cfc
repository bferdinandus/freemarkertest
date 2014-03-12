/**
*
* @file  /C/web/playground/freemarkertest/components/bankRecords/BankRecordsService.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.bankRecords.BankRecordsService" extends="components.BaseService" {

	public function init(){
		return this;
	}

	public numeric function getRecordCount() {
		var query = new Query();
		var sSql = "
			select count(*) as numberOfRecords
			from bankrecords
			";
		query.setSql(sSql);
		
		qResult = query.execute();
		var nReturn = 0;
		if (qResult.getPrefix().recordcount)
		{
			nReturn = qResult.getResult().numberOfRecords;
		}

		return nReturn;
	}


	public array function getRecordsWithLabel(numeric max=10, numeric page=1) {
		var nOffset = (arguments.max * arguments.page) - arguments.max;
		var query = new Query();
		var sSql = "
			select bankrecords.ID as bankrecordsID, bankrecords.description, bankrecords.remarks, bankrecords.amount, bankrecords.addSubtract, labels.ID as labelsID, labels.name
			from bankrecords
				left join labelsBankRecords on labelsBankRecords.bankrecordID = bankrecords.ID
				left join labels on labels.ID = labelsBankRecords.labelID

			order by bankrecords.ID
			limit :offset, :rowCount 
			";
		query.setSql(sSql);
		query.addParam( name="offset", value=nOffset, cfsqltype="cf_sql_integer" ); 
		query.addParam( name="rowCount", value=arguments.max, cfsqltype="cf_sql_integer" ); 
		
		qResult = query.execute();
		var aReturn = [];
		if (qResult.getPrefix().recordcount)
		{
			aReturn = queryToArray(qResult.getResult());
		}

		return aReturn;
	}
	
}
