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

	private function queryToArray( query ){ 
		var queryAsArray = [];
		for (var row in arguments.query){
			var stRow = {};
			for(var sColumnName in arguments.query.getMetaData().getColumnLabels())
			{
				structInsert(stRow, "#sColumnName#", row[sColumnName]);
			}
			arrayAppend( queryAsArray, stRow );
		}
		return( queryAsArray );
	}	
	
}