<!-- 1. IDENTITY OF THE SUBSTANCE AND PHYSICAL AND CHEMICAL PROPERTIES template file -->

<section>
<title role="HEAD-2">Physical, chemical and technical properties</title>

    <!-- Physicochemical properties table -->

    <#assign propertyToDataMap = {
        "Physical state at 20 °C and 101.3 kPa" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Colour at 20 °C and 101.3 kPa" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Odour at 20 °C and 101.3 kPa" :
            {"subType" : "GeneralInformation",
            "listValueTextPath" : "ResultsAndDiscussion.SubstanceType"},
        "Acidity / alkalinity" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Relative density / bulk density" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Storage stability test - accelerated storage" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Storage stability test – long term storage at ambient temperature" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Storage stability test – low temperature stability test for liquids" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Effects on content of the active substance and technical characteristics of the biocidal product - light" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Effects on content of the active substance and technical characteristics of the biocidal product – temperature and humidity" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Effects on content of the active substance and technical characteristics of the biocidal product - reactivity towards container material" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Wettability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Suspensibility, spontaneity and dispersion stability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Wet sieve analysis and dry sieve test" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Emulsifiability, re-emulsifiability and emulsion stability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Disintegration time" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Particle size distribution, content of dust/fines, attrition, friability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Persistent foaming" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Flowability/Pourability/Dustability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Burning rate — smoke generators" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Burning completeness — smoke generators" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Composition of smoke — smoke generators" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Spraying pattern — aerosols" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Physical compatibility" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Chemical compatibility" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Degree of dissolution and dilution stability" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Surface tension" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"},
        "Viscosity" :
            {"subType" : "GeneralInformation",
            "listValuePath" : "ResultsAndDiscussion.SubstancePhysicalState"}
    }/>

    <#assign properties = propertyToDataMap?keys />

    <#if properties?has_content>


    <table border="1">
        <title>Physicochemical properties</title>
        <#if csr.assessmentEntitiesExist>
            <col width="18%" />
            <col width="34%" />
            <col width="33%" />
            <col width="15%" />
        <#else/>
            <col width="20%" />
            <col width="40%" />
            <col width="40%" />
        </#if>
        <tbody>
            <tr>
                <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Property</emphasis></th>
                <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Description of key information</emphasis></th>
                <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Value used for CSA / Discussion</emphasis></th>
                <#if csr.assessmentEntitiesExist>
                <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Assessment entity linked</emphasis></th>
                </#if>
            </tr>

            <#list properties as property>

                <#assign propertyData = propertyToDataMap[property] />
                <#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", propertyData["subType"]) />

                <#assign usespan = true />

                <#list summaryList as summary>
                    <tr>
                        <!-- Property -->
                        <#if usespan>
                            <td  rowspan="${summaryList?size}">
                            ${property!}
                            </td>
                            <#assign usespan = false />
                        </#if>
                        <!-- Description of key information -->
                        <td>
                        <@com.richText summary.ApplicantSummaryAndConclusion.ExecutiveSummary/>
                        </td>
                        <!-- Value used for CSA / Discussion -->
                        <td>
                            <@valueForCSA summary propertyData/>
                        </td>
                    </tr>
                </#list>
            </#list>
        </tbody>
    </table>
    </#if>

</section>


