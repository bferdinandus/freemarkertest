<#include "/macros/pagination.ftl">
<table class="pure-table pure-table-horizontal pure-table-striped pure-u-1">
	<tr>
		<th>ID</th>
		<th>Description</th>
		<th>Remarks</th>
		<th>Amount</th>
		<th>Label</th>
	</tr>
	<#list records as record>
		<#assign sColor = "">
		<#switch record.addSubtract?lower_case>
			<#case "bij">
				<#assign sColor = "color-green">
				<#break>
			<#case "af">
				<#assign sColor = "color-red">
				<#break>
		</#switch>
		<tr>
			<td>${record.bankrecordsID}</td>
			<td>${record.description}</td>
			<td>${record.remarks}</td>
			<td class="${sColor}">€ ${record.amount?string(",##0.00")}</td>
			<td>${record.label!""}</td>
		</tr>
	</#list>
	<tr>
		<td colspan="5">
			<@pagination nNumberOfPages=(recordCount / recordsPerPage)?floor />
		</td>
	</tr>
</table>