<!-- 5.3. Eye irritation -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Eye irritation</title>

	<!-- 5.3.1. Non-human information -->
	<section>
		<title role="HEAD-4">Non-human information</title>
	    <#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EyeIrritation") />
		
		<!-- In Vivo -->
	    <#assign studyList1 = getSortedEyeIrritationInVivo(studyList) />
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList1/>

		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
			<#else/>
				The results of in vivo studies on eye irritation are summarised in the following table:

			<@com.emptyLine/>
			<table border="1">
				<title>Summary table of animal studies on eye irritation</title>
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="25%" />
				<col width="15%" />
				<col width="15%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method, Guideline, GLP, Reliability</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Species, Strain, Sex, No/groups</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test substance, Vehicle, Dose levels, Duration of exposure</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Reference</emphasis></th>
					</tr>

						<#list resultStudyList as study>

						<#--TODO Could be possible improved with incorporating the condition in the previous call, i.e. populateResultAndDataWaivingAndTestingProposalStudyLists. It prints empty tables if none of the studies are Irrotation -->
							<tr>
								<!-- Method, Guideline, GLP, Reliability -->
								<td>
									<para>
										<@com.picklist study.AdministrativeData.Endpoint />
									</para>

									<para>
										GLP? <@com.picklist study.MaterialsAndMethods.GLPComplianceStatement/>
									</para>

									<para>
										Reliability: <@com.picklist study.AdministrativeData.Reliability/>
									</para>

									<para>
										Guideline: <@csr.guidelineList study.MaterialsAndMethods.Guideline/>
									</para>

									<para>
										<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
									</para>

									<para>
										Study type: <@com.picklist study.AdministrativeData.PurposeFlag/>
									</para>
								</td>
								
								<!-- Species, Strain, Sex, No/groups -->
								<td>
									<para>
										Species: <@com.picklist study.MaterialsAndMethods.TestAnimals.Species/> 
										<#if study.MaterialsAndMethods.TestAnimals.Strain?has_content>
											(Strain: <@com.picklist study.MaterialsAndMethods.TestAnimals.Strain/>)
										</#if>
									</para>

									<para>
										Number of animals: <@com.text study.MaterialsAndMethods.TestSystem.NumberOfAnimals/> 
									</para>
								</td>

								<!-- Test substance, Vehicle, Dose levels, Duration of exposure -->
								<td>
									<para>
										<@csr.studyTestMaterial study/>
									</para>

									<para>
									Vehicle: <@com.picklist study.MaterialsAndMethods.TestSystem.Vehicle/> 
									</para>

									<para>
									Dose: <@com.text study.MaterialsAndMethods.TestSystem.AmountConcentrationApplied/> 
									</para>

									<para>
									Exposure duration: <@com.text study.MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure/> 
									</para>
								</td>

								<!-- Results -->
								<td>
									<para>
										<@inVivoList study.ResultsAndDiscussion.InVivo.IrritationCorrosionResults/>
									</para>

									<para>
										<@com.text study.ResultsAndDiscussion.InVivo.IrritationCorrosionResponseData/>
									</para>

									<para>
										<@com.text study.ResultsAndDiscussion.InVivo.OtherEffects/>
									</para>
								</td>

								<!-- Remarks -->
								<td>
									<para>
										<@com.richText study.OverallRemarksAttachments.RemarksOnResults/>
									</para>
								</td>

								<!-- Reference -->
								<td>
									<para>
										<@csr.studyReference study/>
									</para>
								</td>
							</tr>
							
							<@csr.tableRowForJustificationForTypeOfInformation study/>
						</#list>
				</tbody>
			</table>
		</#if>
	
		<!-- In Vitro -->
		<#assign studyList2 = getSortedEyeIrritationInVitro(studyList) />
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList2/>

		<!-- Study results -->
		<#if !resultStudyList?has_content>
			<@com.emptyLine/>
			No relevant information available.
			<#else/>
				The results of in vitro studies on eye irritation are summarised in the following table:

			<@com.emptyLine/>
			<table border="1">
				<title>Summary table of in vitro studies on eye irritation</title>
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="25%" />
				<col width="15%" />
				<col width="15%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method, Guideline, GLP, Reliability</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test substance, Doses</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Relevant information about the study</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Reference</emphasis></th>
					</tr>

						<#list resultStudyList as study>

						<#--TODO Could be possible improved with incorporating the condition in the previous call, i.e. populateResultAndDataWaivingAndTestingProposalStudyLists. It prints empty tables if none of the studies are Irrotation -->
							<tr>
								<!-- Method, Guideline, GLP, Reliability -->
								<td>
									<para>
										<@com.picklist study.AdministrativeData.Endpoint />
									</para>

									<para>
										GLP? <@com.picklist study.MaterialsAndMethods.GLPComplianceStatement/>
									</para>

									<para>
										Reliability: <@com.picklist study.AdministrativeData.Reliability/>
									</para>

									<para>
										Guideline: <@csr.guidelineList study.MaterialsAndMethods.Guideline/>
									</para>

									<para>
										<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
									</para>
									
									<para>
										Study type: <@com.picklist study.AdministrativeData.PurposeFlag/>
									</para>
								</td>
								
								<!-- Test substance, Doses -->
								<td>
									<para>
										<@csr.studyTestMaterial study/>
									</para>

									<para>
									Doses: <@com.text study.MaterialsAndMethods.TestSystem.AmountConcentrationApplied/> 
									</para>

									<para>
									Vehicle: <@com.picklist study.MaterialsAndMethods.TestSystem.Vehicle/> 
									</para>

								</td>

								<!-- Relevant information about the study -->
								<td>
									<para>
									<#if study.MaterialsAndMethods.TestAnimals.Species?has_content>
										Species: <@com.picklist study.MaterialsAndMethods.TestAnimals.Species/>
									</#if>
									</para>

									<para>
									<#if study.MaterialsAndMethods.TestAnimals.Strain?has_content>
										Strain: <@com.picklist study.MaterialsAndMethods.TestAnimals.Strain/>
									</#if>
									</para>

									<para>
									<#if study.MaterialsAndMethods.TestAnimals.OrganismDetails?has_content>
										Details: <@com.text study.MaterialsAndMethods.TestAnimals.OrganismDetails/>
									</#if>
									</para>

									<para>
									<#if study.MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure?has_content>
										Exposure duration: <@com.text study.MaterialsAndMethods.TestSystem.DurationOfTreatmentExposure/>
									</#if>
									</para>

									<para>
									<#if study.MaterialsAndMethods.TestSystem.DurationOfPostTreatmentIncubationInVitro?has_content>
										Post-treatment: <@com.text study.MaterialsAndMethods.TestSystem.DurationOfPostTreatmentIncubationInVitro/>
									</#if>
									</para>

									<para>
									<#if study.MaterialsAndMethods.TestSystem.NumberOfAnimals?has_content>
										Replicates: <@com.text study.MaterialsAndMethods.TestSystem.NumberOfAnimals/>
									</#if>
									</para>

								</td>

								<!-- Results -->
								<td>
									<para>
										<@EyeIrritationInVitroList study.ResultsAndDiscussion.InVitro.ResultsOfExVivoInVitroStudy/>
									</para>

									<para>
										<@com.richText study.ResultsAndDiscussion.InVitro.OtherEffectsAcceptanceOfResults/>
									</para>
								</td>

								<!-- Remarks -->
								<td>
									<para>
										<@com.richText study.OverallRemarksAttachments.RemarksOnResults/>
									</para>
								</td>

								<!-- Reference -->
								<td>
									<para>
										<@csr.studyReference study/>
									</para>
								</td>
							</tr>
							
							<@csr.tableRowForJustificationForTypeOfInformation study/>
						</#list>
				</tbody>
			</table>
		</#if>


	</section>

