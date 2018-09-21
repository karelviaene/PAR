<!-- 6. HUMAN HEALTH HAZARD ASSESSMENT OF PHYSICOCHEMICAL PROPERTIES template file -->

<!-- 6.1. Explosivity -->
<section>

	<#assign classificationGhsList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "Ghs") />

	<title role="HEAD-2">Explosivity</title>
	
	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Explosiveness") />
	
	<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
	<!-- Study results -->
	<#if !resultStudyList?has_content>
	No relevant information available.
	<#else/>
		The available information on explosivity is summarised in the following table:
				
		<@com.emptyLine/>
		<table border="1">
			<title>Information on explosivity</title>
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
					<tr>
						<!-- Method -->
						<td>
							<para>
								<@com.picklist study.AdministrativeData.Endpoint/>
							</para>
							
							<para>
								<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
							</para>
									
							<para>
								<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
							</para>
						</td>
						<!-- Results -->
						<td>
							<para>
								Evaluation of results: <@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/>
							</para>
							
							<para>
								Study results:
							</para>

							<para>Small-scale preliminary tests:</para>
							<@smallScalePrelimTestsList csr.orderByKeyResult(study.ResultsAndDiscussion.SmallScalePreliminaryTests)/>
								
							<para>
							<@resultsOfTestSeriesExplosivesList csr.orderByKeyResult(study.ResultsAndDiscussion.ResultsOfTestSeriesForExplosives)/>
							</para>
								
							<#if study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation?has_content>
								<para>
									Remarks: <@com.richText study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation/>
								</para>
							</#if>
							
							<para>
								<@com.richText study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation/>
							</para>
						</td>
						<!-- Remarks -->
						<td>
							<@csr.studyRemarksColumn study/>
						</td>
					</tr>
					<@csr.tableRowForJustificationForTypeOfInformation study/>		
				</#list>
			</tbody>
		</table>
		<@com.emptyLine/>
	</#if>
	
	<!-- Data waiving -->
	<#if dataWaivingStudyList?has_content>
		<para>
			Data waiving: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
					
	<!-- Testing proposal -->
	<#if testingProposalStudyList?has_content>
		<para>
			Testing proposal: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
	
	<!-- Discussion -->
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Explosiveness") />
				
	
	<#if summaryList?has_content>
		<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Discussion</emphasis></para>
		<#assign printSummaryName = summaryList?size gt 1 />
		<#list summaryList as summary>
			
			<#if summary.KeyInformation.KeyInformation?has_content>
				<para><@com.emptyLine/><emphasis role="underline">The following information is taken into account for any hazard / risk assessment:</emphasis></para>
			</#if>
			
			<#assign valueForCsaText>
				<#if summary.ResultsAndDiscussion.Explosiveness?has_content>
				Explosiveness: <@com.picklist summary.ResultsAndDiscussion.Explosiveness/>
				</#if>
			</#assign>		
			<@csr.endpointSummary summary valueForCsaText printSummaryName/>
		</#list>
	</#if>
	
	<!-- Classification according to GHS -->
	<#assign ghsRecord = getGhsHasExplosiveness(classificationGhsList)/>					
	<#if ghsRecord?has_content>
	<para><emphasis role="HEAD-WoutNo">Classification according to GHS</emphasis></para>
		<#list ghsRecord as record>
			<para>
				<emphasis role="bold">Name:</emphasis> <@com.text record.GeneralInformation.Name/>
			</para>
			<para role="indent">
				Related composition: <@relatedCompositionList record.GeneralInformation.RelatedCompositions.Composition/>
			</para>
			<para role="indent">
				Classification: <@hazardClassification record.Classification.PhysicalHazards.Explosives/>
			</para>			
		</#list>
	</#if>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Explosiveness") />
	
	<#if summaryList?has_content>
		<#list summaryList as summary>
			<#if summary.Justification.Remarks?has_content>
				<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Justification for classification or non-classification: </emphasis></para>
				<@com.richText summary.Justification.Remarks/>
			</#if>
		</#list>
	</#if>
	
</section>

