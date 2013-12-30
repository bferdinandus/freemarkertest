<!DOCTYPE html>
<html lang="en-us" >
	<head>
		<meta charset="utf-8" />
		<title>Playground - Freemarker</title>
		<#list cssLinks as link>
			<link rel="stylesheet" type="text/css" href="${link}">
		</#list>
		<#list javascriptHeaders as link>
			<script src="${link}"></script>
		</#list>
	</head>
	<body>
		<div id="header" class="pure-g">
			<div class="pure-u-1">
				<#include "menu.ftl">
			</div>
		</div>
		<div id="maincontent">
			${content}
		</div>
		<#list javascriptFooters as link>
			<script src="${link}"></script>
		</#list>
	</body>
</html>
