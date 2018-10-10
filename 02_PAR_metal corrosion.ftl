<!-- 4.16 CORROSIVE TO METALS -->

<section>
	<title role="HEAD-2">Corrosive to metals</title>

	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "CorrosiveToMetals") />
	
	<#assign studyList1 = getSortedMetalCorrosion(studyList) />
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList1/>

			<!-- Study results -->
			<#if !resultStudyList?has_content>
				No relevant information available.
				<#else/>
					The results of metal corrosivity tests are summarised in the following table:

				<@com.emptyLine/>
				<table border="1">
					<title>Summary table of metal corrosivity studies</title>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<tbody>
						<tr>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method, Guideline, GLP, Reliability</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Purity of test substance (%w/w)</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Conclusion</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Reference</emphasis></th>
						</tr>
						
						<#list resultStudyList as study>

							<tr>
							
								<!-- Method, Guideline, GLP, Reliability -->
								<td>
									<para>
										<emphasis role="bold">GLP?</emphasis>  <@com.picklist study.MaterialsAndMethods.GLPComplianceStatement/>
									</para>

									<para>
										<emphasis role="bold">Reliability</emphasis>:  <@com.picklist study.AdministrativeData.Reliability/>
									</para>

									<para>
										<#if study.MaterialsAndMethods.Guideline?has_content>
											<emphasis role="bold">Guideline</emphasis>:  <@csr.guidelineList study.MaterialsAndMethods.Guideline/>
										<#else>
											<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
										</#if>
									</para>

									<para>
										<emphasis role="bold">Study type</emphasis>: <@com.picklist study.AdministrativeData.PurposeFlag/>
									</para>
								</td>
									
								<!-- Purity of the substance -->
								<td>
									<#if study.MaterialsAndMethods.TestMaterials.TestMaterialInformation?has_content>
										<@csr.studyTestMaterial study/>
									<#else>
										<emphasis role="bold">Test Substance</emphasis>:  <@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/> 
									</#if>
									<#if study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudyConfidential?has_content>
										<emphasis role="bold">Purity</emphasis>:  <@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudyConfidential/> 
									</#if>
								</td>

								<!-- Results -->
								<td>
									<para>
										<@ResultsList study.ResultsAndDiscussion.TestResults/>										
									</para>
								</td>

								<!-- Conclusion -->
								<td>
									<para>
										<emphasis role="bold">GHS</emphasis>: <@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/> 									
									</para>
									<para>
										<emphasis role="bold">Conclusion</emphasis>: <@com.richText study.ApplicantSummaryAndConclusion.Conclusions/> 									
									</para>
								</td>

								<!-- Reference -->
								<td>
									<para>
										<@csr.studyReference study/>
									</para>
								</td>

							</tr>

						</#list>

					</tbody>
				</table>


			</#if>

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

<#macro ResultsList ResultRepeatableBlock>
<#compress>
	<#if ResultRepeatableBlock?has_content>
		<#local sortedList = iuclid.sortByField(ResultRepeatableBlock, "Type of material", ["aluminium","carbon steel","other:"]) />

		<#local currentHeader><@com.picklist sortedList[0].TypeOfMaterial/></#local>
		<para><emphasis role="bold">Type of material</emphasis>: ${currentHeader}</para>
		
		<#list sortedList as blockItem>
			<#local parameter><@com.picklist blockItem.TypeOfMaterial/></#local>
			<#if !(currentHeader == parameter)>
				<#local currentHeader = parameter/>
				<@com.emptyLine/>
				<para>${currentHeader}</para>
			</#if>
			<para role="indent">
				<para>
					<#if blockItem.CorrosionRateMmYear?has_content>
						Corrosion rate (mm/y): <@com.number blockItem.CorrosionRateMmYear/>
					</#if>
				</para>
				<para>
					<#if blockItem.UniformCorrosionExposureTimeDays?has_content>
						Uniform corrosion: exposure time (d): <@com.number blockItem.UniformCorrosionExposureTimeDays/>
					</#if>
				</para>				
				<para>
					<#if blockItem.UniformCorrosionMassLoss?has_content>
						Uniform corrosion: mass loss (%): <@com.number blockItem.UniformCorrosionMassLoss/>
					</#if>
				</para>
				<para>
					<#if blockItem.LocalisedCorrosionExposureTimeDays?has_content>
						Localised corrosion: exposure time (d)): <@com.number blockItem.LocalisedCorrosionExposureTimeDays/>
					</#if>
				</para>
				<para>
					<#if blockItem.LocalisedCorrosionIntrusionDepthM?has_content>
						Localised corrosion: intrusion depth (µm)): <@com.number blockItem.LocalisedCorrosionIntrusionDepthM/>
					</#if>
				</para>
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

<#function getSortedMetalCorrosion studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["corrosive to metals"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

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