<!-- 6.2. Flammability -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Flammability</title>
	
	<para><emphasis role="HEAD-WoutNo">Flammability</emphasis></para>
	
	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Flammability") />
	
	<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
	<!-- Study results -->
	<#if !resultStudyList?has_content>
	No relevant information available.
	<#else/>
		The available information on flammability is summarised in the following table:
				
		<@com.emptyLine/>
		<table border="1">
			<title>Information on flammability</title>
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
					<tr>
						<!-- Method -->
						<td>
							<para>
								<@com.picklist study.AdministrativeData.Endpoint/>
							</para>
						
							<para>
								<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
							</para>
									
							<para>
								<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
							</para>
						</td>
						<!-- Results -->
						<td>
							<#if study.ApplicantSummaryAndConclusion.InterpretationOfResults?has_content>
								<para>
									Evaluation of results: <@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/>
								</para>
							</#if>
							
							<para>
								Study results:
							</para>
								
							<para>Flammable gasses (lower and upper explosion limits):</para>
							<@flammableGasesList csr.orderByKeyResult(study.ResultsAndDiscussion.FlammableGasesLowerAndUpperExplosionLimit)/>
								
							<para>Aerosols:</para>
							<@aerosolsList csr.orderByKeyResult(study.ResultsAndDiscussion.Aerosols)/>
							
							<para>Flammable solids:</para>
							<@flammableSolidsList csr.orderByKeyResult(study.ResultsAndDiscussion.FlammableSolids)/>
							
							<para>Pyrophoric solids:</para>
							<@pyrophoricSolidsList csr.orderByKeyResult(study.ResultsAndDiscussion.PyrophoricSolids)/>
							
							<para>Pyrophoric liquid:</para>
							<@pyrophoricLiquidList csr.orderByKeyResult(study.ResultsAndDiscussion.PyrophoricLiquids)/>
							
							<para>Self-heating substances/mixtures:</para>
							<@selfHeatingSubstancesMixturesList csr.orderByKeyResult(study.ResultsAndDiscussion.SelfHeatingSubstancesMixtures)/>
							
							<para>Substances/ mixture which in contact with water emit flammable gases:</para>
							<@substancesMixturesWithWaterEmitFlammableGasesList csr.orderByKeyResult(study.ResultsAndDiscussion.SubstancesMixturesWhichInContactWithWaterEmitFlammableGases)/>
							
							<#if study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation?has_content>
								<para>
									Remarks: <@com.richText study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation/>
								</para>
							</#if>
						</td>
						<!-- Remarks -->
						<td>
							<@csr.studyRemarksColumn study/>
						</td>
					</tr>
					<@csr.tableRowForJustificationForTypeOfInformation study/>		
				</#list>
			</tbody>
		</table>
	</#if>
		
	
	<!-- Data waiving -->
	<#if dataWaivingStudyList?has_content>
		<para>
			Data waiving: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
					
	<!-- Testing proposal -->
	<#if testingProposalStudyList?has_content>
		<para>
			Testing proposal: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
				
	<!-- Discussion -->
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Flammability") />
				
	
	<#if summaryList?has_content>
		<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Discussion</emphasis></para>		
		<#list summaryList as summary>
			
			<#if summary.KeyInformation.KeyInformation?has_content>
				<para><@com.emptyLine/><emphasis role="underline">The following information is taken into account for any hazard / risk assessment:</emphasis></para>
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<para><emphasis role="bold"><@com.text summary.name/></emphasis></para>
				
				<emphasis role="bold">Key value for chemical safety assessment:</emphasis>
					
				Flammability: <@com.picklist summary.KeyValueChemicalAssessment.Flammability/>
			
				<#if summary.KeyInformation.KeyInformation?has_content>
					<para><@com.richText summary.KeyInformation.KeyInformation/></para>
				</#if>
								
				<#if summary.Discussion.Discussion?has_content>
					<para><emphasis role="bold">Additional information:</emphasis> <@com.richText summary.Discussion.Discussion/></para>
				</#if>					
		</#list>
	</#if>		
	
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Flash Point</emphasis></para>
	
	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "FlashPoint") />
	
	<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
	
	<!-- Study results -->
	<#if !resultStudyList?has_content>
		No relevant information available.
	<#else/>
		The available information on flash point is summarised in the following table:
				
		<@com.emptyLine/>
		<table border="1">
			<title>Information on flash point</title>
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
					<tr>
						<!-- Method -->
						<td>
							<para>
								Determination of flash point 
							</para>
							
							<para>
								<@com.picklist study.MaterialsAndMethods.MethodType/>
							</para>
						
							<para>
								<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
							</para>
									
							<para>
								<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
							</para>
						</td>
						<!-- Results -->
						<td>
							<#if study.ResultsAndDiscussion.FlashPoint?has_content>
								<para>Flash point:</para>
									<@flashPointList csr.orderByKeyResult(study.ResultsAndDiscussion.FlashPoint)/>
							</#if>
							
							<#if study.ResultsAndDiscussion.SustainingCombustibility?has_content>
								<para>Sustaining combustibility:</para>
									<@sustainingCombustabilityList csr.orderByKeyResult(study.ResultsAndDiscussion.SustainingCombustibility)/>
							</#if>
							
							<#if study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation?has_content>
								<para>
									Remarks: <@com.richText study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation/>
								</para>
							</#if>
						</td>
						<!-- Remarks -->
						<td>
							<@csr.studyRemarksColumn study/>
						</td>
					</tr>
					<@csr.tableRowForJustificationForTypeOfInformation study/>		
				</#list>
			</tbody>
		</table>
	</#if>
	
	
	<!-- Data waiving -->
	<#if dataWaivingStudyList?has_content>
		<para>
			Data waiving: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
					
	<!-- Testing proposal -->
	<#if testingProposalStudyList?has_content>
		<para>
			Testing proposal: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
	
	<!-- Discussion -->
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "FlashPoint") />
				
	
	<#if summaryList?has_content>
		<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Discussion</emphasis></para>
		<#assign printSummaryName = summaryList?size gt 1 />
		<#list summaryList as summary>
		
			<#if summary.KeyInformation.KeyInformation?has_content>
			<para><@com.emptyLine/><emphasis role="underline">The following information is taken into account for any hazard / risk assessment:</emphasis></para>
			</#if>
			
			<@csr.endpointSummary summary "" printSummaryName/>
		</#list>
	</#if>	

	<!-- Classification according to GHS -->
	<#assign ghsRecord = getGhsHasFlammability(classificationGhsList)/>					
	<#if ghsRecord?has_content>
	<para><emphasis role="HEAD-WoutNo">Classification according to GHS</emphasis></para>
		<#list ghsRecord as record>
			<para>
				<emphasis role="bold">Name:</emphasis> <@com.text record.GeneralInformation.Name/>
			</para>
			<para role="indent">
				Related composition: <@relatedCompositionList record.GeneralInformation.RelatedCompositions.Composition/>
			</para>
			<para role="indent">
				Classification (gas): <@hazardClassification record.Classification.PhysicalHazards.FlammableGases/>
				<?linebreak?>
				Classification (liquid): <@hazardClassification record.Classification.PhysicalHazards.FlammableLiquids/>
				<?linebreak?>
				Classification (solid): <@hazardClassification record.Classification.PhysicalHazards.FlammableSolids/>
			</para>
		</#list>
	</#if>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Flammability") />
	
	<#if summaryList?has_content>
		<#list summaryList as summary>
			<#if summary.Justification.Remarks?has_content>
				<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Justification for classification or non-classification: </emphasis></para>
				<@com.richText summary.Justification.Remarks/>
			</#if>
		</#list>
	</#if>

	
