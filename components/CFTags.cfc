<cfcomponent displayname="CFTags" output="false">
	<cffunction name="header" returntype="void">
		<cfargument name="statusCode" type="string" required="true" />
		<cfargument name="statusText" type="string" required="false" default="" />
		<cfheader statuscode="#arguments.statusCode#" statustext="#arguments.statusText#" />
		<cfreturn />
	</cffunction>

</cfcomponent>