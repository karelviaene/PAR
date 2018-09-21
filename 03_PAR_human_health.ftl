<!-- 1. IDENTITY OF THE SUBSTANCE AND PHYSICAL AND CHEMICAL PROPERTIES template file -->

<!-- 5.3. Irritation -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Irritation</title>

	<!-- 5.3.1. Skin -->
	<section>
		<title role="HEAD-3">Skin</title>

		<!-- 5.3.1.1. Non-human information -->
		<section>
			<title role="HEAD-4">Non-human information</title>

			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "SkinIrritationCorrosion") />
			<#assign studyList1 = getSortedSkinIrritationNonHuman(studyList) />
			
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList1/>

			<!-- Study results -->
			<#if !resultStudyList?has_content>
				No relevant information available.
				<#else/>
					The results of studies on skin irritation are summarised in the following table:

				<@com.emptyLine/>
				<table border="1">
					<title>Studies on skin irritation</title>
					<col width="39%" />
					<col width="41%" />
					<col width="20%" />
					<tbody>
						<tr>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						</tr>

							<#list resultStudyList as study>

							<#--TODO Could be possible improved with incorporating the condition in the previous call, i.e. populateResultAndDataWaivingAndTestingProposalStudyLists. It prints empty tables if none of the studies are Irrotation -->
								<tr>
									<!-- Method -->
									<td>
										<para>
											<@com.picklist study.MaterialsAndMethods.TestAnimals.Species/> 
											<#if study.MaterialsAndMethods.TestAnimals.Strain?has_content>
												(<@com.picklist study.MaterialsAndMethods.TestAnimals.Strain/>)
											</#if>
										</para>

										<para>
											Coverage: <@com.picklist study.MaterialsAndMethods.TestSystem.TypeOfCoverage/> 
											<#if study.MaterialsAndMethods.TestSystem.PreparationOfTestSite?has_content>
												(<@com.picklist study.MaterialsAndMethods.TestSystem.PreparationOfTestSite/>)
											</#if>
										</para>

										<para>
											Vehicle: <@com.picklist study.MaterialsAndMethods.TestSystem.Vehicle/>
										</para>

										<para>
											<!-- <@csr.guidelineList study.MaterialsAndMethods.Guideline/> -->
										</para>

										<para>
											<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
										</para>
									</td>
									<!-- Results -->
									<td>
										<para>
											<@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/>
										</para>

										<para>
											<@inVitroList study.ResultsAndDiscussion.InVitro.Results/>
										</para>

										<para>
											<@inVivoList study.ResultsAndDiscussion.InVivo.Results/>
										</para>
									</td>
									<!-- Remarks -->
									<td>
										<!-- <@csr.studyRemarksColumn study/> -->
									</td>
								</tr>
								<@csr.tableRowForJustificationForTypeOfInformation study/>
							</#list>
					</tbody>
				</table>

				<#list resultStudyList as study>
					<para>
						Studies with results indicating corrosivity to the skin are summarised in section 5.4 Corrosivity.
					</para>
					<#break>
				</#list>

			</#if>

            <!-- Data waiving -->
            <!-- <@csr.dataWaiving dataWaivingStudyList "Skin Irritation"/> -->

            <!-- Testing proposal -->
            <!-- <@csr.testingProposal testingProposalStudyList "Skin Irritation"/> -->

		</section>



	</section>


</section>