</section>

<!-- 6.3. Oxidising potential -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Oxidising potential</title>

	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "OxidisingProperties") />
	
	<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
	<!-- Study results -->
	<#if !resultStudyList?has_content>
	No relevant information available.
	<#else/>
		The available information on the oxidising potential is summarised in the following table:
				
		<@com.emptyLine/>
		<table border="1">
			<title>Information on oxidising potential</title>
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
					<tr>
						<!-- Method -->
						<td>
							<para>
								<@com.picklist study.AdministrativeData.Endpoint/>
							</para>
						
							<#if study.MaterialsAndMethods.StudyDesign.ContactWith?has_content || study.MaterialsAndMethods.StudyDesign.DurationOfTest?has_content>
								<para>
									<#if study.MaterialsAndMethods.StudyDesign.ContactWith?has_content>
										Contact with: <@com.picklist study.MaterialsAndMethods.StudyDesign.ContactWith/>
									</#if>
									
									<#if study.MaterialsAndMethods.StudyDesign.DurationOfTest?has_content>
										(<@com.range study.MaterialsAndMethods.StudyDesign.DurationOfTest/>)
									</#if>
								</para>
							</#if>
							
							<para>
								<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
							</para>					
							
							<para>
								<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
							</para>
						</td>
						<!-- Results -->
						<td>
							<#if study.ApplicantSummaryAndConclusion.InterpretationOfResults?has_content>
								<para>
									Evaluation of results: <@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/>
								</para>
							</#if>
						
							<para>Test results:</para>
							
							<#if study.ResultsAndDiscussion.TestResultOxidisingGases?has_content>
								<para>Oxidising gases:</para>
								<@oxidisingGasesList csr.orderByKeyResult(study.ResultsAndDiscussion.TestResultOxidisingGases)/>
							</#if>
							
							<#if study.ResultsAndDiscussion.TestResultsOxidisingLiquids?has_content>
								<para>Oxidising liquids:</para>
								<@oxidisingLiquidsList csr.orderByKeyResult(study.ResultsAndDiscussion.TestResultsOxidisingLiquids)/>
							</#if>
							
							<#if study.ResultsAndDiscussion.TestResultsOxidisingSolids?has_content>
								<para>Oxidising solids: </para>
								<@oxidisingSolidsList csr.orderByKeyResult(study.ResultsAndDiscussion.TestResultsOxidisingSolids)/>
							</#if>
							
							<#if study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation?has_content>
								<para>
									Remarks: <@com.richText study.ResultsAndDiscussion.AnyOtherInformationOnResultsInclTables.OtherInformation/>
								</para>
							</#if>
						</td>
						<!-- Remarks -->
						<td>
							<@csr.studyRemarksColumn study/>
						</td>
					</tr>
					<@csr.tableRowForJustificationForTypeOfInformation study/>			
				</#list>
			</tbody>
		</table>
		<@com.emptyLine/>
	</#if>
	
	<!-- Data waiving -->
	<#if dataWaivingStudyList?has_content>
		<para>
			Data waiving: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
					
	<!-- Testing proposal -->
	<#if testingProposalStudyList?has_content>
		<para>
			Testing proposal: see CSR section 1.3 Physicochemical properties.
		</para>
	</#if>
	
	<!-- Discussion -->
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "OxidisingProperties") />
				
	
	<#if summaryList?has_content>
		<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Discussion</emphasis></para>
		<#assign printSummaryName = summaryList?size gt 1 />
		<#list summaryList as summary>
		
			<#if summary.KeyInformation.KeyInformation?has_content>
			<para><@com.emptyLine/><emphasis role="underline">The following information is taken into account for any hazard / risk assessment:</emphasis></para>
			</#if>
			
			<#assign valueForCsaText>
				<#if summary.KeyValueChemicalAssessment.Oxidising?has_content>			
				Oxidising properties: <@com.picklist summary.KeyValueChemicalAssessment.Oxidising/>
				</#if>
			</#assign>		
			
			<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			
		</#list>
	</#if>
	
	<!-- Classification according to GHS -->
