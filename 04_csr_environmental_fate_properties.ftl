<!-- 4. ENVIRONMENTAL FATE PROPERTIES template file -->

<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "EnvironmentalFateAndPathways") />

<#if summaryList?has_content>
	<para><emphasis role="underline"><emphasis role="bold">General discussion of environmental fate and pathways:</emphasis></emphasis></para>
	<#assign printSummaryName = summaryList?size gt 1 />
	<#list summaryList as summary>
		<@csr.endpointSummary summary "" printSummaryName/>
		<@com.emptyLine/>
	</#list>
</#if>

<!-- 4.1. Degradation -->
<section>
	<title role="HEAD-2">Degradation</title>
	
	<!-- 4.1.1. Abiotic degradation -->
	<section>
		<title role="HEAD-3">Abiotic degradation</title>
		
		
		<!-- 4.1.1.1. Hydrolysis -->
		<section>
			<title role="HEAD-4">Hydrolysis</title>
			
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Hydrolysis") />
		
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
				No relevant information available.
			<#else/>
				The studies on hydrolysis are summarised in the following table:
				
				<@com.emptyLine/>
				<table border="1">
					<title>Studies on hydrolysis</title>
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
										<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
									</para>
									<para>
										<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
									</para>
									<para>
										<@com.text study.MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed/>
									</para>
								</td>
								<!-- Results -->
								<td>
									<para>Half-life (DT50):</para>
									<@hydrolysisHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.DissipationHalfLifeOfParentCompound)/>									
									
									<para>Recovery (in %):</para>
									<@recoveryList study.ResultsAndDiscussion.TotalRecoveryOfTestSubstance/>
									
									<para>
										Transformation products: <@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
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
			</#if>
			
			<!-- Data waiving -->
			<@csr.dataWaiving dataWaivingStudyList "Hydrolysis"/>
				
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Hydrolysis"/>
			
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Hydrolysis") />
						
			<#if summaryList?has_content>
				<#list summaryList as summary>
				
					<#assign summarytext = getCSAValueTextHydrolysis(summary)/>					
					<#if summarytext?has_content>
						<@CSAValueText summary typeText typeText1 />
					</#if>
					
					<#assign summaryCSAValue = getCSAValuesHydrolysis(summary)/>
					<#if summaryCSAValue?has_content>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeForHydrolysis?has_content>
								Half-life for hydrolysis: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeForHydrolysis /> 
							</#if>
							
							<#if summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content>
								at <@com.quantity summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf />
							</#if>
						</#assign>
					</#if>
					
					<#assign printSummaryName = summaryList?size gt 1 />
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>	
				</#list>
			</#if>
		</section>
		
		
		<!-- 4.1.1.2. Phototransformation/photolysis -->
		<@com.emptyLine/>
		<section>
			<title role="HEAD-4">Phototransformation/photolysis</title>
			
			<!-- 4.1.1.2.1. Phototransformation in air -->
			<section>
				<title role="HEAD-5">Phototransformation in air</title>
				
				<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "PhototransformationInAir") />
		
				<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
				<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
				
				<!-- Study results -->
				<#if !resultStudyList?has_content>
					No relevant information available.
				<#else/>
					The studies on phototransformation in air are summarised in the following table:
					
					<@com.emptyLine/>
					<table border="1">
						<title>Studies on phototransformation in air</title>
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
											<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.StudyDesign.EstimationMethodIfUsed/>
										</para>
										<para>
											Light source: <@com.picklist study.MaterialsAndMethods.StudyDesign.LightSource/>
										</para>
										<para>
											Light spectrum: <@com.range study.MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm/>
										</para>
										<para>
											Rel. light intensity: <@com.range study.MaterialsAndMethods.StudyDesign.RelativeLightIntensity/>
										</para>
									</td>
									<!-- Results -->
									<td>
										<para>Spectrum of substance:</para>
										<@spectrumOfSubstanceList study.ResultsAndDiscussion.SpectrumOfSubstance/>
										
										<para>Half-life (DT50):</para>
										<@phototransformationHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.DissipationParentCompound)/>								
										
										<para>% Degradation:</para>
										<@degradationList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
										
										<para>Degradation rate constant:</para>
										<@degradationRateConstantList csr.orderByKeyResult(study.ResultsAndDiscussion.DegradationRateConstant)/>
										
										<para>Quantum yield: <@com.number study.ResultsAndDiscussion.QuantumYield/></para>
										
										<para>Transformation products:</para>
										<@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
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
				<@csr.dataWaiving dataWaivingStudyList "Phototransformation in air"/>
					
				<!-- Testing proposal -->
				<@csr.testingProposal testingProposalStudyList "Phototransformation in air"/>
				
				<!-- Discussion -->
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "PhototransformationInAir") />
				
				<#if summaryList?has_content>
				
					<#assign summaryCSAValue = getCSAValuesPhototransformationInAir(summaryList)/>
					<#if summaryCSAValue?has_content>
						<@CSAValueText summaryCSAValue typeText typeText1 />
					</#if>
					<#assign printSummaryName = summaryList?size gt 1 />
					<#list summaryList as summary>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInAir?has_content>
								Half-life in air: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInAir/>
							<?linebreak?>
							</#if>
							<#if summary.KeyValueForChemicalSafetyAssessment.DegradationRateConstantWithOHRadicals?has_content>
								Degradation rate constant with OH radicals: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.DegradationRateConstantWithOHRadicals/>
							</#if>
						</#assign>
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
					</#list>
				</#if>
				
			</section>
			
			<!-- 4.1.1.2.2. Phototransformation in water -->
			<@com.emptyLine/>
			<section>
				<title role="HEAD-5">Phototransformation in water</title>
				
				<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "Phototransformation") />
		
				<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
				<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
				
				<!-- Study results -->
				<#if !resultStudyList?has_content>
					No relevant information available.
				<#else/>
					The studies on phototransformation in water are summarised in the following table:
					
					<table border="1">
						<title>Studies on phototransformation in water</title>
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
											Study type: <@com.picklist study.MaterialsAndMethods.StudyType/>
										</para>
										<para>
											<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.StudyDesign.ComputationalMethods/>
										</para>
										<para>
											Light source: <@com.picklist study.MaterialsAndMethods.StudyDesign.LightSource/>
										</para>
										<para>
											Light spectrum: <@com.range study.MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm/>
										</para>
										<para>
											Rel. light intensity: <@com.range study.MaterialsAndMethods.StudyDesign.RelativeLightIntensity/>
										</para>
										<para>Sensitiser:</para>
										<@sensitiserList study.MaterialsAndMethods.StudyDesign.SensitiserForIndirectPhotolysis/>
									</td>
									<!-- Results -->
									<td>
										<para>Spectrum of substance:</para>
										<@spectrumOfSubstanceList study.ResultsAndDiscussion.SpectrumOfSubstance/>
										
										<para>Half-life (DT50):</para>
										<@phototransformationHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.DissipationParentCompound)/>								
										
										<para>% Degradation:</para>
										<@degradationList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
										
										<para>Quantum yield: <@com.number study.ResultsAndDiscussion.QuantumYield/></para>
										
										<para>Rate constant: <@com.range study.ResultsAndDiscussion.RateConstant/></para>
										
										<para>Transformation products:</para>
										<@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
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
				<@csr.dataWaiving dataWaivingStudyList "Phototransformation in water"/>
					
				<!-- Testing proposal -->
				<@csr.testingProposal testingProposalStudyList "Phototransformation in water"/>
				
				<!-- Discussion -->
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "PhototransformationInWater") />
				
				
				<#if summaryList?has_content>
					<#assign summaryCSAValue = getCSAValuesPhototransformationInWater(summaryList)/>
					<#if summaryCSAValue?has_content>
						<@CSAValueText summaryCSAValue typeText typeText1 />
					</#if>
					<#assign printSummaryName = summaryList?size gt 1 />
					<#list summaryList as summary>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater?has_content>
							Half-life in water: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater/>	
							</#if>
						</#assign>
					
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
					</#list>
				</#if>
				
			</section>
			
			<!-- 4.1.1.2.3. Phototransformation in soil -->
			<@com.emptyLine/>
			<section>
				<title role="HEAD-5">Phototransformation in soil</title>
				
				<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "PhotoTransformationInSoil") />
		
				<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
				<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
				
				<!-- Study results -->
				<#if !resultStudyList?has_content>
					No relevant information available.
				<#else/>
					The studies on phototransformation in soil are summarised in the following table:
					
					<table border="1">
						<title>Studies on phototransformation in soil</title>
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
											<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
										</para>
										<para>
											<@com.text study.MaterialsAndMethods.StudyDesign.ComputationalMethods/>
										</para>
										<para>
											Light source: <@com.picklist study.MaterialsAndMethods.StudyDesign.LightSource/>
										</para>
										<para>
											Light spectrum: <@com.range study.MaterialsAndMethods.StudyDesign.LightSpectrumWavelengthInNm/>
										</para>
										<para>
											Rel. light intensity: <@com.range study.MaterialsAndMethods.StudyDesign.RelativeLightIntensity/>
										</para>
										<para>
											Details on soil: <@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnSoil/>
										</para>
									</td>
									<!-- Results -->
									<td>
										<para>Spectrum of substance:</para>
										<@spectrumOfSubstanceList study.ResultsAndDiscussion.Spectrum/>
										
										<para>Half-life (DT50):</para>
										<@phototransformationHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.DissipationHalfLife)/>								
										
										<para>% Degradation:</para>
										<@degradationList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
										
										<para>Quantum yield: <@com.number study.ResultsAndDiscussion.QuantumYield/></para>
										
										<para>Transformation products:</para>
										<@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
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
				<@csr.dataWaiving dataWaivingStudyList "Phototransformation in soil"/>
					
				<!-- Testing proposal -->
				<@csr.testingProposal testingProposalStudyList "Phototransformation in soil"/>
				
				<!-- Discussion -->
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "PhototransformationInSoil") />
								
				<#if summaryList?has_content>
					<#assign summaryCSAValue = getCSAValuesInSoil(summaryList)/>
					<#if summaryCSAValue?has_content>
						<@CSAValueText summaryCSAValue typeText typeText1 />
					</#if>
					<#assign printSummaryName = summaryList?size gt 1 />
					<#list summaryList as summary>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInSoil?has_content>
							Half-life in soil: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInSoil/>
							</#if>
						</#assign>
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
					</#list>
				</#if>
				
			</section>
		</section>
	</section>
	
	<!-- 4.1.2. Biodegradation -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Biodegradation</title>
		
		<!-- 4.1.2.1. Biodegradation in water -->
		<section>
			<title role="HEAD-4">Biodegradation in water</title>
			
			<!-- 4.1.2.1.1. Screening tests -->
			<section>
				<title role="HEAD-5">Screening tests</title>
				
				<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BiodegradationInWaterScreeningTests") />
		
				<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
				<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
				
				<!-- Study results -->
				<#if !resultStudyList?has_content>
					No relevant information available.
				<#else/>
					The studies on biodegradation in water (screening tests) are summarised in the following table:
					
					<@com.emptyLine/>
					<table border="1">
						<title>Screening tests for biodegradation in water</title>
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
											<@com.picklist study.AdministrativeData.Endpoint/>:
										</para>
										<para>
											<@com.picklist study.MaterialsAndMethods.StudyDesign.InoculumOrTestSystem/>
											
											<#if study.MaterialsAndMethods.StudyDesign.OxygenConditions?has_content>
												(<@com.picklist study.MaterialsAndMethods.StudyDesign.OxygenConditions/>)
											</#if>
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
											<@com.picklist study.ApplicantSummaryAndConclusion.InterpretationOfResults/>
										</para>
										<para>% Degradation of test substance:</para>
										<@degradationOfTestSubstanceList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
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
				<@csr.dataWaiving dataWaivingStudyList "Biodegradation in water: screening test"/>
					
				<!-- Testing proposal -->
				<@csr.testingProposal testingProposalStudyList "Biodegradation in water: screening test"/>
				
			</section>
			
			<!-- 4.1.2.1.2. Simulation tests (water and sediments) -->
			<@com.emptyLine/>
			<section>
				<title role="HEAD-5">Simulation tests (water and sediments)</title>
				
				<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BiodegradationInWaterAndSedimentSimulationTests") />
		
				<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
				<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
				
				<!-- Study results -->
				<#if !resultStudyList?has_content>
					No relevant information available.
				<#else/>
					The studies on biodegradation in water (screening tests) are summarised in the following table:
					
					<@com.emptyLine/>
					<table border="1">
						<title>Simulation tests for biodegradation in water and sediment</title>
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
											<@com.picklist study.AdministrativeData.Endpoint/>:
										</para>
										<para>
											Test system: <@com.picklist study.MaterialsAndMethods.StudyDesign.InoculumOrTestSystem/>
											<#if study.MaterialsAndMethods.StudyDesign.OxygenConditions?has_content>
												(<@com.picklist study.MaterialsAndMethods.StudyDesign.OxygenConditions/>)
											</#if>
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
										<para>Half-life (DT50):</para>
										<@biodegradationHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.HalfLifeOfParentCompound50DisappearanceTimeDT50)/>
										<para>% Degradation of test substance:</para>
										<@degradationOfTestSubstanceList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
										<para>
											Mineralization rate: <@com.quantity study.ResultsAndDiscussion.MineralizationRateInCO2/>
										</para>
										<para>
											Transformation products: <@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
										</para>
										<@transformationProductList study.ResultsAndDiscussion.IdentityTransformation/>
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
				<@csr.dataWaiving dataWaivingStudyList "Simulation testing for biodegradation in water and sediment"/>
					
				<!-- Testing proposal -->
				<@csr.testingProposal testingProposalStudyList "Simulation testing for biodegradation in water and sediment"/>
				
			</section>
			
			<!-- 4.1.2.1.3. Summary and discussion of biodegradation in water and sediment -->
			<@com.emptyLine/>
			<section>
				<title role="HEAD-5">Summary and discussion of biodegradation in water and sediment</title>
				
				<!-- Discussion -->
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "BiodegradationInWaterScreeningTests") />
								
				<#if !summaryList?has_content>
				No relevant information available.
					<#else/>
					
					<#assign summaryCSAValue = getCSAValuesBiodegradationInWaterScreeningTests(summaryList)/>
					<#if summaryCSAValue?has_content>
						<@CSAValueText_screening summaryCSAValue typeText typeText1 />
					</#if>
					<#assign printSummaryName = summaryList?size gt 1 />
					<#list summaryList as summary>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.BiodegradationInWater?has_content>
							Biodegradation in water: <@com.picklist summary.KeyValueForChemicalSafetyAssessment.BiodegradationInWater/>
							</#if>
							<para>
							<#if summary.KeyValueForChemicalSafetyAssessment.TypeOfWater?has_content>
								Type of water: <@com.picklist summary.KeyValueForChemicalSafetyAssessment.TypeOfWater />
							</#if>
							</para>
						</#assign>
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
					</#list>
				</#if>
				
				<!-- Discussion -->
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "BiodegradationInWaterAndSedimentSimulationTests") />
				
				<#if summaryList?has_content>
					<#assign summaryCSAValue = getCSAValuesBiodegradationInWaterAndSedimentSimulationTests(summaryList)/>
					<#if summaryCSAValue?has_content>
						<@CSAValueText_simulation summaryCSAValue typeText typeText1 />
					</#if>
					<#assign printSummaryName = summaryList?size gt 1 />
					<#list summaryList as summary>
						<#assign valueForCsaText>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater?has_content>
							Half-life in water: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater/> 
							<#if summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOfWater?has_content>
								at <@com.quantity summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOfWater/>
							</#if>
							</#if>
							<?linebreak?>
							<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInSediment?has_content>
							Half-life in sediment: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInSediment/> 
							<#if summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOfSediment?has_content>
								at <@com.quantity summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOfSediment/>
							</#if>
							</#if>
							<para>
							<#if summary.KeyValueForChemicalSafetyAssessment.TypeOfWater?has_content>
								Type of water: <@com.picklist summary.KeyValueForChemicalSafetyAssessment.TypeOfWater />
							</#if>
							</para>
						</#assign>
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
					</#list>
				</#if>
				
			
			</section>
		</section>
		
		<!-- 4.1.2.2. Biodegradation in soil -->
		<@com.emptyLine/>
		<section>
			<title role="HEAD-4">Biodegradation in soil</title>
			
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BiodegradationInSoil") />
		
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
				No relevant information available.
			<#else/>
				The test results are summarised in the following table:
				<@com.emptyLine/>
				
				<table border="1">
					<title>Simulation tests for biodegradation in soil</title>
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
										<#if study.AdministrativeData.Endpoint?has_content>
											<@com.picklist study.AdministrativeData.Endpoint/>:
										</#if>
									</para>
									<para>
										Test type: <@com.picklist study.MaterialsAndMethods.TestType/>
									</para>
									
									<para>Soil type:</para>
									<@soilTypeList study.MaterialsAndMethods.StudyDesign.SoilProperties/>
									
									<para>
										<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
									</para>
									<para>
										<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
									</para>
								</td>
								<!-- Results -->
								<td>
									<para>Half-life (DT50):</para>
									<@biodegradationInSoilHalfLifeList csr.orderByKeyResult(study.ResultsAndDiscussion.HalfLifeOfParentCompound)/>
									
									<para>% Degradation of test substance:</para>
									<@degradationOfTestSubstanceList csr.orderByKeyResult(study.ResultsAndDiscussion.Degradation)/>
									
									<para>Evaporation of parent compound: <@com.picklist study.ResultsAndDiscussion.EvaporationOfParentCompound/></para>
									
									<para>Volatile metabolites: <@com.picklist study.ResultsAndDiscussion.VolatileMetabolites/></para>
									
									<para>Residues: <@com.picklist study.ResultsAndDiscussion.Residues/></para>
									
									<para>
										Transformation products: <@com.picklist study.ResultsAndDiscussion.TransformationProducts/>
									</para>
									<@transformationProductList study.ResultsAndDiscussion.IdentityTransformation/>
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
			<@csr.dataWaiving dataWaivingStudyList "Soil simulation testing"/>
				
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Soil simulation testing"/>
			
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "BiodegradationInSoil") />
			
			
			<#if summaryList?has_content>
				<#assign summaryCSAValue = getCSAValuesInSoil(summaryList)/>
				<#if summaryCSAValue?has_content>
					<@CSAValueText summaryCSAValue typeText typeText1 />
				</#if>
				<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<#assign valueForCsaText>
						<#if summary.KeyValueForChemicalSafetyAssessment.HalflifeInSoil?has_content>
						Half-life in soil: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.HalflifeInSoil/> 
						</#if>
						<#if summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content>
							at <@com.quantity summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf/>
						</#if>
					</#assign>
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
			</#if>
			
		</section>
	</section>
	
	<!-- 4.1.3. Summary and discussion of degradation -->
	
	