</section>


<!-- Macros and functions -->
<#-- TODO It seems that all getSorted... functions could be incorporated in one -->

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

<#function getSortedEyeIrritationInVivo studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["eye irritation: in vivo"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedEyeIrritationInVitro studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["eye irritation: in vitro / ex vivo","eye irritation, other"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinIrritationCorrosionInVivo studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
		<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["skin irritation: in vivo"]) && PurposeFlag?has_content >
			<#local returnList = returnList + [study] />
		</#if>
	</#list>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedSkinIrritationCorrosionInVitro studyList>
	<#if !(studyList?has_content)>
		<#return []>
	</#if>
	<#local returnList = [] />
	<#list studyList as study>
		<#local endpoint = study.AdministrativeData.Endpoint />
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
		<#if com.picklistValueMatchesPhrases(endpoint, ["skin irritation: in vitro / ex vivo","skin corrosion: in vitro / ex vivo","skin irritation / corrosion, other"]) && PurposeFlag?has_content >
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

<#macro EyeIrritationInVitroList EyeIrritationInVitroRepeatableBlock>
<#compress>
	<#if EyeIrritationInVitroRepeatableBlock?has_content>
		<#list EyeIrritationInVitroRepeatableBlock as blockItem>
			<#if blockItem.RunExperiment?has_content || blockItem.Value?has_content>
				<para>
				<@com.picklist blockItem.IrritationParameter/>:
				</para>
				<para role="indent">
					<para>
						<#if blockItem.RunExperiment?has_content>
							<@com.text blockItem.RunExperiment/>;
						</#if>
						
						<#if blockItem.Value?has_content>
							value <@com.range blockItem.Value/>.
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