<@com.emptyLine/>
<section>
	<title role="HEAD-2">Phys Chem</title>

	<table border="1">
		<title>Summary table of physical, chemical and technical properties</title>
		<col width="20%" />
		<col width="20%" />
		<col width="10%" />
		<col width="30%" />
		<col width="20%" />
		<tbody>
			<tr>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Property</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Guideline and Method</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Purity of the test substance (%w/w)</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Reference</emphasis></th>
			</tr>
						
			<!-- PHYSICAL STATE -->
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "GeneralInformation") />

			<!-- Study results -->
			<#if !studyList?has_content>
				<@com.emptyLine/>
				No relevant information available.
			<#else/>
				<#list studyList as study>
					<tr>
						<!-- Endpoint / Property -->
						<td>
							<emphasis role="bold">Physical State</emphasis>
						</td>
						<!-- Guideline, Method -->
						<td>
							<para> <emphasis role="bold">Guideline</emphasis>: <@csr.guidelineList study.MaterialsAndMethods.Guideline/> </para>
							<para> <@com.text study.MaterialsAndMethods.MethodNoGuideline/> </para>
						</td>
						<!-- Purity Test substance -->
						<td>								
							<para>
							<#if !study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy?has_content>
								Pure product tested
							<#else>
								<@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>  
							</#if>
							</para>
						</td>							
						<!-- Results -->
						<td>
							<para> <@com.picklist study.ResultsAndDiscussion.SubstancePhysicalState/> </para>
						</td>							
						<!-- Reference -->
						<td>
							<para>  <@csr.studyReference study/> </para>
						</td>
					</tr>
				</#list>
				</#if>
							

			<!-- COLOUR -->
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "GeneralInformation") />

			<!-- Study results -->
			<#if !studyList?has_content>
				<@com.emptyLine/>
				No relevant information available.
			<#else/>
				<#list studyList as study>
					<tr>
						<!-- Endpoint / Property -->
						<td>
							<emphasis role="bold">Colour</emphasis>
						</td>
						<!-- Guideline, Method -->
						<td>
							<para> <emphasis role="bold">Guideline</emphasis>: <@csr.guidelineList study.MaterialsAndMethods.Guideline/> </para>
							<para> <@com.text study.MaterialsAndMethods.MethodNoGuideline/> </para>
						</td>
						<!-- Purity Test substance -->
						<td>								
							<para>
							<#if !study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy?has_content>
								Pure product tested
							<#else>
								<@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>  
							</#if>
							</para>
						</td>							
						<!-- Results -->
						<td>
		                   <#list study.ResultsAndDiscussion.FormBlock as formColourOdourBlock>
		                             <#if formColourOdourBlock?has_content>
		                                      <para><@com.text formColourOdourBlock.SubstanceColour/></para>
		                             </#if>
		                   </#list>
						</td>							
						<!-- Reference -->
						<td>
							<para>  <@csr.studyReference study/> </para>
						</td>
					</tr>
				</#list>
				</#if>


			<!-- ODOUR -->
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "GeneralInformation") />

			<!-- Study results -->
			<#if !studyList?has_content>
				<@com.emptyLine/>
				No relevant information available.
			<#else/>
				<#list studyList as study>
					<tr>
						<!-- Endpoint / Property -->
						<td>
							<emphasis role="bold">Odour</emphasis>
						</td>
						<!-- Guideline, Method -->
						<td>
							<para> <emphasis role="bold">Guideline</emphasis>: <@csr.guidelineList study.MaterialsAndMethods.Guideline/> </para>
							<para> <@com.text study.MaterialsAndMethods.MethodNoGuideline/> </para>
						</td>
						<!-- Purity Test substance -->
						<td>								
							<para>
							<#if !study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy?has_content>
								Pure product tested
							<#else>
								<@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>  
							</#if>
							</para>
						</td>							
						<!-- Results -->
						<td>
		                   <#list study.ResultsAndDiscussion.FormBlock as formColourOdourBlock>
		                             <#if formColourOdourBlock?has_content>
		                                      <para><@com.picklist formColourOdourBlock.Odour/></para>
		                             </#if>
		                   </#list>
						</td>							
						<!-- Reference -->
						<td>
							<para>  <@csr.studyReference study/> </para>
						</td>
					</tr>
				</#list>
				</#if>


			<!-- ACIDITY / ALKALINITY -->
			
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Ph") />
			<#assign studyList2 = getSortedAcidity(studyList) />
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList2/>

			<!-- Study results -->
			<#if !resultStudyList?has_content>
				<@com.emptyLine/>
				No relevant information available.
			<#else/>
				<#list resultStudyList as study>
					<tr>
						<!-- Endpoint / Property -->
						<td>
							<emphasis role="bold">Acidity / alkalinity</emphasis>
							<para> <@com.picklist study.AdministrativeData.Endpoint /> </para>
						</td>
						<!-- Guideline, Method -->
						<td>
							<para> <emphasis role="bold">Guideline</emphasis>: <@csr.guidelineList study.MaterialsAndMethods.Guideline/> </para>
							<para> <@com.text study.MaterialsAndMethods.MethodNoGuideline/> </para>
						</td>
						<!-- Purity Test substance -->
						<td>								
							<para>
							<#if !study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy?has_content>
								Pure product tested
							<#else>
								<@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>  
							</#if>
							</para>
						</td>							
						<!-- Results -->
						<td>
							<para> <@ResultList study.ResultsAndDiscussion.phValue/> </para>
						</td>							
						<!-- Reference -->
						<td>
							<para>  <@csr.studyReference study/> </para>
						</td>
					</tr>
				</#list>
			</#if>
				
			<!-- Relative density -->
			
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Density") />
			<#assign studyList2 = getSortedDensity(studyList) />
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList2/>

			<!-- Study results -->
			<#if !resultStudyList?has_content>
				<@com.emptyLine/>
				No relevant information available.
			<#else/>
				<#list resultStudyList as study>
					<tr>
						<!-- Endpoint / Property -->
						<td>
							<emphasis role="bold">Relative density / bulk density</emphasis>
							<para> <@com.picklist study.AdministrativeData.Endpoint /> </para>
						</td>
						<!-- Guideline, Method -->
						<td>
							<para> <emphasis role="bold">Guideline</emphasis>: <@csr.guidelineList study.MaterialsAndMethods.Guideline/> </para>
							<para> <@com.text study.MaterialsAndMethods.MethodNoGuideline/> </para>
						</td>
						<!-- Purity Test substance -->
						<td>								
							<para>
							<#if !study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy?has_content>
								Pure product tested
							<#else>
								<@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>  
							</#if>
							</para>
						</td>							
						<!-- Results -->
						<td>
							<para> <@ResultList2 study.ResultsAndDiscussion.Density/> </para>
						</td>							
						<!-- Reference -->
						<td>
							<para>  <@csr.studyReference study/> </para>
						</td>
					</tr>
				</#list>
			</#if>


		</tbody>
	</table>
				