<#assign ghsRecord = getGhsHasOxidation(classificationGhsList)/>					
	<#if ghsRecord?has_content>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Classification according to GHS</emphasis></para>
	<#list ghsRecord as record>
			<para>
				<emphasis role="bold">Name:</emphasis> <@com.text record.GeneralInformation.Name/>
			</para>
			<para role="indent">
				Related composition: <@relatedCompositionList record.GeneralInformation.RelatedCompositions.Composition/>
			</para>
			<para role="indent">
				Classification (gas): <@hazardClassification record.Classification.PhysicalHazards.OxidisingGases/>
				<?linebreak?>
				Classification (liquid): <@hazardClassification record.Classification.PhysicalHazards.OxidisingLiquids/>
				<?linebreak?>
				Classification (solid): <@hazardClassification record.Classification.PhysicalHazards.OxidisingSolids/>
			</para>
		</#list>
	</#if>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "OxidisingProperties") />

	<#if summaryList?has_content>
		<#list summaryList as summary>
			<#if summary.Justification.Remarks?has_content>
				<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Justification for classification or non-classification:</emphasis></para>
				<@com.richText summary.Justification.Remarks/>
			</#if>
		</#list>
	</#if>
	
	
</section>

<!-- Macros and functions -->
<#macro smallScalePrelimTestsList preliminaryRepeatableBlock>
<#compress>
	<#if preliminaryRepeatableBlock?has_content>
		<#list preliminaryRepeatableBlock as blockItem>
			<#if blockItem.Parameter?has_content || blockItem.Value?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Parameter?has_content>
						<@com.picklist blockItem.Parameter/>: 
					</#if>
					
					<#if blockItem.Value?has_content>
						<@com.number blockItem.Value/>
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

