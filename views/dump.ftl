<div class="errorInfo">
	<p>Message: <strong>${Message}</strong></p>
	<p>Detail: <strong>${Detail}</strong></p>
	<#if Snippet??><p>Snippet: <strong>${Snippet}</strong></p></#if>
	<p>
		Context:
		<ul>
			<#list TagContext as context>
				<li>${context.TEMPLATE}:${context.LINE}</li>
			</#list>
		</ul>
	</p>
</div>