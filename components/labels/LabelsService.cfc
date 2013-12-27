/**
*
* @file  /C/web/playground/freemarkertest/components/labels/LabelsService.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.labels.LabelsService" extends="components.BaseService" {

	public components.labels.LabelsService function init(){
		return this;
	}

	public struct function getLabel(numeric id) {
		var query = new Query();
		var sSql = "
			select ID, Name
			from labels
			where id = :id
		";
		query.setSql(sSql);
		query.addParam( name="id", value=arguments.id, cfsqltype="cf_sql_integer" ); 
		qResult = query.execute();
		var stReturn = {};

		if (qResult.getPrefix().recordcount)
		{
			stReturn = queryToArray(qResult.getResult())[1];
		}

		return stReturn;
	}
	

	public array function getLabels() {
		var query = new Query();
		var sSql = "
			select ID, Name
			from labels
		";
		query.setSql(sSql);
		qResult = query.execute();
		return queryToArray(qResult.getResult());
	}	
	

	public void function saveOrUpdate(required struct form) {
		var query = new Query();
		var stForm = arguments.form;
		if (structKeyExists(stForm, "ID") && Len(stForm.ID))
		{
			var sSql = "
				update labels set
				Name = :name
				where ID = :ID 
			";
			query.addParam( name="name", value=stForm.Name, cfsqltype="cf_sql_varchar" ); 
			query.addParam( name="ID", value=stForm.ID, cfsqltype="cf_sql_integer" ); 
		}
		else
		{
			var sSql = "
				insert into labels (Name) 
				values ( :name )
			";
			query.addParam( name="name", value=stForm.Name, cfsqltype="cf_sql_varchar" ); 
		}

		query.setSql(sSql);
		query.execute();
		
		return;
	}
	
	public void function delete(required numeric ID) {
		var query = new Query();
		var sSql = "
			delete from labels 
			where ID = :ID 
		";
		query.addParam( name="ID", value=arguments.ID, cfsqltype="cf_sql_integer" ); 
		query.setSql(sSql);
		query.execute();
		
		return;
	}
	
	
	
}