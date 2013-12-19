<#include "/macros/pagination.ftl">
<table>
<tr>
	<th>Volledige naam</th>
	<th>Inlognaam</th>
	<th>User type</th>
</tr>
<#list users as user>
	<tr>
		<td>${user.VolledigeNaam}</td>
		<td>${user.Naam}</td>
		<td>${user.UserType}</td>
	</tr>		
</#list>
	<tr>
		<td colspan=3 align=center>
			<@pagination nNumberOfPages=(userCount / usersPerPage)?floor />
		</td>
	</tr>
</table>