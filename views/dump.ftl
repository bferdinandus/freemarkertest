<div class="errorInfo">
	<p>Message: <strong>${Message}</strong></p>
	<#if Detail??><p>Detail: <strong>${Detail}</strong></p></#if>
	<#if Snippet??><p>Snippet: <strong>${Snippet}</strong></p></#if>
	<#if Sql??><p>Sql: <strong>${Sql}</strong></p></#if>
	<p>
		Context:
		<ul>
			<#list TagContext as context>
				<#-- coldfusion notation -->
				<#if context.TEMPLATE??>
					<li>${context.TEMPLATE}:${context.LINE}</li>
				</#if>

				<#-- railo notation -->
				<#if context.template??>
					<li>${context.template}:${context.line}</li>
				</#if>
				<#if context.codePrintHTML??>
					<ul>
						<li>${context.codePrintHTML}</li>
					</ul>
				</#if>

			</#list>
		</ul>
	</p>
</div>