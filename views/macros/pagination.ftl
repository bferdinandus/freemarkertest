<#macro pagination nNumberOfPages nShowNumberOfPages=5>
	<#assign nStartPage = page - (nShowNumberOfPages/2)?floor />
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

	<a href = "?page=1" >first</a>
	<#if (page == 1) >
		prev
	<#else>
		<a href = "?page=${page-1}" >prev</a>
	</#if>

	<#if (nStartPage > 1) >
		...
	</#if>
	<#list nStartPage..nEndPage as i>
		<#if (i == page)>
			${i}
		<#else>
			<a href="?page=${i}">${i}</a>
		</#if> 
	</#list>
	<#if (nEndPage < nNumberOfPages) >
		...
	</#if>
	<#if (page == nNumberOfPages) >
		next
	<#else>
		<a href = "?page=${page+1}" >next</a>
	</#if>
	<a href = "?page=${nNumberOfPages}" >last</a>
</#macro>