</section>


<!-- Macros and functions -->
<#function isOriginElement substance>
<#if !(substance?has_content)>
<#return false>
</#if>
<#if com.picklistValueMatchesPhrases(substance.TypeOfSubstance.Origin, ["element"])>
<#return true>
</#if>
<#return false>
</#function>

<#function getSortedAcidity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["pH","acidity, alkalinity"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedDensity studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["relative density","tap density","bulk density","density, other"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#macro ResultList Allresults>
<#compress>
	<#if Allresults?has_content>

		<#list Allresults as blockItem>
			<para>
				<#if blockItem.Value?has_content>
					<@com.range blockItem.Value/>
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro ResultList2 Allresults>
<#compress>
	<#if Allresults?has_content>

		<#list Allresults as blockItem>
			<para>
				<#if blockItem.Density?has_content>
					<@com.range blockItem.Density/>
				</#if>
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#function isTypeOfSubstanceOther substance>
<#if !(substance?has_content)>
<#return false>
</#if>
<#if com.isPicklistEmptyOrOther(substance.TypeOfSubstance.Composition)>
		<#return true>
	</#if>
	<#return false>
</#function>

<#function referenceSubstanceHasContent refSubstance>
	<#if refSubstance.Inventory?? && refSubstance.Inventory.InventoryEntry?has_content>
		<#return true>
	</#if>
	<#if refSubstance.ReferenceSubstanceInfo?? && (
		refSubstance.ReferenceSubstanceInfo.CASInfo.CASNumber?has_content ||
		refSubstance.ReferenceSubstanceInfo.CASInfo.CASName?has_content ||
		refSubstance.ReferenceSubstanceInfo.IupacName?has_content ||
		refSubstance.ReferenceSubstanceInfo.Description?has_content ||
		refSubstance.ReferenceSubstanceInfo.Synonyms?has_content)>
		<#return true>
	</#if>
	<#if refSubstance.MolecularStructuralInfo?? && (
		refSubstance.MolecularStructuralInfo.MolecularFormula?has_content ||
		refSubstance.MolecularStructuralInfo.MolecularWeightRange?has_content)>
		<#return true>
	</#if>

	<#return false>
</#function>