<!-- Macros and functions -->
<#-- TODO It seems that all getSorted... functions could be incorporated in one -->
<#function getSortedBasicToxicokineticsOrDermalAbsorption documentKey documentType documentSubtype>
    <#assign studyList = iuclid.getSectionDocumentsForParentKey(documentKey, documentType, documentSubtype) />
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["basic toxicokinetics", "dermal absorption"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedAcuteToxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["acute toxicity: oral", "acute toxicity: inhalation", "acute toxicity: dermal"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinIrritation studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["skin irritation / corrosion"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinCorrosion studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["skin irritation / corrosion"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedEyeIrritation studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["eye irritation"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedRespiratoryTract studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["respiratory irritation"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedCarcinogenicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["carcinogenicity"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedDevelopmentToxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["developmental toxicity / teratogenicity"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedToxicityToReproInHumans studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["toxicity to reproduction / fertility"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedNeurotoxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["neurotoxicity"]) && PurposeFlag?has_content > 
			
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedImmunotoxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["immunotoxicity"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedEndpointNotSpecified studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["not applicable"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedCarcinogenicityOral studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["carcinogenicity: oral"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedCarcinogenicityInhalation studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["carcinogenicity: inhalation"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedCarcinogenicityDermal studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["carcinogenicity: dermal"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedCarcinogenicityOther studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["carcinogenicity, other"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinSensitisation studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local TypeOfSensitisationStudied = study.MaterialsAndMethods.TypeOfSensitisationStudied />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(TypeOfSensitisationStudied, ["skin"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinSensitisationEndpoint studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["skin sensitisation"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedRespiratorySensitisationEndpoint studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["respiratory sensitisation"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedRepeatedDoseToxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["repeated dose toxicity: oral", "repeated dose toxicity: inhalation", "repeated dose toxicity: dermal"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedGeneticToxicity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpointAddressed = study.MaterialsAndMethods.EndpointAddressed />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(endpointAddressed, ["genetic toxicity"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinSensitisationRespiratory studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local TypeOfSensitisationStudied = study.MaterialsAndMethods.TypeOfSensitisationStudied />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistMultipleValueMatchesPhrases(TypeOfSensitisationStudied, ["respiratory"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinIrritationNonHuman studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["skin irritation: in vitro / ex vivo", "skin irritation: in vivo", "skin irritation / corrosion, other"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinCorrosionNonHuman studyList endpointValueList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, endpointValueList) >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#macro AbsorptionList AbsorptionRepeatableBlock>
<#compress>
	<#if AbsorptionRepeatableBlock?has_content>
		<#list AbsorptionRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Absorption?has_content>
					<@com.range blockItem.Absorption/> % 
				</#if>	
				<#if blockItem.TimePoint?has_content>	
					at (<@com.picklist blockItem.TimePoint/>)
				</#if>
				<#if blockItem.Dose?has_content>
					(<@com.text blockItem.Dose/>) 
				</#if>	
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#-- TODO The following DosesConcentrations... macros could be merged in one -->
<#macro DosesConcentrationsList DosesConcentrationsRepeatableBlock>
<#compress>
	<#if DosesConcentrationsRepeatableBlock?has_content>
		<#list DosesConcentrationsRepeatableBlock as blockItem>
			<para role="indent">
				<@com.quantity blockItem.DoseConc/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>
<#macro DosesConcentrationsWithRemarksList DosesConcentrationsRepeatableBlock>
<#compress>
	<#if DosesConcentrationsRepeatableBlock?has_content>
		<#list DosesConcentrationsRepeatableBlock as blockItem>
			<para role="indent">
				<@com.quantity blockItem.DoseConc/>
				<?linebreak?>
				<@com.text blockItem.Remarks/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro BasicToxicokineticsMainAdmeResultsList MainAdmeResultsRepeatableBlock>
<#compress>
	<#if MainAdmeResultsRepeatableBlock?has_content>
		<#list MainAdmeResultsRepeatableBlock as blockItem>
			<para role="indent">
				Type: <@com.picklist blockItem.Type/>
				<?linebreak?>
				Result: <@com.text blockItem.Results/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro BasicToxicokineticsDosesConcentrationsList DosesConcentrationsRepeatableBlock>
<#compress>
	<#if DosesConcentrationsRepeatableBlock?has_content>
		<#list DosesConcentrationsRepeatableBlock as blockItem>
			<para role="indent">
				Doses/conc.: <@com.range blockItem.DosesConcentrations/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro ToxicokineticParametersList ParametersRepeatableBlock>
<#compress>
	<#if ParametersRepeatableBlock?has_content>
		<#list ParametersRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.ToxicokineticParameters/> 
				<#if blockItem.TestNo?has_content>
					(Test No.: <@com.picklist blockItem.TestNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro ADMEList ADMERepeatableBlock>
<#compress>
	<#if ADMERepeatableBlock?has_content>
		<#list ADMERepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Type/>
				<#if blockItem.Results?has_content>
					: <@com.text blockItem.Results/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro PercutaneousAbsorptionRateList  PercutaneousRepeatableBlock>
<#compress>
	<#if PercutaneousRepeatableBlock?has_content>
		<#list PercutaneousRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Absorption?has_content>
					<@com.range blockItem.Absorption/>(%) 
				</#if>	
				<#if blockItem.TimePoint?has_content>
					at <@com.quantity blockItem.TimePoint/>
				</#if>
				<#if blockItem.Dose?has_content>
					(<@com.text blockItem.Dose/>) 
				</#if>	
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro EyeIrritationInVitroList EyeIrritationInVitroRepeatableBlock>
<#compress>
	<#if EyeIrritationInVitroRepeatableBlock?has_content>
		<#list EyeIrritationInVitroRepeatableBlock as blockItem>
			<#if blockItem.RunExperiment?has_content || blockItem.Value?has_content>
				<para>
				<@com.picklist blockItem.IrritationParameter/>
				</para>
				<para role="indent">
					<para>
						<#if blockItem.RunExperiment?has_content>
							<@com.text blockItem.RunExperiment/>;
						</#if>
						
						<#if blockItem.Value?has_content>
							value <@com.range blockItem.Value/>
						</#if>
					</para>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro EyeIrritationInVivoList EyeIrritationInVivoRepeatableBlock>
<#compress>
	<#if EyeIrritationInVivoRepeatableBlock?has_content>
		<#list EyeIrritationInVivoRepeatableBlock as blockItem>
			<#if blockItem.Basis?has_content || blockItem.Score?has_content || blockItem.Scale?has_content || blockItem.TimePoint?has_content || blockItem.Reversibility?has_content || blockItem.RemarksOnResults?has_content>
				<para>
				<@com.picklist blockItem.Parameter/>
				</para>
				<para role="indent">
					<para>
						<#if blockItem.Basis?has_content>
							(<@com.picklist blockItem.Basis/>)
						</#if>
					
						<#if blockItem.Score?has_content>
							<@com.range blockItem.Score/>
						</#if>
					
						<#if blockItem.Scale?has_content>
							of max. <@com.number blockItem.Scale/>
						</#if>
					</para>
					
					<#if blockItem.TimePoint?has_content>
						<para>
							(Time point: <@com.picklist blockItem.TimePoint/>)
						</para>
					</#if>
					
					<#if blockItem.Reversibility?has_content>
						<para>
							<@com.picklist blockItem.Reversibility/>							
						</para>
					</#if>
					
					<#if blockItem.RemarksOnResults?has_content>
						<para>
							<@com.picklist blockItem.RemarksOnResults/>
						</para>
					</#if>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro TransferList  TransferRepeatableBlock>
<#compress>
	<#if TransferRepeatableBlock?has_content>
		<#list TransferRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.TransferType?has_content>
					Transfer (<@com.picklist blockItem.TransferType/>)
				</#if>	
				<#if blockItem.Observation?has_content>
					: <@com.picklist blockItem.Observation/> 
				</#if>
				<#if blockItem.TestNo?has_content>
					(<@com.picklist blockItem.TestNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro AbsorptionList AbsorptionRepeatableBlock>
<#compress>
	<#if AbsorptionRepeatableBlock?has_content>
		<#list AbsorptionRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Absorption?has_content>
					<@com.range blockItem.Absorption/> %
				</#if>
				<#if blockItem.TimePoint?has_content>
					at (<@com.picklist blockItem.TimePoint/>)
				</#if>
				<#if blockItem.Dose?has_content>
					(<@com.text blockItem.Dose/>)
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro BasicToxicokineticsMainAdmeResultsList MainAdmeResultsRepeatableBlock>
<#compress>
	<#if MainAdmeResultsRepeatableBlock?has_content>
		<#list MainAdmeResultsRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Type?has_content>
					Type: <@com.picklist blockItem.Type/>
				</#if>
				<#if blockItem.Results?has_content>
					Result: <@com.text blockItem.Results/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro BasicToxicokineticsDosesConcentrationsList DosesConcentrationsRepeatableBlock>
<#compress>
	<#if DosesConcentrationsRepeatableBlock?has_content>
		<#list DosesConcentrationsRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.DosesConcentrations?has_content>
					Doses/conc.: <@com.range blockItem.DosesConcentrations/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#-- TODO The following EffectLevels... macros could be merged in one -->
<#macro EffectLevelsList EffectsRepeatableBlock>
<#compress>
	<#if EffectsRepeatableBlock?has_content>
		<#list EffectsRepeatableBlock as blockItem>
			<#if blockItem.Endpoint?has_content || blockItem.Sex?has_content || blockItem.BasedOn?has_content || blockItem.RemarksOnResults?has_content>
			<para>
				<#if blockItem.Endpoint?has_content>
					<@com.picklist blockItem.Endpoint/>:
				</#if>
				<@com.range blockItem.EffectLevel/>
				<#if blockItem.Sex?has_content>
					(<@com.picklist blockItem.Sex/>)
				</#if>
				<#if blockItem.BasedOn?has_content>
					based on: (<@com.picklist blockItem.BasedOn/>) 
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>


<#macro EffectLevelsMatAbnormalitiesList EffectsMaternalRepeatableBlock>
<#compress>
	<#if EffectsMaternalRepeatableBlock?has_content>
		<#list EffectsMaternalRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Endpoint?has_content>
					<@com.picklist blockItem.Endpoint/>:
				</#if>
				<#if blockItem.EffectLevel?has_content>
					<@com.range blockItem.EffectLevel/>
				</#if>
				<#if blockItem.BasedOn?has_content>
					based on: (<@com.picklist blockItem.BasedOn/>) 
				</#if>	
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>
<#macro EffectLevelsFetusesList EffectsFetusesRepeatableBlock>
<#compress>
	<#if EffectsFetusesRepeatableBlock?has_content>
		<#list EffectsFetusesRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Endpoint?has_content>
					<@com.picklist blockItem.Endpoint/>:
				</#if>
				<#if blockItem.EffectLevel?has_content>
					<@com.range blockItem.EffectLevel/>
				</#if>
				<#if blockItem.BasedOn?has_content>
					based on: (<@com.picklist blockItem.BasedOn/>) 
				</#if>	
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>
<#macro EffectLevelsExtendedList EffectsExtendedRepeatableBlock>
<#compress>
	<#if EffectsExtendedRepeatableBlock?has_content>
		<#list EffectsExtendedRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Endpoint?has_content>
					<@com.picklist blockItem.Endpoint/>:
				</#if>
				<#if blockItem.EffectLevel?has_content>
					<@com.range blockItem.EffectLevel/> 
				</#if>
				<#if blockItem.Sex?has_content>
					(<@com.picklist blockItem.Sex/>)
				</#if>
				<#if blockItem.BasedOn?has_content>
					based on: (<@com.picklist blockItem.BasedOn/>)
				</#if>
				<#if blockItem.Basis?has_content>
					<@com.picklistMultiple blockItem.Basis/>
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro TargetSystemOrganToxList TargetRepeatableBlock>
<#compress>
	<#if TargetRepeatableBlock?has_content>
		<#list TargetRepeatableBlock as blockItem>
			<#if com.picklistValueMatchesPhrases(blockItem.CriticalEffectsObserved,["yes"])>
				<#local text_1>
					<#if com.picklistValueMatchesPhrases(blockItem.TreatmentRelated,["yes"])>
						treatment-related
					<#else>
                    	not treatment-related
					</#if>
				</#local>
				<#local text_2>
					<#if com.picklistValueMatchesPhrases(blockItem.DoseResponseRelationship,["yes"])>
                    	dose-response: yes
					<#else>
                    	dose-response: no
					</#if>
				</#local>
				<para role="indent">
                    <emphasis role="bold">Target system  / organ toxicity</emphasis>
                    <?linebreak?>
					<#if blockItem.System?has_content>
						Lowest effective dose /concentration: <@com.picklist blockItem.System/>
					</#if>	
					<#if blockItem.Organ?has_content>
						: <@com.picklistMultiple blockItem.Organ/>
					</#if>
					<#if blockItem.LowestEffectiveDoseConc?has_content>
						(lowest effective dose/conc.: <@com.quantity blockItem.LowestEffectiveDoseConc/> ; ${text_1} ; ${text_2})
					</#if>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro TargetSystemOrganToxforEffectLevelsList TargetEffectRepeatableBlock>
<#compress>
	<#if TargetEffectRepeatableBlock?has_content>
		<#list TargetEffectRepeatableBlock as blockItem>
			<#local criticalEffectsObserved><@com.picklist blockItem.CriticalEffectsObserved/>></#local>
			<#if criticalEffectsObserved?matches(".*yes.*")>
			<para role="indent">
				Target system / organ toxicity:
                <?linebreak?>
				<@com.quantity blockItem.LowestEffectiveDoseConc/>
				<#if blockItem.System?has_content>
					(on <@com.picklist blockItem.System/>
				</#if>
				<#if blockItem.Organ?has_content>
					<@com.picklistMultiple blockItem.Organ/>)
					<?linebreak?>
					<#else/>
					)
				</#if>
			</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro InductionList InductionRepeatableBlock Endpoint>
<#compress>
	<#if InductionRepeatableBlock?has_content>
		<#list InductionRepeatableBlock as blockItem>
			<#if Endpoint?matches(".*skin sensitisation: in vivo (non-LLNA).*")>
				<para role="indent">
					Induction: <@com.picklist blockItem.Route/>
					Vehicle: <@com.picklist blockItem.Vehicle/>
				</para>
			<#elseif Endpoint?matches(".*skin sensitisation: in vivo (LLNA).*")>
	            <para role="indent">
	                Vehicle: <@com.picklist blockItem.Vehicle/>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#--TODO The following two macros could be possible merged to one -->
<#macro inVivoLLNAList inVivoLLNARepeatableBlock endPoint>
	<#if !endPoint?matches(".*(LLNA).*")>
		<#return>
	</#if>
	<#compress>
	<#if inVivoLLNARepeatableBlock?has_content>
		<#list inVivoLLNARepeatableBlock as blockItem>
				<#local parameter>
					<@com.picklist blockItem.Parameter />
				</#local>
				<#if parameter?matches(".*SI.*")>
					<#local prefix = "Stimulation index: " />
				<#else>
					<#local prefix = parameter + ": "/>
				</#if>
		        <para role="indent">
					${prefix} <@com.range blockItem.Value/> (<@com.picklist blockItem.RemarksOnResults/>)
				</para>
		</#list>
  	</#if>
	</#compress>
</#macro>
<#macro inVitroLLNAList inVivoLLNARepeatableBlock endPoint>
	<#if !endPoint?matches(".*in vitro.*") && !endPoint?matches(".*in chemico.*")>
		<#return>
	</#if>
	<#compress>
		<#if inVivoLLNARepeatableBlock?has_content>
			<#list inVivoLLNARepeatableBlock as blockItem>
				<#if com.picklistValueMatchesPhrases(blockItem.Parameter, ["other:"]) >
					<para role="indent">
						Results:
                        <?linebreak?>
						<@com.picklist blockItem.Parameter /> <@com.range blockItem.Value/> 
						<#if blockItem.RemarksOnResults?has_content>
							(<@com.picklist blockItem.RemarksOnResults/>)
						</#if>
					</para>
				</#if>
			</#list>
		</#if>
	</#compress>
</#macro>

<#macro inVivoNonLLNAList inVivoNonLLNARepeatableBlock endPoint>
	<#if endPoint?matches(".*non-LLNA.*")>
		<#compress>
		<#if inVivoNonLLNARepeatableBlock?has_content>
			<#list inVivoNonLLNARepeatableBlock as blockItem>
		<para role="indent">
			<#if blockItem.Reading?has_content>
				No. with positive reactions: <@com.picklist blockItem.Reading/>
			</#if>	
			<#if blockItem.NoWithReactions?has_content>
				: <@com.number blockItem.NoWithReactions/>
			</#if>
			<#if blockItem.TotalNoInGroup?has_content>
				out of <@com.number blockItem.TotalNoInGroup/>
				<?linebreak?>
			</#if>			
			<#if blockItem.Group?has_content>
				(<@com.picklist blockItem.Group/>
			</#if>
			<#if blockItem.HoursAfterChallenge?has_content>
				; <@com.number blockItem.HoursAfterChallenge/>
				<#else/>
				<?linebreak?>
			</#if>
			<#if blockItem.DoseLevel?has_content>
				h after challenge; dose: <@com.text blockItem.DoseLevel/>)
				<#else/>
				)
				<?linebreak?>
			</#if>
			<#if blockItem.RemarksOnResults?has_content>
				(<@com.picklist blockItem.RemarksOnResults/>)
			</#if>
		</para>
		</#list>
		</#if>
		</#compress>
	</#if>
</#macro>

<#macro ControlsList ControlRepeatableBlock>
<#compress>
	<#if ControlRepeatableBlock?has_content>
		<#list ControlRepeatableBlock as blockItem>
			<para role="indent">
				Positive control substance(s): <@com.picklistMultiple blockItem.PositiveControlSubstance/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro TestResultsList TestResultsRepeatableBlock>
<#compress>
	<#if TestResultsRepeatableBlock?has_content>
		<#list TestResultsRepeatableBlock as blockItem>
			<#local genotoxicity><@com.picklist blockItem.Genotoxicity/></#local>
			<#local organism><@com.picklist blockItem.Organism/></#local>
			<#local metActIndicator><@com.picklist blockItem.MetActIndicator/></#local>
			<#local cytotoxicity><@com.picklist blockItem.Cytotoxicity/></#local>
			<#local vehContrValid><@com.picklist blockItem.VehContrValid/></#local>
			<#local negContrValid><@com.picklist blockItem.NegContrValid/></#local>
			<#local posContrValid><@com.picklist blockItem.PosContrValid/></#local>
			<#local remarksOnResults><@com.picklist blockItem.RemarksOnResults/></#local>
			<#if genotoxicity?has_content || organism?has_content || metActIndicator?has_content || cytotoxicity?has_content || vehContrValid?has_content || negContrValid?has_content || posContrValid?has_content >
			<para role="indent">
				Test results:
				<?linebreak?>
				${genotoxicity} for ${organism};
				<?linebreak?>
				met. act.: ${metActIndicator}
				<?linebreak?>
				genotoxicity: ${genotoxicity}
				cytotoxicity: ${cytotoxicity}
				<?linebreak?>
				vehicle controls valid: ${vehContrValid}
				<?linebreak?>
				negative controls valid: ${negContrValid}
				<?linebreak?>
				positive controls valid: ${posContrValid}
				<?linebreak?>
				<#if remarksOnResults?has_content>
				Remark: ${remarksOnResults}
				</#if>
			</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro TestResultsInVivoList TestResultsRepeatableBlock>
<#compress>
	<#if TestResultsRepeatableBlock?has_content>
		<#list TestResultsRepeatableBlock as blockItem>
			<#local genotoxicity><@com.picklist blockItem.Genotoxicity/></#local>
			<#local sex><@com.picklist blockItem.Sex/></#local>
			<#local toxicity><@com.picklist blockItem.Toxicity/></#local>
			<#local vehContrValid><@com.picklist blockItem.VehContrValid/></#local>
			<#local negContrValid><@com.picklist blockItem.NegContrValid/></#local>
			<#local posContrValid><@com.picklist blockItem.PosContrValid/></#local>
			<#local remarksOnResults><@com.picklist blockItem.RemarksOnResults/></#local>
			<#if genotoxicity?has_content || sex?has_content || toxicity?has_content || vehContrValid?has_content || negContrValid?has_content || posContrValid?has_content || remarksOnResults?has_content>
			<para role="indent">
				Genotoxicity: ${genotoxicity} (${sex})
				<?linebreak?>
				toxicity: ${toxicity}
				<?linebreak?>
                vehicle controls valid: ${vehContrValid}
                <?linebreak?>
                negative controls valid: ${negContrValid}
                <?linebreak?>
                positive controls valid: ${posContrValid}
                <?linebreak?>
                Remark: ${remarksOnResults}
			</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro SpeciesStrainList SpeciesStrainRepeatableBlock>
<#compress>
	<#if SpeciesStrainRepeatableBlock?has_content>
		<#list SpeciesStrainRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.SpeciesStrain/>
				<#if blockItem.MetabolicActivation?has_content>
					(Met. act.: <@com.picklist blockItem.MetabolicActivation/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro EffectLevelsPoList EffectLevelsPORepeatableBlock>
<#compress>
	<#if EffectLevelsPORepeatableBlock?has_content>
		<#list EffectLevelsPORepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Endpoint/>
				<#if blockItem.EffectLevel?has_content>
					(PO) <@com.range blockItem.EffectLevel/>)
				<?linebreak?>
				</#if>
				<#if blockItem.Sex?has_content>
					(<@com.picklist blockItem.Sex/>) 
				</#if>
				<#if blockItem.Basis?has_content>
					based on: <@com.picklistMultiple blockItem.Basis/>
				<?linebreak?>
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro SecondparentalGenerationP1List SecondPgenerationEffectLevelsRepeatableBlock>
<#compress>
	<#if SecondPgenerationEffectLevelsRepeatableBlock?has_content>
		<#list SecondPgenerationEffectLevelsRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Endpoint/>
				<#if blockItem.EffectLevel?has_content>
					(PO): <@com.range blockItem.EffectLevel/>
				<?linebreak?>
				</#if>				
				<#if blockItem.Sex?has_content>
					(<@com.picklist blockItem.Sex/>) 
				</#if>	
				<#if blockItem.Basis?has_content>
					based on: <@com.picklistMultiple blockItem.Basis/>
				<?linebreak?>
				</#if>
				<@com.picklist blockItem.RemarksOnResults/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro FgenerationList FgenerationListRepeatableBlock>
<#compress>
	<#if FgenerationListRepeatableBlock?has_content>
		<#list FgenerationListRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Endpoint/> 
				<#if blockItem.EffectLevel?has_content>
					(PO): <@com.range blockItem.EffectLevel/>
				<?linebreak?>
				</#if>
				<#if blockItem.Sex?has_content>
					(<@com.picklist blockItem.Sex/>) 
				</#if>
				<#if blockItem.Basis?has_content>
					based on: <@com.picklistMultiple blockItem.Basis/>
				<?linebreak?>
				</#if>
				<@com.picklist blockItem.RemarksOnResults/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro OverallReproductiveToxicityList ReproToxRepeatableBlock>
<#compress>
	<#if ReproToxRepeatableBlock?has_content>
		<#list ReproToxRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.ReproductiveEffectsObserved/>
				Lowest effective dose / concentration <@com.quantity blockItem.LowestEffectiveDoseConc/>
				<?linebreak?>
				Relation to other toxic effects: <@com.picklist blockItem.RelationToOtherToxicEffects/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro MatAbnormalitiesList MatAbnormalitiesRepeatableBlock>
<#compress>
	<#if MatAbnormalitiesRepeatableBlock?has_content>
		<#list MatAbnormalitiesRepeatableBlock as blockItem>
			<para role="indent">
				Maternal abnormalities <@com.picklist blockItem.Abnormalities/>
				<?linebreak?>
				<@com.picklistMultiple blockItem.Localisation/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro FetalAbnormalitiesList FetalAbnormalitiesRepeatableBlock>
<#compress>
	<#if FetalAbnormalitiesRepeatableBlock?has_content>
		<#list FetalAbnormalitiesRepeatableBlock as blockItem>
			<para role="indent">
				Fetal abnormalities <@com.picklist blockItem.Abnormalities/>
				<?linebreak?>
				<@com.picklistMultiple blockItem.Localisation/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro OverallDevToxList OverallDevToxRepeatableBlock>
<#compress>
	<#if OverallDevToxRepeatableBlock?has_content>
		<#list OverallDevToxRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.DevelopmentalEffectsObserved/>
				<?linebreak?>
				Lowest effective dose / concentration: <@com.quantity blockItem.LowestEffectiveDoseConc/>
				Relation to maternal toxicity: <@com.picklist blockItem.RelationToMaternalToxicity/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<!-- new macros from updated macros.csr -->
<#macro endpointSummaryDiscussion summary valueForCsaText="" printName=false>
	<@summaryKeyInformation summary/>
	<@com.emptyLine/>
	<@summaryAdditionalInformation summary/>
</#macro>

<#macro summaryKeyInformation summary>
	<#if summary.KeyInformation.KeyInformation?has_content>
		<?linebreak?>
		<para><emphasis role="underline">Key Information:</emphasis></para>
		<@com.richText summary.KeyInformation.KeyInformation/>
	</#if>
</#macro>

<#macro summaryKeyInformationWithoutTitle summary>
	<#if summary.KeyInformation.KeyInformation?has_content>
		<@com.richText summary.KeyInformation.KeyInformation/>
	</#if>
</#macro>

<#macro summaryAdditionalInformation summary>
	<#if summary.Discussion.Discussion?has_content>
		<?linebreak?>
		<para><emphasis role="underline">Discussion:</emphasis></para>
		<@com.richText summary.Discussion.Discussion/>
	</#if>
</#macro>

<#macro summaryAdditionalInformationDiscussion summary>
	<#if summary.Discussion.Discussion?has_content>
		<@com.emptyLine/>
		<?linebreak?>
		<para><emphasis role="underline">Additional information</emphasis></para>
		<@com.richText summary.Discussion.Discussion/>
	</#if>
</#macro>

<#macro endpointSummaryForSpecificInvestigations summary valueForCsaText="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<@summaryKeyInformationWithoutTitle summary/>
	<@summaryAdditionalInformationDiscussion summary/>
</#macro>

<#-- TODO The following endpointSummaryX macros could be merged in one -->
<#macro endpointSummary01 summary valueForCsaText01="" printName=false>
	<para>
		<#if printName>
			<para><emphasis role="bold"><@com.text summary.name/></emphasis></para>
		</#if>
	</para>
	<@summaryKeyInformation summary/>
	<#if valueForCsaText01?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (via oral route - systemic effects):</emphasis>
			<?linebreak?>
			${valueForCsaText01}
		</para>
	</#if>
</#macro>
<#macro endpointSummary1 summary valueForCsaText1="" printName=false>
	<#if valueForCsaText1?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (dermal - systemic effects):</emphasis>
			<?linebreak?>
			${valueForCsaText1}
		</para>
	</#if>
</#macro>
<#macro endpointSummary2 summary valueForCsaText2="" printName=false>
	<#if valueForCsaText2?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (dermal - local effects):</emphasis>
			<?linebreak?>
			${valueForCsaText2}
		</para>
	</#if>
	<@summaryAdditionalInformation1 summary/>
</#macro>
<#macro endpointSummary3 summary valueForCsaText3="" printName=false>
	<#if valueForCsaText3?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (inhalation - systemic effects):</emphasis>
			<?linebreak?>
			${valueForCsaText3}
		</para>
	</#if>
</#macro>
<#macro endpointSummary4 summary valueForCsaText4="" printName=false>
	<#if valueForCsaText4?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (inhalation - local effects):</emphasis>
			<?linebreak?>
			${valueForCsaText4}
		</para>
	</#if>
</#macro>
<#macro endpointSummary5 summary valueForCsaText5="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<#if valueForCsaText5?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (route: oral):</emphasis>
			<?linebreak?>
			${valueForCsaText5}
		</para>
	</#if>
</#macro>
<#macro endpointSummary6 summary valueForCsaText6="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<#if valueForCsaText6?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (route: dermal):</emphasis>
			<?linebreak?>
			${valueForCsaText6}
		</para>
	</#if>
</#macro>
<#macro endpointSummary7 summary valueForCsaText7="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<#if valueForCsaText7?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (route: inhalation):</emphasis>
			<?linebreak?>
			${valueForCsaText7}
		</para>
	</#if>
		<@summaryAdditionalInformation1 summary/>
</#macro>
<#macro endpointSummary8 summary valueForCsaText8="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<#if valueForCsaText8?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (route: inhalation):</emphasis>
			<?linebreak?>
			${valueForCsaText8}
		</para>
	</#if>
	<@summaryAdditionalInformation2 summary/>
</#macro>
<#macro endpointSummary9 summary valueForCsaText9="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<#if valueForCsaText9?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA (route: inhalation):</emphasis>
			<?linebreak?>
			${valueForCsaText9}
		</para>
	</#if>
	<@summaryAdditionalInformation3 summary/>
</#macro>

<#-- TODO The following summaryKeyInformationX macros could be merged in one -->
<#macro summaryKeyInformation summary>
	<#if summary.KeyInformation.KeyInformation?has_content>
		<?linebreak?>
		<para><emphasis role="underline">Key Information:</emphasis></para>
		<@com.richText summary.KeyInformation.KeyInformation/>
	</#if>
</#macro>
<#macro summaryKeyInformation1 summary>
	<#if summary.KeyValueForChemicalSafetyAssessment.GeneticToxicityInVitro.DescriptionOfKeyInformation.KeyInfo?has_content>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.GeneticToxicityInVitro.DescriptionOfKeyInformation.KeyInfo/>
	</#if>
</#macro>
<#macro summaryKeyInformation2 summary>
	<#if summary.KeyValueForChemicalSafetyAssessment.GeneticToxicityInVivo.DescriptionOfKeyInformation.KeyInfo?has_content>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.GeneticToxicityInVivo.DescriptionOfKeyInformation.KeyInfo/>
	</#if>
</#macro>

<#-- TODO The following summaryAdditionalInformation macros could be merged in one -->
<#macro summaryAdditionalInformation summary>
	<#if summary.Discussion.Discussion?has_content>
		<?linebreak?>
		<para><emphasis role="underline">Discussion:</emphasis></para>
		<@com.richText summary.Discussion.Discussion/>
	</#if>
</#macro>
<#macro summaryAdditionalInformation1 summary>
	<#if summary.Discussion.Discussion?has_content>
		<?linebreak?>
		<@com.emptyLine/>
		<para><emphasis role="underline">Additional information:</emphasis></para>
		<@com.richText summary.Discussion.Discussion/>
	</#if>
</#macro>
<#macro summaryAdditionalInformation2 summary>
	<#if summary.KeyValueForChemicalSafetyAssessment.EffectsOnFertility.AdditionalInformation.AdditionalInfo?has_content>
		<?linebreak?>
		<@com.emptyLine/>
		<para><emphasis role="underline">Additional information:</emphasis></para>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.EffectsOnFertility.AdditionalInformation.AdditionalInfo/>
	</#if>
</#macro>
<#macro summaryAdditionalInformation3 summary>
	<#if summary.KeyValueForChemicalSafetyAssessment.EffectsOnDevelopmentalToxicity.AdditionalInformation.AdditionalInfo?has_content>
		<?linebreak?>
		<@com.emptyLine/>
		<para><emphasis role="underline">Additional information:</emphasis></para>
		<@com.richText summary.KeyValueForChemicalSafetyAssessment.EffectsOnDevelopmentalToxicity.AdditionalInformation.AdditionalInfo/>
	</#if>
</#macro>

<#macro endpointSummaryTitles summary valueForCsaText="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<@summaryKeyInformation summary/>
	<#if valueForCsaText?has_content>
		<para>
			<@com.emptyLine/>
			<emphasis role="bold">Value used for CSA:</emphasis>
			${valueForCsaText}
		</para>
	</#if>
	<@summaryAdditionalInformationTitles summary/>
</#macro>

<#macro summaryAdditionalInformationTitles summary>
	<#if summary.Discussion.Discussion?has_content>
	<@com.emptyLine/>
		<para><emphasis role="underline">Additional information:</emphasis></para>
		<@com.richText summary.Discussion.Discussion/>
	</#if>
</#macro>

<#macro endpointSummaryAddInfoOnly summary valueForCsaText="" printName=false>
	<#if printName>
		<para><@com.text summary.name/></para>
	</#if>
	<@summaryAdditionalInformationTitles summary/>
</#macro>

<#-- TODO The following isXXXStudy macros could be merged in one -->
<#function isIrritationStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local InterpretationResults = study.ApplicantSummaryAndConclusion.InterpretationOfResults />
	<#return com.picklistValueMatchesPhrases(InterpretationResults, [".*irritant.*"]) />
</#function>
<#function isEyeIrritantStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local InterpretationResults = study.ApplicantSummaryAndConclusion.InterpretationOfResults />
	<#return com.picklistValueMatchesPhrases(InterpretationResults, [".*eye.*"]) />
</#function>
<#function isCorrosionStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local InterpretationResults = study.ApplicantSummaryAndConclusion.InterpretationOfResults />
	<#return com.picklistValueMatchesPhrases(InterpretationResults, [".*corrosive.* || .*irritant.* || .*classification.* || .*GHS.* || .*other:.* || .* .*"]) />
</#function>
<#function isRespiratoryTrackStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local InterpretationResults = study.ApplicantSummaryAndConclusion.InterpretationOfResults />
	<#return com.picklistValueMatchesPhrases(InterpretationResults, ["Category 1 (irreversible effects on the eye) based on GHS criteria"]) />
</#function>

<#macro inVitroList inVitroRepeatableBlock>
<#compress>
	<#if inVitroRepeatableBlock?has_content>
		<#local sortedList = iuclid.sortByField(inVitroRepeatableBlock, "IrritationCorrosionParameter", ["% tissue viability","transcutaneous electrical resistance (in kΩ)","dye content (µg/disc)","penetration time (in minutes)"]) />

		<#local currentHeader><@com.picklist sortedList[0].IrritationCorrosionParameter/></#local>
		<para>${currentHeader}</para>

		<#list sortedList as blockItem>
			<#local parameter><@com.picklist blockItem.IrritationCorrosionParameter/></#local>
			<#if !(currentHeader == parameter)>
				<#local currentHeader = parameter/>
				<para>${currentHeader}</para>
			</#if>
			<para role="indent">
				<#if blockItem.RunExperiment?has_content>
					<@com.text blockItem.RunExperiment/>. 
				</#if>
				<#if blockItem.Value?has_content>
					Value: <@com.range blockItem.Value/>
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro inVivoList inVivoRepeatableBlock>
<#compress>
	<#if inVivoRepeatableBlock?has_content>
		<#local sortedList = iuclid.sortByField(inVivoRepeatableBlock, "Parameter", ["overall irritation score","primary dermal irritation index (PDII)","erythema score","edema score"]) />

		<#local currentHeader><@com.picklist sortedList[0].Parameter/></#local>
		<para>${currentHeader}</para>

		<#list sortedList as blockItem>
			<#local parameter><@com.picklist blockItem.Parameter/></#local>
			<#if !(currentHeader == parameter)>
				<#local currentHeader = parameter/>
				<para>${currentHeader}</para>
			</#if>
			<para role="indent">
				<@com.range blockItem.Score/> 
				<#if blockItem.Scale?has_content>
					of max. <@com.number blockItem.Scale/>
				</#if>
				<#if blockItem.TimePoint?has_content>
					(Time point: <@com.picklist blockItem.TimePoint/>)
				</#if>
				<#if blockItem.Reversibility?has_content>			
					Reversibility: <@com.picklist blockItem.Reversibility/>
				</#if>
				<para>
					<#if blockItem.RemarksOnResults?has_content>
						(<@com.picklist blockItem.RemarksOnResults/>)
					</#if>
				</para>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#function determineEndpointTextRepeatedDose endpoint values valuesText emptyText >
    <#if endpoint?has_content>
        <#assign endpointValue><@com.picklist endpoint /></#assign>
        <#list values as value>
            <#if endpointValue == value>
                <#return valuesText[values?seq_index_of(value)] />
            </#if>
        </#list>
        <#return endpointValue />
    </#if>
    <#return emptyText />
</#function>
<#function determineEndpointTextTypeOfAssay study emptyText>
    <#if study?has_content && study.MaterialsAndMethods.TypeOfAssay?has_content>
        <#assign typeOfAssay><@com.picklist study.MaterialsAndMethods.TypeOfAssay/></#assign>
    </#if>
    <#assign endpoint>(<@com.picklist study.AdministrativeData.Endpoint/>)</#assign>
    <#return emptyText + typeOfAssay!"" + routeOfAdministration!"" + endpoint />
</#function>

<#function determineEndpointTextStudyType study emptyText >
    <#if study?has_content && study.MaterialsAndMethods.Studytype?has_content>
        <#assign studyType><@com.picklist study.MaterialsAndMethods.Studytype/></#assign>
    </#if>
    <#assign routeOfAdministration>(<@com.picklist study.MaterialsAndMethods.AdministrationExposure.RouteOfAdministration />)</#assign>
    <#assign endpoint>(<@com.picklist study.AdministrativeData.Endpoint/>)</#assign>
    <#return emptyText + studyType!"" + routeOfAdministration + endpoint />
</#function>
<#function determineEndpointTextRouteOfAdministration study emptyText >
    <#if study?has_content && study.MaterialsAndMethods.AdministrationExposure.RouteOfAdministration?has_content>
        <#assign routeOfAdministration>(<@com.picklist study.MaterialsAndMethods.AdministrationExposure.RouteOfAdministration />)</#assign>
        <#return emptyText + "(other routes)" + routeOfAdministration />
    </#if>
    <#return emptyText + "(Route: not specified)" />
</#function>

<#macro justification summary path>
	<#compress>
		<#local field = "summary.JustificationForClassificationOrNonClassification."+path />
		
		<#if (field?eval)?has_content >
		<@com.emptyLine/>
			<para><emphasis role="bold">Justification for classification or non classification: </emphasis><@com.richText field?eval /></para>
		</#if>
    </#compress>
	<@com.emptyLine/>
</#macro>