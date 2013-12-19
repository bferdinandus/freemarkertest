<h1>Welcome ${user}!</h1>
<p>Our latest product:
<a href="${latestProduct.url}">${latestProduct.name}</a>!
<p>List of ${users?size} Users
	<ul>
		<#list users as user>
			<li>${user.DomeinCode} - ${user.Naam}</li>
		</#list>
	</ul>
</p>