<#macro synonymsList synonymsRepeatableBlock>
<#compress>
	<#if synonymsRepeatableBlock?has_content>
		<#list synonymsRepeatableBlock as blockItem>
			<para>
				<#if blockItem.Identifier?has_content><@com.picklist blockItem.Identifier/>: </#if>
				<@com.text blockItem.Name/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro dsdDpdIndexNumberList>
<#compress>
	<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "DsdDpd") />
	<#if recordList?has_content>
		<#list recordList as record>
			<#if record.GeneralInformation.IndexNumber?has_content>
				<para>
					<@com.text record.GeneralInformation.IndexNumber/>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro otherIdentifiersList otherNamesRepeatableBlock>
<#compress>
	<#if otherNamesRepeatableBlock?has_content>
		<#list otherNamesRepeatableBlock as blockItem>
			<para>
				<@com.picklist blockItem.NameType/> <@com.text blockItem.Name/> 
				<#if blockItem.Relation?has_content>
					(<@com.picklist blockItem.Relation/>)
				</#if>
				<@com.picklistMultiple blockItem.Country/> 
				<#if blockItem.Remarks?has_content>
					(<@com.text blockItem.Remarks/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro relatedCompositionNameList relatedCompositionRepeatableBlock>
<#compress>
	<#if relatedCompositionRepeatableBlock?has_content>
		<#list relatedCompositionRepeatableBlock as blockItem>
			<#local composition = iuclid.getDocumentForKey(blockItem) />
			<@com.text composition.GeneralInformation.Name/>
			<#if blockItem_has_next>; </#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro referenceSubstanceData referenceSubstanceKey>
<#compress>
	<#local refSubst = iuclid.getDocumentForKey(referenceSubstanceKey) />
	<#if refSubst?has_content>
		<@com.text refSubst.GeneralInfo.ReferenceSubstanceName/>
		EC no.: <@com.inventoryECNumber refSubst.Inventory.InventoryEntry/>
  	</#if>
</#compress>
</#macro>

<#macro surfaceTreatmentList surfaceTreatmentBlock>
<#compress>
	<#if surfaceTreatmentBlock?has_content>
		<informaltable border="1">
			<col width="30%" />
			<col width="20%" />
			<col width="25%" />
			<col width="25%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Surface treatment</emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Layer</emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Agent</emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
				</tr>
				<#list surfaceTreatmentBlock as blockItem>
					<tr>
						<td>
							<@com.text blockItem.SurfaceTreatmentName/>
						</td>
						<td>
							<@com.picklist blockItem.ExternalLayer/>
						</td>
						<td>
							<#list blockItem.SurfaceTreatment as item>
								<#if item.SurfaceTreatmentAgent?has_content>
									<@referenceSubstanceData item.SurfaceTreatmentAgent/>
									<#if item_has_next>; </#if>
								</#if>
							</#list>
						</td>
						<td>
							<@com.text blockItem.Remarks/>
						</td>
					</tr>
				</#list>
			</tbody>
		</informaltable>
  	</#if>
</#compress>
</#macro>

<#function isValueForCSARelevant summary propertyData>
	<#if propertyData["listValuePath"]?has_content>
		<#local valuePath = "summary." + propertyData["listValuePath"] />
		<#local value = valuePath?eval />
	</#if>
	<#if propertyData["valuePath"]?has_content>
		<#local valuePath = "summary." + propertyData["valuePath"] />
		<#local value = valuePath?eval />
	</#if>
	<#if value?has_content>
		<#return true>
	</#if>
	<#return false>
</#function>

<#macro valueForCSA summary propertyData>
<#compress>
	<#-- listValuePath -->
	<#if propertyData["listValuePath"]?has_content>
		<#local valuePath = "summary." + propertyData["listValuePath"] />
		<@com.picklist valuePath?eval />
	</#if>
	
	<#-- preText -->
	${propertyData["preText"]!}
	
	<#-- valuePath -->
	<#if propertyData["valuePath"]?has_content>
		<#local valuePath = "summary." + propertyData["valuePath"] />
		<#local value = valuePath?eval />
		<#if value?is_number>
			<@com.number value />
		<#else/>
			<@com.quantity value />
		</#if>
	</#if>
	
	<#-- listValueTextPath -->
	<#if propertyData["listValueTextPath"]?has_content>
		<#local valuePath = "summary." + propertyData["listValueTextPath"] />
		<@com.picklist valuePath?eval />
	</#if>

	<#-- atValuePath -->
	<#if propertyData["atValuePath"]?has_content>
		<#local valuePath = "summary." + propertyData["atValuePath"] />
		<#local value = valuePath?eval />
		at <@com.quantity value />
	</#if>
	
	<#-- postText -->
	${propertyData["postText"]!}
	
	<#-- preText2 -->
	<#if propertyData["preText2"]?has_content>
		<?linebreak?>
		${propertyData["preText2"]!}
	</#if>
	
	<#-- valuePath2 -->
	<#if propertyData["valuePath2"]?has_content>
		<#local valuePath = "summary." + propertyData["valuePath2"] />
		<#local value = valuePath?eval />
		<#if value?is_number>
			<@com.number value />
		<#else/>
			<@com.quantity value />
		</#if>
	</#if>
	
	<#-- postText2 -->
	${propertyData["postText2"]!}
</#compress>
</#macro>


<#function getDataWaivingList studyList>
	<#local dataWaivingStudyList = [] />
	<#if studyList?has_content>
		<#list studyList as study>
			<#if isDataWaivingStudy(study)>
				<#local dataWaivingStudyList = dataWaivingStudyList + [study] />
			</#if>
		</#list>
	</#if>
	<#return dataWaivingStudyList />
</#function>


<#function getTestingProposalList studyList>
	<#local testingProposalStudyList = [] />
	<#if studyList?has_content>
		<#list studyList as study>
			<#if isTestingProposalStudy(study)>
				<#local testingProposalStudyList = testingProposalStudyList + [study] />
			</#if>
		</#list>
	</#if>
	<#return testingProposalStudyList />
</#function>


<#macro assessmentEntityCompositionList assessmentEntity>
<#compress>
	<#if assessmentEntity.Compositions?has_content>
		<#list assessmentEntity.Compositions as item>
			<#if compositionOfAEIsReferenceSubstance(assessmentEntity)>
				<@referenceSubstanceData item/>
			<#else/>
				<#local compositionRecord = iuclid.getDocumentForKey(item) />
				<#if compositionRecord?has_content>
					<@com.text compositionRecord.GeneralInformation.Name/>
				</#if>
			</#if>
			<#if item_has_next>; </#if>
		</#list>
	</#if>
</#compress>
</#macro>

<#function compositionOfAEIsReferenceSubstance assessmentEntity>
	<#local aeSubType = assessmentEntity.documentSubType />
	<#if aeSubType?matches("GroupOfConstituentInTheRegisteredSubstance") || aeSubType?matches("TransformationProductOfTheRegisteredSubstance")>
		<#return true />
	</#if>
	<#return false />
</#function>

<#function getAssessmentEntitiesRelatedToComposition compositionRecord>
	<#local aeList = [] />
	<#list csr.assessmentEntities as ae>
		<#if compositionOfAEIsReferenceSubstance(ae)>
			<#local compositionList = ae.RelatedComposition />
			<#if compositionList?has_content>
				<#list compositionList as compKey>
					<#if compositionRecord.documentKey == compKey>
						<#local aeList = aeList + [ae] />
					</#if>
				</#list>
			</#if>
		<#else/>
			<#local compositionList = ae.Compositions />
			<#if compositionList?has_content>
				<#list compositionList as compKey>
					<#if compositionRecord.documentKey == compKey>
						<#local aeList = aeList + [ae] />
					</#if>
				</#list>
			</#if>
		</#if>
	</#list>
		
	<#return aeList />
</#function>

<#macro inventoryECName inventoryBlock>
	<#compress>
		<#if inventoryBlock?has_content>
			<#list inventoryBlock as item>
				<#if item.inventoryCode == 'EC'>
					<@iuclid.inventory entry=item var="inventoryEntry" />
					<#if inventoryEntry??>
						<@com.text inventoryEntry.name/>
					</#if>
					<#break>
				</#if>
			</#list>
		</#if>
	</#compress>
</#macro>