<#macro resultsOfTestSeriesExplosivesList testSeriesRepeatableBlock>
<#compress>
	<#if testSeriesRepeatableBlock?has_content>
		<#list testSeriesRepeatableBlock as blockItem>
			<#if blockItem.Parameter?has_content || blockItem.Value?has_content || blockItem.TestSeries?has_content || blockItem.Method?has_content || blockItem.Results?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Parameter?has_content>
						Test series for explosives: <@com.picklist blockItem.Parameter/> 
					</#if>
					
					<#if blockItem.Value?has_content>
						<@com.number blockItem.Value/>
						<?linebreak?>
					</#if>
					
					<#if blockItem.TestSeries?has_content>
						(<@com.picklist blockItem.TestSeries/> 
					</#if>
					
					<#if blockItem.Method?has_content>
						<@com.picklist blockItem.Method/>)
						<?linebreak?>
					</#if>
					
					<#if blockItem.Results?has_content>
						<@com.picklist blockItem.Results/> 
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

<#macro flammableGasesList flammableRepeatableBlock>
<#compress>
	<#if flammableRepeatableBlock?has_content>
		<#list flammableRepeatableBlock as blockItem>
			<#if blockItem.Parameter?has_content || blockItem.Value?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Parameter?has_content>
						<@com.picklist blockItem.Parameter/> 
					</#if>
					
					<#if blockItem.Value?has_content>
						<@com.range blockItem.Value/>
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

<#macro aerosolsList aerosolsRepeatableBlock>
<#compress>
	<#if aerosolsRepeatableBlock?has_content>
		<#list aerosolsRepeatableBlock as blockItem>
			<#if blockItem.TypeOfAerosolTested?has_content || blockItem.ContentOfFlammableComponents?has_content || blockItem.TestParameter?has_content || blockItem.Value?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.TypeOfAerosolTested?has_content> 
						<@com.picklist blockItem.TypeOfAerosolTested/>
						content of flammable components %
					</#if>
					
					<#if blockItem.ContentOfFlammableComponents?has_content>
						<@com.range blockItem.ContentOfFlammableComponents/> 
					</#if>
					
					<#if blockItem.TestParameter?has_content>
						<@com.picklist blockItem.TestParameter/>,
					</#if>
					
					<#if blockItem.Value?has_content>
						<@com.range blockItem.Value/>
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

<#macro flammableSolidsList flammableRepeatableBlock>
<#compress>
	<#if flammableRepeatableBlock?has_content>
		<#list flammableRepeatableBlock as blockItem>
			<#if blockItem.TestProcedure?has_content || blockItem.BurningTime?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.TestProcedure?has_content>
						<@com.picklist blockItem.TestProcedure/>
					</#if>
					
					<#if blockItem.BurningTime?has_content>
						burning time: <@com.range blockItem.BurningTime/>
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

<#macro pyrophoricSolidsList pyrophoricSolidsRepeatableBlock>
<#compress>
	<#if pyrophoricSolidsRepeatableBlock?has_content>
		<#list pyrophoricSolidsRepeatableBlock as blockItem>
			<#if blockItem.TestProcedure?has_content || blockItem.Results?has_content || blockItem.Temp?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.TestProcedure?has_content>
						<@com.picklist blockItem.TestProcedure/> 
					</#if>
					
					<#if blockItem.Results?has_content>
						<@com.range blockItem.Results/> 
					</#if>
					
					<#if blockItem.Temp?has_content>
						at <@com.quantity blockItem.Temp/>
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

