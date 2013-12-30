<#if includeLinks><p><a href="labels/edit?id=new">Create New Label</a></p></#if>
<p>
	<ul>
		<#list labels as label>
		<li>
			${label.Name}
			<#if includeLinks>
				<a href="labels/edit?id=${label.ID}" name="editLink">Edit</a>
				<a href="labels/delete?id=${label.ID}" name="deleteLink">Delete</a>
			</#if>
		</li>
		</#list>
	</ul>
</p>

<#if includeLinks>
	<div id="dialog-confirm" title="Delete label?">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>The label will be permanently deleted and cannot be recovered. Are you sure?</p>
	</div>

	<script>
		$("#dialog-confirm").dialog({
			autoOpen: false,
			resizable: false,
			//height:200,
			width:400,
			modal: true,
			buttons: {
				"Delete label": function() {
					window.location.href = $(this).data('link') + '&confirmed=1';
					$(this).dialog("close");
				},
				Cancel: function() {
					$(this).dialog("close");
				}
			}
		});

		$('a[name=deleteLink]').click(function(event){	
			event.preventDefault();
			$("#dialog-confirm")
				.data('link', $(this).attr('href'))
				.dialog("open");
		});
	</script>
</#if>