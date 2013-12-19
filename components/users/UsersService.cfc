/**
*
* @file  /C/web/playground/freemarkertest/components/users/UsersService.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.users.UsersService"  {

	public function init(){
		return this;
	}

	public numeric function getUserCount() {
		var sSql = "
			select count(*) as userCount
			from Users 
		";
		
		var qQuery = new Query();
		var qResult = qQuery.execute(sql=sSql).getResult();

		return qResult.userCount;
	}

	public query function getUsers(numeric max=10, numeric page=1) {
		var qQuery = new Query();

		var nOffset = (arguments.max * arguments.page) - arguments.max;

		var sSql = "
			select VolledigeNaam, Naam, Email, UserType
			from Users 
			order by Naam
			limit :offset, :rowCount  
		";

		qQuery.setSQL(sSql);
		qQuery.addParam( name="offset", value=nOffset, cfsqltype="cf_sql_integer" ); 
		qQuery.addParam( name="rowCount", value=arguments.max, cfsqltype="cf_sql_integer" ); 
		var qQueryex = qQuery.execute();
		var qQueryResult = qQueryex.getResult();
		
		return qQueryResult;
	}
	
	
}