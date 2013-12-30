<!--Force IE6 into quirks mode with this comment tag-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