<#macro pyrophoricLiquidList pyrophoricLiquidRepeatableBlock>
<#compress>
	<#if pyrophoricLiquidRepeatableBlock?has_content>
		<#list pyrophoricLiquidRepeatableBlock as blockItem>
			<#if blockItem.TestProcedure?has_content || blockItem.Results?has_content || blockItem.Temp?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.TestProcedure?has_content>
						<@com.picklist blockItem.TestProcedure/> 
					</#if>
					
					<#if blockItem.Results?has_content>				
						<@com.range blockItem.Results/> 
					</#if>
					
					<#if blockItem.Temp?has_content>
						at <@com.quantity blockItem.Temp/>
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

<#macro selfHeatingSubstancesMixturesList selfHeatingRepeatableBlock>
<#compress>
	<#if selfHeatingRepeatableBlock?has_content>
		<#list selfHeatingRepeatableBlock as blockItem>
			<#if blockItem.Results?has_content || blockItem.TestProcedure?has_content || blockItem.MaxTempReached?has_content || blockItem.InductionTimeH?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Results?has_content>
						<@com.picklist blockItem.Results/> 
					</#if>
						
					<#if blockItem.TestProcedure?has_content>
						on <@com.picklist blockItem.TestProcedure/>:
					</#if>
					
					<#if blockItem.MaxTempReached?has_content>
						<@com.number blockItem.MaxTempReached/> (max temp. reached),
					</#if>
					
					<#if blockItem.InductionTimeH?has_content>
						<@com.number blockItem.InductionTimeH/> h (induction time)
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

<#macro substancesMixturesWithWaterEmitFlammableGasesList contactFlammableRepeatableBlock>
<#compress>
	<#if contactFlammableRepeatableBlock?has_content>
		<#list contactFlammableRepeatableBlock as blockItem>
			<#if blockItem.TestProcedure?has_content || blockItem.MaxRateOfGasRelease?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.TestProcedure?has_content>
						<@com.picklistMultiple blockItem.TestProcedure/>:
					</#if>
					
					<#if blockItem.MaxRateOfGasRelease?has_content>
						<@com.quantity blockItem.MaxRateOfGasRelease/> (max. rate of gas release)
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

<#macro flashPointList flashPointRepeatableBlock>
<#compress>
	<#if flashPointRepeatableBlock?has_content>
		<#list flashPointRepeatableBlock as blockItem>
			<#if blockItem.FPoint?has_content || blockItem.AtmPressure?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.FPoint?has_content>
						<@com.range blockItem.FPoint/>
					</#if>
					
					<#if blockItem.AtmPressure?has_content>
						at <@com.range blockItem.AtmPressure/>
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

<#macro sustainingCombustabilityList combustabilityRepeatableBlock>
<#compress>
	<#if combustabilityRepeatableBlock?has_content>
		<#list combustabilityRepeatableBlock as blockItem>
			<#if blockItem.Results?has_content || blockItem.TestProcedure?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Results?has_content>
						<@com.picklist blockItem.Results/>
					</#if>
					
					<#if blockItem.TestProcedure?has_content>
						(<@com.picklist blockItem.TestProcedure/>)
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

<#macro oxidisingGasesList oxidisingGasesRepeatableBlock>
<#compress>
	<#if oxidisingGasesRepeatableBlock?has_content>
		<#list oxidisingGasesRepeatableBlock as blockItem>
			<#if blockItem.Results?has_content || blockItem.Parameter?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.Results?has_content> 
						<@com.range blockItem.Results/>
					</#if>
					
					<#if blockItem.Parameter?has_content> 	
						(<@com.picklist blockItem.Parameter/>)
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

<#macro oxidisingLiquidsList oxidisingLiquidRepeatableBlock>
<#compress>
	<#if oxidisingLiquidRepeatableBlock?has_content>
		<#list oxidisingLiquidRepeatableBlock as blockItem>
			<#if blockItem.SampleTested?has_content || blockItem.Parameter?has_content || blockItem.Results?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.SampleTested?has_content>
						<@com.picklist blockItem.SampleTested/>:
					</#if>
					
					<#if blockItem.Parameter?has_content>
						<@com.picklist blockItem.Parameter/>:
					</#if>
					
					<#if blockItem.Results?has_content>
						<@com.range blockItem.Results/>
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

