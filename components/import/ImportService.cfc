/**
*
* @file  /C/web/playground/freemarkertest/components/import/ImportService.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.import.ImportService"  {

	public components.import.ImportService function init(){
		return this;
	}


	public any function importFile(required string fileName) {
		var FileHandler = FileOpen(arguments.fileName, "read");
		var bFirstLine = true;

		while(!FileIsEOF(FileHandler))
		{
			if(bFirstLine)
			{
				// read first line with header info... don't need to process that
				FileReadLIne(FileHandler);
				bFirstLine = false;
				// use continue to skip the rest of this looop and start at the beginning
				continue;
			}
			var sCurrentLine = FileReadLIne(FileHandler);
			var aItems = reMatch("""(.*?)""", sCurrentLine);

			var query = new Query();
			var sSql = "
				insert into bankrecords 
					(date,
					 description,
					 account,
					 contraAccount,
					 code,
					 addSubtract,
					 amount,
					 mutationType,
					 remarks)
				values 
					(?,
					 ?,
					 ?,
					 ?,
					 ?,
					 ?,
					 ?,
					 ?,
					 ?)
			";
			query.setSql(sSql);

			for (var sItem in aItems)
			{
				// replace decimal comma with a point
				if(reFind("""[0-9]+?,[0-9]{2}""", sItem)){
					sItem = replace(sItem, ",", ".");
				}
				// strip item of ""
				sItem = reReplace(sItem, '^"(.*)"$', "\1");

				query.addParam( value=sItem, null=(len(sItem) ? false : true) /* , cfsqltype="cf_sql_integer" */ ); 
			}
			query.execute();
		}
		FileClose(FileHandler);
		var query = new Query();
		var sSql = "
			insert into system (ID, lastImport) values (1, :dateNow )
			on duplicate key update lastImport = :dateNow 
		";
		query.setSql(sSql);
		query.addParam( name="dateNow", value=dateTimeFormat(now(), "yyyy-mm-dd HH:nn:ss.l") ); 
		query.execute();
		
		return;
	}
	
	
}