<#assign summaryStabilityList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Stability")/>
<#assign summaryBiodegradationList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Biodegradation") />	

<#if summaryStabilityList?has_content || summaryBiodegradationList?has_content >

	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Summary and discussion of degradation</title>
		
		<#if summaryStabilityList?has_content>
		<#assign printStabilitySummaryName = summaryStabilityList?size gt 1 />
		<para><emphasis role="HEAD-WoutNo">Abiotic degradation</emphasis></para>
					
			<#list summaryStabilityList as summary>
				<@csr.endpointSummary summary "" printSummaryStabilityName/>
			</#list>
		</#if>				
		
		<#if summaryBiodegradationList?has_content>
		<#assign printBiodegradationSummaryName = summaryBiodegradationList?size gt 1 />
		<@com.emptyLine/>
		<para><emphasis role="HEAD-WoutNo">Biotic degradation</emphasis></para>
			<#list summaryBiodegradationList as summary>
				<@csr.endpointSummary summary "" printBiodegradationSummaryName/>
			</#list>
		</#if>
		
	</section>
</#if>
</section>

<!-- 4.2. Environmental distribution -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Environmental distribution</title>
	
	<!-- 4.2.1. Adsorption/desorption -->
	<section>
		<title role="HEAD-3">Adsorption/desorption</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "AdsorptionDesorption") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		
		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
		<#else/>
			The studies on adsorption/desorption are summarised in the following table:
			<@com.emptyLine/>
			
			<table border="1">
				<title>Studies on adsorption/desorption</title>
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
								<para>Adsorption coefficient:</para>
								<@adsorptionCoefficientList csr.orderByKeyResult(study.ResultsAndDiscussion.AdsorptionCoefficient)/>
								
								<para>Partition coefficients:</para>
								<@partitionCoefficientList csr.orderByKeyResult(study.ResultsAndDiscussion.AdsorptionOther)/>
								
								<para>Mass balance (in %) at end of adsorption phase:</para>
								<@massBalanceAdsorptiontList study.ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfAdsorptionPhase/>
								
								<para>Mass balance (in %) at end of desorption phase:</para>
								<@massBalanceDesorptiontList study.ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.MassBalanceAtEndOfDesorptionPhase/>
								
								<para>
									Transformation products: <@com.picklist study.ResultsAndDiscussion.ResultsBatchEquilibriumOrOtherMethod.TransformationProducts/>
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
		</#if>
		
		<!-- Data waiving -->
		<@csr.dataWaiving dataWaivingStudyList "Adsorption/desorption"/>
			
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Adsorption/desorption"/>
		
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "AdsorptionDesorption") />
		<#if summaryList?has_content>
			<#list summaryList as summary>
		
					<#assign summaryCSAValue = getCSAValuesAdsorptionDesorption(summary)/>
					
					<#if summaryCSAValue?has_content>
					<@CSAValueTextEnvironmentAssessment summaryCSAValue typeText typeText1 />
						
					<#assign valueForCsaText>					
					Koc at 20°C: <@com.number summary.KeyValueForChemicalSafetyAssessment.KocAt20Celsius/>
					<?linebreak?>
					<#if summary.KeyValueForChemicalSafetyAssessment.OtherAdsorptionCoefficients?has_content>
						Other adsorption coefficients: 
						<#list summary.KeyValueForChemicalSafetyAssessment.OtherAdsorptionCoefficients as blockItem>
							<para role="indent">
								<@com.picklist blockItem.Type/>
								<#if blockItem.TypeValue?has_content || blockItem.AtTheTemperatureOf?has_content>
									<#if blockItem.TypeValue?has_content>
										: <@com.number blockItem.TypeValue/>
									</#if>
									<#if blockItem.AtTheTemperatureOf?has_content>
										at <@com.quantity blockItem.AtTheTemperatureOf/>
									</#if>
								</#if>
							</para>									
							</#list>
						</#if>
					</#assign>					
					</#if>
					
					<#assign printSummaryName = summaryList?size gt 1 />
					
						<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>
	
	<!-- 4.2.2. Volatilisation -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Volatilisation</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "HenrysLawConstant") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		
		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
		<#else/>
			The studies on volatilisation are summarised in the following table:
			<@com.emptyLine/>
			
			<table border="1">
				<title>Studies on volatilisation</title>
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
									<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
								</para>
								<para>
									<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnMethods/>
								</para>
							</td>
							<!-- Results -->
							<td>
								<para>Henry's Law constant H:</para>
								<@henrysLawConstantList csr.orderByKeyResult(study.ResultsAndDiscussion.HenrysLawConstantH)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Volatilisation"/>
			
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Volatilisation"/>
		
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "HenrysLawConstant") />
				
		<#if summaryList?has_content>
			<#assign summaryCSAValue = getCSAValuesHenrysLawConstant(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextEnvironmentAssessment summaryCSAValue typeText typeText1 />
			</#if>
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<#assign valueForCsaText>
					<#if summary.KeyValueForChemicalSafetyAssessment.HenrysLawConstant?has_content>
						Henry's law constant (H): <@com.number summary.KeyValueForChemicalSafetyAssessment.HenrysLawConstant/> (in Pa m³/mol) 
					</#if>
					
					<#if summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content>
						at <@com.quantity summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf/>
					</#if>
				</#assign>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>
	
	<!-- 4.2.3. Distribution modelling -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Distribution modelling</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "DistributionModelling") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		
		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
		<#else/>
			The data from distribution modelling studies are summarised in the following table:
			<@com.emptyLine/>
			
			<table border="1">
				<title>Distribution modelling studies</title>
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
									Media: <@com.picklist study.MaterialsAndMethods.Media/>
								</para>
								
								<para><@com.picklist study.MaterialsAndMethods.Model/></para>
								
								<para>
									Calculation programme: <@com.text study.MaterialsAndMethods.CalculationProgramme/>
								</para>
								
								<para>
									Input data: <@com.text study.MaterialsAndMethods.StudyDesign.TestSubstanceInputData/>
								</para>
							</td>
							<!-- Results -->
							<td>
								<para>Percent distribution in media:</para>
								<para>Air (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.AirPercentage/></para>
								<para>Water (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.WaterPercentage/></para>
								<para>Soil (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.SoilPercentage/></para>
								<para>Sediment (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.SedimentPercentage/></para>
								<para>Susp. sediment (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.SuspSedimentPercentage/></para>
								<para>Biota (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.BiotaPercentage/></para>
								<para>Aerosol (%): <@com.number study.ResultsAndDiscussion.PercentDistributionInMedia.AerosolPercentage/></para>
								<para>Other distribution results: <@com.text study.ResultsAndDiscussion.PercentDistributionInMedia.OtherDistributionResults/></para>
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
		<@csr.dataWaiving dataWaivingStudyList "Distribution modelling"/>
			
		<!-- Testing proposal -->
		<#if testingProposalStudyList?has_content>
		<@com.emptyLine/>
		<para><emphasis role="HEAD-WoutNo">Testing proposal</emphasis></para>
		<#list testingProposalStudyList as study>
			<para><emphasis role="bold">Information requirement:</emphasis> Distribution modelling</para>
			<para role="indent">
				<emphasis role="bold">Model:</emphasis>
				<@com.picklist study.MaterialsAndMethods.Model/>
			</para>
			<para role="indent">
				 Media: <@com.picklist study.MaterialsAndMethods.Media/>
			</para>
			<para role="indent">
				<emphasis role="bold">Planned study period:</emphasis>
				<@com.text study.AdministrativeData.StudyPeriod/>
			</para>
			<para role="indent">
				<emphasis role="bold">Test material:</emphasis>
				<@csr.testMaterialInformation study.MaterialsAndMethods.TestMaterials.TestMaterialInformation/>
			</para>
		</#list>
	</#if>
		
	</section>
	
	<!-- 4.2.4. Summary and discussion of environmental distribution -->

<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "TransportAndDistribution") />
		
<#if summaryList?has_content>
<#assign printSummaryName = summaryList?size gt 1 />
	
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Summary and discussion of environmental distribution</title>
		
			<#list summaryList as summary>
				<@csr.endpointSummary summary "" printSummaryName/>
			</#list>
	</section>
</#if>
</section>

<!-- 4.3. Bioaccumulation -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Bioaccumulation</title>
	
	<!-- 4.3.1. Aquatic bioaccumulation -->
	<section>
		<title role="HEAD-3">Aquatic bioaccumulation</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BioaccumulationAquaticSediment") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		
		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
		<#else/>
			The studies on aquatic bioaccumulation are summarised in the following table:
			<@com.emptyLine/>
			
			<table border="1">
				<title>Studies on aquatic bioaccumulation</title>
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
									<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/>
								</para>
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.RouteOfExposure/>
								</para>
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
								</para>
								<para>
									Media type: <@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								<para>
									Total exposure / uptake duration: <@com.range study.MaterialsAndMethods.StudyDesign.TotalExposureUptakeDuration/>
								</para>
								<para>
									Total depuration duration: <@com.range study.MaterialsAndMethods.StudyDesign.TotalDepurationDuration/>
								</para>
								<para>
									Details on estimation of bioconcentration: <@com.text study.MaterialsAndMethods.TestConditions.DetailsOnEstimationOfBioconcentration/>
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
								<para>Bioaccumulation factor:</para>
								<@bioaccumulationFactorList csr.orderByKeyResult(study.ResultsAndDiscussion.BioaccumulationFactor)/>
								
								<para>Elimination:</para>
								<@depurationList csr.orderByKeyResult(study.ResultsAndDiscussion.Depuration)/>
								
								<para>Lipid content:</para>
								<@lipidContentList study.ResultsAndDiscussion.LipidContent/>
								
								<para>Transformation products: <@com.text study.ResultsAndDiscussion.Metabolites/></para>
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
		<@csr.dataWaiving dataWaivingStudyList "Aquatic bioaccumulation"/>
			
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Aquatic bioaccumulation"/>
		
	</section>
	
	<!-- 4.3.2. Terrestrial bioaccumulation -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Terrestrial bioaccumulation</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BioaccumulationTerrestrial") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		
		<!-- Study results -->
		<#if !resultStudyList?has_content>
			No relevant information available.
		<#else/>
			The results of terrestrial bioaccumulation studies are summarised in the following table:
			<@com.emptyLine/>
			
			<table border="1">
				<title>Studies on terrestrial bioaccumulation</title>
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
									<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/>
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
								<para>Bioaccumulation factor:</para>
								<@bioaccumulationFactorList csr.orderByKeyResult(study.ResultsAndDiscussion.BioaccumulationFactor)/>
								
								<para>Elimination:</para>
								<@depurationList csr.orderByKeyResult(study.ResultsAndDiscussion.Depuration)/>
								
								<para>Lipid content:</para>
								<@lipidContentList study.ResultsAndDiscussion.LipidContent/>
								
								<para>Transformation products: <@com.text study.ResultsAndDiscussion.Metabolites/></para>
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
		<@csr.dataWaiving dataWaivingStudyList "Terrestrial bioaccumulation"/>
			
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Terrestrial bioaccumulation"/>
		
	</section>
	
	<!-- 4.3.3. Summary and discussion of bioaccumulation -->

<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Bioaccumulation") />
<#if summaryList?has_content>
<#assign printSummaryName = summaryList?size gt 1 />
	
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Summary and discussion of bioaccumulation</title>
		
			<#list summaryList as summary>
				<@csr.endpointSummary summary "" printSummaryName/>
			</#list>
				
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "BioaccumulationAquaticSediment") />			
		
		<#if summaryList?has_content>
			<#assign summaryCSAValue = getCSAValuesBioaccumulationAquaticSediment(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextBioaccumulationAquatic summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
								
				<#if summary.KeyValueForChemicalSafetyAssessment.BcfAquaticSpecies?has_content || summary.KeyValueForChemicalSafetyAssessment.BMFInFish?has_content>
					<#assign valueForCsaText>
						<#if summary.KeyValueForChemicalSafetyAssessment.BcfAquaticSpecies?has_content>
							BCF: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.BcfAquaticSpecies/>
						</#if>
						<?linebreak?>
						<#if summary.KeyValueForChemicalSafetyAssessment.BMFInFish?has_content>
							BMF in fish: <@com.number summary.KeyValueForChemicalSafetyAssessment.BMFInFish/> dimensionless
						</#if>
					</#assign>
				</#if>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "BioaccumulationTerrestrial") />
		
		<para><emphasis role="HEAD-WoutNo"></emphasis></para>
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getCSAValuesBioaccumulationTerrestrial(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextBioaccumulationTerrestrial summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			
			<#list summaryList as summary>
				
				<#if summary.KeyValueForChemicalSafetyAssessment.BcfTerrestrialSpecies?has_content>
					<#assign valueForCsaText>
						<#if summary.KeyValueForChemicalSafetyAssessment.BcfTerrestrialSpecies?has_content>
							BCF: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.BcfTerrestrialSpecies/>
						</#if>
					</#assign>
				</#if>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>
</#if>	
</section>

<!-- 4.4. Secondary poisoning -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Secondary poisoning</title>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "EcotoxicologicalInformation") />
	
	<#if !summaryList?has_content>
		No relevant information available.
		<@com.emptyLine/>
	<#else/>
	
		<!--TODO: this probably will need to be improved in case there are AEs -->
		<#assign firsSummary = summaryList[0] />
		
		<#if isNoBioaccumulationPotential(firsSummary)>
			<para>Based on the available information, there is no indication of a bioaccumulation potential and, hence, secondary poisoning is not considered relevant (see CSR chapter 7.5 "PNEC derivation and other hazard conclusions)").</para>
		<#elseif isPnecOral(firsSummary)>
			<para>
				<#if firsSummary.HazardForPredators.SecondaryPoisoning.HazAssessConclVal?has_content>
					The hazard assessment conclusion for secondary poisoning (PNECoral) is <@com.quantity firsSummary.HazardForPredators.SecondaryPoisoning.HazAssessConclVal/> (see CSR chapter 7.5 "PNEC derivation and other hazard conclusions").
				</#if>
			</para>
			<para><emphasis role="bold">Interpretation of the available data with regard to the potential to bio-accumulate in the food chain:</emphasis></para>
			<para>&gt;&gt;&gt;NOTE (please delete this instruction): As appropriate enter relevant information manually.&lt;&lt;&lt;</para>
		<#else>
			<para>Based on the available information the bioaccumulation potential cannot be judged (see CSR chapter 7.5 "PNEC derivation and other hazard conclusions").</para>
		</#if>
	</#if>
	
</section>


<!-- Macros and functions -->
<#macro hydrolysisHalfLifeList halfLifeRepeatableBlock>
<#compress>
	<#if halfLifeRepeatableBlock?has_content>
		<#list halfLifeRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Ph?has_content>
					t1/2 (pH <@com.number blockItem.Ph/>):
				</#if>
				
				<#if blockItem.HalfLife?has_content>
					<@com.range blockItem.HalfLife/> 
				</#if>	
				
				<#if blockItem.Temp?has_content>
					at <@com.quantity blockItem.Temp/>;
				</#if>	
				
				<#if blockItem.HydrolysisRateConstant?has_content>
					Rate constant: <@com.range blockItem.HydrolysisRateConstant/>;
				</#if>	
				
				<#if blockItem.Type?has_content>					
					Type: <@com.picklist blockItem.Type/> 
				</#if>

				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro recoveryList recoveryRepeatableBlock>
<#compress>
	<#if recoveryRepeatableBlock?has_content>
		<#list recoveryRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Ph?has_content>
					pH <@com.number blockItem.Ph/>:
				</#if>
				
				<#if blockItem.Recovery?has_content>
					<@com.range blockItem.Recovery/> 
				</#if>
				
				<#if blockItem.Temp?has_content>
					at <@com.quantity blockItem.Temp/> 
				</#if>
				
				<#if blockItem.Duration?has_content>
					after <@com.range blockItem.Duration/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro spectrumOfSubstanceList spectrumRepeatableBlock>
<#compress>
	<#if spectrumRepeatableBlock?has_content>
		<#list spectrumRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Parameter?has_content>
					<@com.picklist blockItem.Parameter/>: 
				</#if>	
					
				<#if blockItem.Value?has_content>
					<@com.quantity blockItem.Value/>
				</#if>
					
				<#if blockItem.hasElement("RemarksOnResults")>
					(<@com.picklist blockItem.RemarksOnResults/>)
				<#else/>
					(<@com.text blockItem.Remarks/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro phototransformationHalfLifeList halfLifeRepeatableBlock>
<#compress>
	<#if halfLifeRepeatableBlock?has_content>
		<#list halfLifeRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.hasElement("HalfLife")>
					<@com.range blockItem.HalfLife/>
				<#else/>
					<@com.range blockItem.DT50/>
				</#if>
				<#if blockItem.TestCondition?has_content>
					(<@com.text blockItem.TestCondition/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro degradationList degradationRepeatableBlock>
<#compress>
	<#if degradationRepeatableBlock?has_content>
		<#list degradationRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.hasElement("DegradationPercent")>
					<@com.range blockItem.DegradationPercent/>
				<#else/>
					<@com.range blockItem.Degr/>
				</#if>
				after
				<#if blockItem.hasElement("TimePoint")>
					<@com.quantity blockItem.TimePoint/>
				<#else/>
					<@com.quantity blockItem.SamplingTime/>
				</#if>
				<#if blockItem.TestCondition?has_content>
					(<@com.text blockItem.TestCondition/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro sensitiserList sensitiserRepeatableBlock>
<#compress>
	<#if sensitiserRepeatableBlock?has_content>
		<#list sensitiserRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.TypeOfSensitiser/> 
				<#if blockItem.ConcentrationOfSensitiser?has_content>
					(<@com.range blockItem.ConcentrationOfSensitiser/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro degradationRateConstantList degradationRateRepeatableBlock>
<#compress>
	<#if degradationRateRepeatableBlock?has_content>
		<#list degradationRateRepeatableBlock as blockItem>
			<para role="indent">
				<@com.range blockItem.RateConstant/> 
				<#if blockItem.ReactionWith?has_content>
					for reaction with <@com.picklist blockItem.ReactionWith/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro degradationOfTestSubstanceList degradationRepeatableBlock>
<#compress>
	<#if degradationRepeatableBlock?has_content>
		<#list degradationRepeatableBlock as blockItem>
			<para role="indent">
			
				<@com.range blockItem.Degr/>
				
				<#if blockItem.SamplingTime?has_content>
					after
					<@com.quantity blockItem.SamplingTime/>
				</#if>
				
				<#if blockItem.Parameter?has_content>
					(<@com.picklist blockItem.Parameter/>)
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
				
				<#if blockItem.hasElement("SoilNo") && blockItem.SoilNo?has_content>
					(<@com.picklist blockItem.SoilNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro biodegradationHalfLifeList halfLifeRepeatableBlock>
<#compress>
	<#if halfLifeRepeatableBlock?has_content>
		<#list halfLifeRepeatableBlock as blockItem>
			<para role="indent">
			
				<@com.range blockItem.HalfLife/>
				
				<#if blockItem.Compartment?has_content>
					in
					<@com.picklist blockItem.Compartment/>
				</#if>
				
				<#if blockItem.Temp?has_content>
					at
					<@com.quantity blockItem.Temp/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro transformationProductList transformationProductBlock>
<#compress>
	<#if transformationProductBlock?has_content>
		<#list transformationProductBlock as blockItem>
			<#local referenceSubstance = iuclid.getDocumentForKey(blockItem.ReferenceSubstance) />
			<#if referenceSubstance?has_content>
				<para role="indent">
					<@com.picklist blockItem.No/> <@com.text referenceSubstance.GeneralInfo.ReferenceSubstanceName/>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro soilTypeList soilTypeBlock>
<#compress>
	<#if soilTypeBlock?has_content>
		<#list soilTypeBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.SoilType/> 
				<#if blockItem.SoilNo?has_content>
					(<@com.picklist blockItem.SoilNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro biodegradationInSoilHalfLifeList halfLifeRepeatableBlock>
<#compress>
	<#if halfLifeRepeatableBlock?has_content>
		<#list halfLifeRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.HalfLife?has_content>
					<@com.range blockItem.HalfLife/> 
				</#if>
				
				<#if blockItem.SoilNo?has_content>
					(<@com.picklist blockItem.SoilNo/>) 
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro adsorptionCoefficientList adsorptionCoefficientRepeatableBlock>
<#compress>
	<#if adsorptionCoefficientRepeatableBlock?has_content>
		<#list adsorptionCoefficientRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Type?has_content>
					<@com.picklist blockItem.Type/>: 
				</#if>
				
				<#if blockItem.Value?has_content>
					<@com.range blockItem.Value/>
				</#if>
				
				<#if blockItem.Temp?has_content>
					at <@com.quantity blockItem.Temp/>
				</#if>	
					
				<#if blockItem.PercentageOfOrganicCarbon?has_content>
					(Org. C (%): <@com.range blockItem.PercentageOfOrganicCarbon/>)
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro partitionCoefficientList partitionCoefficientRepeatableBlock>
<#compress>
	<#if partitionCoefficientRepeatableBlock?has_content>
		<#list partitionCoefficientRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Type?has_content>
					<@com.picklist blockItem.Type/>: 
				</#if>
					
				<#if blockItem.Value?has_content>
					<@com.range blockItem.Value/> 
				</#if>	
					
				<#if blockItem.Temp?has_content>
					at <@com.quantity blockItem.Temp/>
				</#if>
					
				<#if blockItem.RemarksOnResults?has_content>					
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro massBalanceAdsorptiontList massBalanceAdsorptiontRepeatableBlock>
<#compress>
	<#if massBalanceAdsorptiontRepeatableBlock?has_content>
		<#list massBalanceAdsorptiontRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.AdsorptionPercentage?has_content>
					<@com.range blockItem.AdsorptionPercentage/> 
				</#if>
				
				<#if blockItem.Duration?has_content>
					after <@com.quantity blockItem.Duration/>
				</#if>
				
				<#if blockItem.SampleNo?has_content>
					(<@com.picklist blockItem.SampleNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro massBalanceDesorptiontList massBalanceDesorptiontRepeatableBlock>
<#compress>
	<#if massBalanceDesorptiontRepeatableBlock?has_content>
		<#list massBalanceDesorptiontRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.DesorptionPercentage?has_content>
					<@com.range blockItem.DesorptionPercentage/> 
				</#if>
				
				<#if blockItem.Duration?has_content>
					after <@com.quantity blockItem.Duration/>
				</#if>
				
				<#if blockItem.SampleNo?has_content>
					(<@com.picklist blockItem.SampleNo/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro henrysLawConstantList henrysLawConstantRepeatableBlock>
<#compress>
	<#if henrysLawConstantRepeatableBlock?has_content>
		<#list henrysLawConstantRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.H?has_content>
					<@com.range blockItem.H/>
				</#if>
				
				<#if blockItem.Temp?has_content>
					at <@com.quantity blockItem.Temp/>
				</#if>
				
				<#if blockItem.AtmPressure?has_content>
					and <@com.quantity blockItem.AtmPressure/>
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro bioaccumulationFactorList bioaccumulationFactorRepeatableBlock>
<#compress>
	<#if bioaccumulationFactorRepeatableBlock?has_content>
		<#list bioaccumulationFactorRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Type?has_content>
					<@com.picklist blockItem.Type/>: 
				</#if>
				
				<#if blockItem.Value?has_content>
					<@com.range blockItem.Value/>
				</#if>
				
				<#if blockItem.Basis?has_content>
					(<@com.picklist blockItem.Basis/>)
				</#if>
				
				<#if blockItem.TimeOfPlateau?has_content>
					Time of plateau: <@com.quantity blockItem.TimeOfPlateau/>
				</#if>
				
				<#if blockItem.CalculationBasis?has_content>
					(<@com.picklist blockItem.CalculationBasis/>) 
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro depurationList depurationRepeatableBlock>
<#compress>
	<#if depurationRepeatableBlock?has_content>
		<#list depurationRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.Elimination?has_content>
					<@com.picklist blockItem.Elimination/>; 
				</#if>
				
				<#if blockItem.Endpoint?has_content>
					<@com.picklist blockItem.Endpoint/>: 
				</#if>
				
				<#if blockItem.DepurationTime?has_content>
					<@com.quantity blockItem.DepurationTime/>
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro lipidContentList lipidContentRepeatableBlock>
<#compress>
	<#if lipidContentRepeatableBlock?has_content>
		<#list lipidContentRepeatableBlock as blockItem>
			<para role="indent">
				<#if blockItem.LipidContent?has_content>
					<@com.range blockItem.LipidContent/> 
				</#if>
				
				<#if blockItem.TimePoint?has_content>
					(<@com.picklist blockItem.TimePoint/>)
				</#if>
				
				<#if blockItem.RemarksOnResults?has_content>
					(<@com.picklist blockItem.RemarksOnResults/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#function isNoBioaccumulationPotential ecotoxicologicalInformationSummary>
	<#if !(ecotoxicologicalInformationSummary?has_content)>
		<#return false>
	</#if>
	<#return com.picklistValueMatchesPhrases(ecotoxicologicalInformationSummary.HazardForPredators.SecondaryPoisoning.HazAssessConcl, ["no potential for bioaccumulation", "no potential to cause toxic effects if accumulated (in higher organisms) via the food chain"]) />
</#function>

<#function isPnecOral ecotoxicologicalInformationSummary>
	<#if !(ecotoxicologicalInformationSummary?has_content)>
		<#return false>
	</#if>
	<#return com.picklistValueMatchesPhrases(ecotoxicologicalInformationSummary.HazardForPredators.SecondaryPoisoning.HazAssessConcl, ["PNEC oral"]) />
</#function>


<#function getCSAValuesHenrysLawConstant summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAHenrysLawConstant(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>	
	
	<#return valuesCSA />	
</#function>
<#function isCSAHenrysLawConstant summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HenrysLawConstant?has_content || summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>

<#function getCSAValuesAdsorptionDesorption summary>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#if isCSAValuesAdsorptionDesorption(summary)>
		<#local valuesCSA = valuesCSA + [summary]/>			
	</#if>	
		<#list summary.KeyValueForChemicalSafetyAssessment.OtherAdsorptionCoefficients as blockItem>
			<#if isCSAAdsorptionDesorptionBlockItem(blockItem)>
				<#local valuesCSA = valuesCSA + [blockItem]/>			
			</#if>					
		</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAValuesAdsorptionDesorption summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.KocAt20Celsius?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>

<#function isCSAAdsorptionDesorptionBlockItem blockItem>
	<#return blockItem.Type?has_content || blockItem.TypeValue?has_content || blockItem.AtTheTemperatureOf?has_content />
</#function>
<#function getCSAValuesBiodegradationInWaterAndSedimentSimulationTests summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSABiodegradationInWaterAndSedimentSimulationTests(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>	
	
	<#return valuesCSA />	
</#function>
<#function isCSABiodegradationInWaterAndSedimentSimulationTests summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater?has_content || summary.KeyValueForChemicalSafetyAssessment.HalflifeInSediment?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValuesBiodegradationInWaterScreeningTests summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSABiodegradationInWaterScreeningTests(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>	
	
	<#return valuesCSA />	
</#function>
<#function isCSABiodegradationInWaterScreeningTests summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.BiodegradationInWater?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValuesInSoil summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAPhototransformationInSoil(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>	
	
	<#return valuesCSA />	
</#function>
<#function isCSAPhototransformationInSoil summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HalflifeInSoil?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValuesPhototransformationInWater summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAPhototransformationInWater(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAPhototransformationInWater summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HalflifeInWater?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValuesPhototransformationInAir summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAPhototransformationInAir(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>

<#function isCSAPhototransformationInAir summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HalflifeInAir?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValuesBioaccumulationAquaticSediment summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSABioaccumulationAquaticSediment(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSABioaccumulationAquaticSediment summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.BcfAquaticSpecies?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>

<#function getCSAValuesBioaccumulationTerrestrial summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSABioaccumulationTerrestrial(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSABioaccumulationTerrestrial summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.BcfTerrestrialSpecies?has_content || summary.KeyInformation.KeyInformation?has_content />
</#function>
<#function getCSAValueTextHydrolysis summary>
	<#local valuesCSA = []/>
	
	<#if !(summary?has_content)>
		<#return [] />
	</#if>
	
	<#if isCSAtext(summary)>
		<#local valuesCSA = valuesCSA + [summary]/>			
	</#if>		
	
	<#return valuesCSA />	
</#function>

<#function isCSAtext summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content | summary.KeyValueForChemicalSafetyAssessment.HalflifeForHydrolysis?has_content || summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content />
</#function>
<#function getCSAValuesHydrolysis summary>
	<#local valuesCSA = []/>
	
	<#if !(summary?has_content)>
		<#return [] />
	</#if>
	
	<#if isCSA(summary)>
		<#local valuesCSA = valuesCSA + [summary]/>			
	</#if>		
	
	<#return valuesCSA />	
</#function>

<#function isCSA summary>
	<#return summary.KeyValueForChemicalSafetyAssessment.HalflifeForHydrolysis?has_content || summary.KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf?has_content />
</#function>

<#macro CSAValueText summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for any hazard / risk / persistency assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextEnvironmentAssessment summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for any environmental exposure assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextBioaccumulationAquatic summaryCSAValue typeText="Aquatic bioaccumulation" typeText1="The following information is taken into account for any environmental exposure assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextBioaccumulationTerrestrial summaryCSAValue typeText="Terrestrial bioaccumulation" typeText1="The following information is taken into account for any environmental exposure assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>

<#macro CSAValueText_screening summaryCSAValue typeText="Discussion (screening testing)" typeText1="The following information is taken into account for any hazard / risk / persistency assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>

<#macro CSAValueText_simulation summaryCSAValue typeText="Discussion (simulation testing)" typeText1="The following information is taken into account for any hazard / risk / persistency assessment:">
<#compress>
	<@com.emptyLine/>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>