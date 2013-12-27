<form action="/labels/save" method="post" enctype="application/x-www-form-urlencoded">
	<p>
		<input type="hidden" id="ID" name="ID" value="${label.ID}">
		<label for="Name">Name: <input type="text" id="Name" name="Name" value="${label.Name}"></label><br>
		<input type="submit" name="submit" value="send">
	</p>
</form>