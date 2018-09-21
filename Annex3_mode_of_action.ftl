<!-- APPENDIX: Information on MOA -->

<#list csr.modeOfActionRepeatedDosesToxicity as summary>	
	<para xml:id="${summary.documentKey.uuid!}"></para>
	<#if summary?has_content>
		<para><emphasis role="bold">Section 5.6.3: <@nameOfSummary summary/></emphasis></para>
		<para><emphasis role="underline">Detailed information on mode of action / Human relevance framework: </emphasis></para>
		<@com.richText summary.ModeOfActionAnalysisHumanRelevanceFramework.ModeOfActionAnalysis/>
	</#if>
</#list>
<@com.emptyLine/>
<#list csr.modeOfActionsOthersGenetic as summary>
	<para xml:id="${summary.documentKey.uuid!}"></para>	
	<#if summary?has_content>
		<para><emphasis role="bold">Section 5.7.3: <@nameOfSummary summary/></emphasis></para>
		<para><emphasis role="underline">Detailed information on mode of action / Human relevance framework: </emphasis></para>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.MoAHumanRelevanceFramework.MoAHumanRelevanceFramework/>
	</#if>
</#list>
<@com.emptyLine/>
<#list csr.modeOfActionsOthersCarcinogenicity as summary>
	<para xml:id="${summary.documentKey.uuid!}"></para>	
	<#if summary?has_content>
		<para><emphasis role="bold">Section 5.8.3: <@nameOfSummary summary/></emphasis></para>
		<para><emphasis role="underline">Detailed information on mode of action / Human relevance framework: </emphasis></para>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.MoAHumanRelevanceFramework.MoAHumanRelevanceFramework/>
	</#if>
</#list>
<@com.emptyLine/>
<#list csr.modeOfActionsOthersReproductiveTox as summary>
	<para xml:id="${summary.documentKey.uuid!}"></para>
	<#if summary?has_content>
		<para><emphasis role="bold">Section 5.9.3: <@nameOfSummary summary/></emphasis></para>
		<para><emphasis role="underline">Detailed information on mode of action / Human relevance framework: </emphasis></para>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.MoAAnalysisHumanRelevanceFramework.MoAAnalysisHumanRelevanceFramework/>
	</#if>
</#list>
<@com.emptyLine/>

<#macro nameOfSummary summary printName=true>
	<#if printName>
		<@com.text summary.name/>
	</#if>	
</#macro>