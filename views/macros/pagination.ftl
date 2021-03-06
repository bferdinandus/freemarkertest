<#macro pagination nNumberOfPages nShowNumberOfPages=5 sBaseLink="">
<div class="pagination">
	<#if (nNumberOfPages > 1)>
		<#assign nStartPage = currentPage - (nShowNumberOfPages/2)?floor />
		<#assign nEndPage = nStartPage + nShowNumberOfPages - 1 />

		<#if (nStartPage < 1) >
			<#assign nStartPage = 1 />
			<#assign nEndPage = nStartPage+nShowNumberOfPages-1 />
		</#if>
		<#if (nEndPage > nNumberOfPages) >
			<#assign nEndPage = nNumberOfPages />
			<#if nEndPage-nShowNumberOfPages+1 < 1>
				<#assign nStartPage = 1 />
			<#else>
				<#assign nStartPage = nEndPage-nShowNumberOfPages+1 />
			</#if>
		</#if>

		<#if (currentPage == 1) >
			<a href="${sBaseLink}?page=1" class="pure-button pure-button-disabled">first</a>
			<a href="#" class="pure-button pure-button-disabled">«</a>
		<#else>
			<a href="${sBaseLink}?page=1" class="pure-button">first</a>
			<a href="${sBaseLink}?page=${currentPage-1}" class="pure-button">«</a>
		</#if>

		<#if (nStartPage > 1) >
			...
		</#if>
		<#list nStartPage..nEndPage as i>
			<#if (i == currentPage)>
				<a href="#" class="pure-button pure-button-active">${i}</a>
			<#else>
				<a href="${sBaseLink}?page=${i}" class="pure-button">${i}</a>
			</#if> 
		</#list>
		<#if (nEndPage < nNumberOfPages) >
			...
		</#if>
		<#if (currentPage == nNumberOfPages) >
			<a href="#" class="pure-button pure-button-disabled">»</a>
			<a href="#" class="pure-button pure-button-disabled">last</a>
		<#else>
			<a href="${sBaseLink}?page=${currentPage+1}" class="pure-button">»</a>
			<a href="${sBaseLink}?page=${nNumberOfPages}" class="pure-button">last</a>
		</#if>
	</#if>
</div>
</#macro>
