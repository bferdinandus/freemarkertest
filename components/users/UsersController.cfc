/**
*
* @file  /C/web/playground/freemarkertest/components/users/UsersController.cfc
* @author  
* @description
*
*/

component output="false" displayname="components.users.UsersController" extends="components.BaseController" {

	public function init(){
		usersService = new components.users.UsersService();
		return this;
	}


	public void function index() {
		location(url="/users/list", addtoken=false);

		return;
	}

	public string function list() {
		var nPage = 1;
		var nUsersPerPage = 10;
		if(structKeyExists(url, "page"))
		{
			nPage = url.page;
		}

		var qUsers = usersService.getUsers(nUsersPerPage, nPage);
		var model = {
			"users" = qUsers,
			"userCount" = JavaCast("int", usersService.getUserCount()),
			"page" = JavaCast("int", nPage),
			"usersPerPage" = JavaCast("int", nUsersPerPage)
		};
		
		return request.Freemarker.render(model, "usersList.ftl");
	}


	
	
}