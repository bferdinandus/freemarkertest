/**
*
* @file  /C/web/playground/freemarkertest/components/BaseService.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.BaseService"  {

	public components.BaseService function init(){
		return this;
	}

	private function queryToArray( required query queryResult ){ 
		if (structKeyExists(server, "railo"))
		{
			// on a railo server
			var aColumns = queryResult.getColumnNames();
		}
		else
		{
			// coldfusion server
			var aColumns = arguments.queryResult.getMetaData().getColumnLabels();
		}

		var queryAsArray = [];
		for (var row in arguments.queryResult){
			var stRow = {};
			for(var sColumnName in aColumns)
			{
				structInsert(stRow, "#sColumnName#", row[sColumnName]);
			}
			arrayAppend( queryAsArray, stRow );
		}
		return queryAsArray;
	}	
	
}