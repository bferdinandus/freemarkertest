<p>Last import: 
	<#if (lastUpdate?length > 0)>
		${lastUpdate?datetime}
	<#else>
		none
	</#if>
</p>
<p><a href="/import/form">Import records</a></p>