<#macro oxidisingSolidsList oxidisingSolidsRepeatableBlock>
<#compress>
	<#if oxidisingSolidsRepeatableBlock?has_content>
		<#list oxidisingSolidsRepeatableBlock as blockItem>
			<#if blockItem.SampleTested?has_content || blockItem.Parameter?has_content || blockItem.Results?has_content || blockItem.RemarksOnResults?has_content>
				<para role="indent">
					<#if blockItem.SampleTested?has_content>
						<@com.picklist blockItem.SampleTested/>:
					</#if>
					
					<#if blockItem.Parameter?has_content>
						<@com.picklist blockItem.Parameter/>:
					</#if>
					
					<#if blockItem.Results?has_content>
						<@com.range blockItem.Results/>
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

<#macro hazardStatementList HazardStatementRepeatableBlock>
<#compress>
	<#if HazardStatementRepeatableBlock?has_content>
		<#list HazardStatementRepeatableBlock as blockItem>
			<#if blockItem.HazardStatement?has_content>
				<para>
					<#if blockItem.HazardStatement?has_content>
						(Hazard Statement: <@com.picklist blockItem.HazardStatement/>)
					</#if>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro relatedCompositionList relatedCompositionsValue>
<#compress>
	<#if relatedCompositionsValue?has_content>
		<#list relatedCompositionsValue as item>
			<#local composition = iuclid.getDocumentForKey(item) />
			<#if composition?has_content>
				<@com.text composition.GeneralInformation.Name/>
				<#if composition.GeneralInformation.StateForm?has_content>
					(<@com.picklist composition.GeneralInformation.StateForm/>)
				</#if>
				<#if item_has_next>; </#if>
			</#if>
		</#list>
	</#if>
</#compress>
</#macro>

<#macro hazardClassification hazardClassificationBlock>
<#compress>
	<@com.picklist hazardClassificationBlock.HazardCategory/>
	<#if hazardClassificationBlock.HazardStatement?has_content>
		(Hazard statement: <@com.picklist hazardClassificationBlock.HazardStatement/>)
	</#if>
	<@com.picklist hazardClassificationBlock.ReasonForNoClassification/>
</#compress>
</#macro>

<#function getGhsHasExplosiveness classificationGhsList>
	<#local ghs = []/>
	
	<#if !(classificationGhsList?has_content)>
		<#return [] />
	</#if>
	<#list classificationGhsList as classificationGhsList>
		<#if isGhsExplosive(classificationGhsList)>
			<#local ghs = ghs + [classificationGhsList]/>			
		</#if>	
	</#list>
	
	<#return ghs />	
</#function>

<#function isGhsExplosive classificationGhsList>
	<#return classificationGhsList.Classification.PhysicalHazards.Explosives.HazardCategory?has_content />
</#function>

<#function getGhsHasFlammability classificationGhsList>
	<#local ghs = []/>
	
	<#if !(classificationGhsList?has_content)>
		<#return [] />
	</#if>
	<#list classificationGhsList as classificationGhsList>
		<#if isGhsFlammable(classificationGhsList)>
			<#local ghs = ghs + [classificationGhsList]/>			
		</#if>	
	</#list>
	
	<#return ghs />	
</#function>

<#function isGhsFlammable classificationGhsList>
	<#return classificationGhsList.Classification.PhysicalHazards.FlammableGases.HazardCategory?has_content || classificationGhsList.Classification.PhysicalHazards.FlammableLiquids.HazardCategory?has_content || classificationGhsList.Classification.PhysicalHazards.FlammableSolids.HazardCategory?has_content/>
</#function>

<#function getGhsHasOxidation classificationGhsList>
	<#local ghs = []/>
	
	<#if !(classificationGhsList?has_content)>
		<#return [] />
	</#if>
	<#list classificationGhsList as classificationGhsList>
		<#if isGhsOxidising(classificationGhsList)>
			<#local ghs = ghs + [classificationGhsList]/>			
		</#if>	
	</#list>
	
	<#return ghs />	
</#function>

<#function isGhsOxidising classificationGhsList>
	<#return classificationGhsList.Classification.PhysicalHazards.OxidisingGases.HazardCategory?has_content || classificationGhsList.Classification.PhysicalHazards.OxidisingLiquids.HazardCategory?has_content || classificationGhsList.Classification.PhysicalHazards.OxidisingSolids.HazardCategory?has_content/>
</#function>
