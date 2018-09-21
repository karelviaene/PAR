<!-- 7. ENVIRONMENTAL HAZARD ASSESSMENT template file -->

<!-- 7.1. Aquatic compartment (including sediment) -->
<section>
	<title role="HEAD-2">Aquatic compartment (including sediment)</title>

	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "AquaticToxicity") />

	<#if summaryList?has_content>
		<#assign printSummaryName = summaryList?size gt 1 />
		<#list summaryList as summary>
			<#assign valueForCsaText>
			</#assign>
			<@csr.endpointSummary summary valueForCsaText printSummaryName/>
		</#list>
	</#if>
	
	<!-- 7.1.1. Fish -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Fish</title>
		
		<!-- 7.1.1.1. Short-term toxicity to fish -->
		<section>
			<title role="HEAD-4">Short-term toxicity to fish</title>
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ShortTermToxicityToFish") />
						
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
			No relevant information available.
			<#else/>
				The results are summarised in the following table:
				
				<@com.emptyLine/>
				<table border="1">
					<title>Short-term effects on fish</title>
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
										<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
									</para>
									
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["LC50","LC0","LC100"]) />
									<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
			<@csr.dataWaiving dataWaivingStudyList "Short-term toxicity testing on fish"/>
				
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Short-term toxicity testing on fish"/>
			
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ShortTermToxicityToFish") />
						
			<#if summaryList?has_content>
				
				<#assign summaryCSAValue = getValueShortTermToxicityToFish(summaryList)/>
				<#if summaryCSAValue?has_content>
					<@CSAValueTextShortTermToxicityToFish summaryCSAValue typeText typeText1 />
				</#if>
				
				<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<@com.emptyLine/>
					<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
					summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content> 
					<#assign valueForCsaText>
						LC50 for freshwater fish: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
						LC50 for marine water fish: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					</#assign>
					</#if>
					
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
			</#if>
				
		</section>

		<!-- 7.1.1.2. Long-term toxicity to fish -->
		<@com.emptyLine/>
		<section>
			<title role="HEAD-4">Long-term toxicity to fish</title>
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "LongTermToxToFish") />
			
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
			No relevant information available.
			<#else/>
				The results are summarised in the following table:
				<@com.emptyLine/>
				<table border="1">
					<title>Long-term effects on fish</title>
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
										<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
									</para>
									
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","IC10"]) />
									<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
			<@csr.dataWaiving dataWaivingStudyList "Long-term toxicity testing to aquatic vertebrates"/>
				
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Long-term toxicity testing on fish" true/>
			
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "LongTermToxicityToFish") />
						
			<#if summaryList?has_content>
				
				<#assign summaryCSAValue = getValuesLongTermToxicityToFish(summaryList)/>
				<#if summaryCSAValue?has_content>
					<@CSAValueTextLongTermToxicityToFish summaryCSAValue typeText typeText1 />
				</#if>
				
				<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<@com.emptyLine/>
					<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
					summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content> 
					<#assign valueForCsaText>
						EC10/LC10 or NOEC for freshwater fish: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
						EC10/LC10 or NOEC for marine water fish: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					</#assign>
					</#if>
					
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
			</#if>
				
		</section>
	</section>
	
	<!-- 7.1.2. Aquatic invertebrates -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Aquatic invertebrates</title>
	
		<!-- 7.1.2.1. Short-term toxicity to aquatic invertebrates -->
		<section>
			<title role="HEAD-4">Short-term toxicity to aquatic invertebrates</title>
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ShortTermToxicityToAquaInv") />
		
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
			No relevant information available.
			<#else/>
				The results are summarised in the following table:
				
				<@com.emptyLine/>
				<table border="1">
					<title>Short-term effects on aquatic invertebrates</title>
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
										<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
									</para>
									
									<para>
										<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["EC50","IC50","LC50","EC0","IC0","LC0","EC100","LC100"]) />
									<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
			<@csr.dataWaiving dataWaivingStudyList "Short-term toxicity testing on aquatic invertebrates"/>
					
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Short-term toxicity testing on aquatic invertebrates"/>
				
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ShortTermToxicityToAquaticInvertebrates") />
							
			<#if summaryList?has_content>
				
				<#assign summaryCSAValue = getValuesShortTermToxicityToAquaticInvertebrates(summaryList)/>
				<#if summaryCSAValue?has_content>
					<@CSAValueTextShortTermToxicityToAquaticInvertebrates summaryCSAValue typeText typeText1 />
				</#if>
				
				<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<@com.emptyLine/>
					<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
					summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content> 
					<#assign valueForCsaText>
						EC50/LC50 for freshwater invertebrates: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
						EC50/LC50 for marine invertebrates: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					</#assign>
					</#if>
					
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
			</#if>		
		
		</section>
		
		<!-- 7.1.2.2. Long-term toxicity to fish -->
		<@com.emptyLine/>
		<section>
			<title role="HEAD-4">Long-term toxicity to aquatic invertebrates</title>
		
			<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "LongTermToxicityToAquaInv") />
		
			<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
			<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
			<!-- Study results -->
			<#if !resultStudyList?has_content>
											No relevant information available.
			<#else/>
				The results are summarised in the following table:
				
				<@com.emptyLine/>
				<table border="1">
					<title>Long-term effects on aquatic invertebrates</title>
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
										<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
									</para>
									
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","IC10"]) />
									<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
			<@csr.dataWaiving dataWaivingStudyList "Long-term toxicity testing on aquatic invertebrates"/>
					
			<!-- Testing proposal -->
			<@csr.testingProposal testingProposalStudyList "Long-term toxicity testing on aquatic invertebrates"/>
				
			<!-- Discussion -->
			<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "LongTermToxicityToAquaticInvertebrates") />
				
			
			<#if summaryList?has_content>
				
				<#assign summaryCSAValue = getValuesForLongTermToxicityToAquaticInvertebrates(summaryList)/>
				<#if summaryCSAValue?has_content>
					<@CSAValueTextLongTermToxicityToAquaticInvertebrates summaryCSAValue typeText typeText1 />
				</#if>
				
				<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<@com.emptyLine/>
					<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
					summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content> 				
					<#assign valueForCsaText>
						EC10/LC10 or NOEC for freshwater invertebrates: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
						EC10/LC10 or NOEC for marine invertebrates: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					</#assign>
					</#if>
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
			</#if>
			
		</section>
	</section>
	
	<!-- 7.1.3. Algae and aquatic plants -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Algae and aquatic plants</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToAquaticAlgae") />		
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		<#assign resultStudyList1 = resultStudyList/>
		<#assign dataWaivingStudyList1 = dataWaivingStudyList/>
		<#assign testingProposalStudyList1 = testingProposalStudyList/>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToAquaticPlant") />
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		<#assign resultStudyList2 = resultStudyList/>
		<#assign dataWaivingStudyList2 = dataWaivingStudyList/>
		<#assign testingProposalStudyList2 = testingProposalStudyList/>
		
		<!-- Study results -->
		<#if !resultStudyList1?has_content && !resultStudyList2?has_content>
										No relevant information available.
		<#else/>
			The results are summarised in the following table:
			
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on algae and aquatic plants</title>
				<col width="39%" />
				<col width="41%" />
				<col width="20%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
					</tr>
					
					<#list resultStudyList1 as study>
						<tr>
							<!-- Method -->
							<td>
								<para>
									<#if study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies?has_content>
										<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/> (algae)
									</#if>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["EC50","IC50","NOEC","LOEC","EC10","IC10","EC20","IC20","EC0","IC0","EC100","IC100"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
							</td>
							<!-- Remarks -->
							<td>
								<@csr.studyRemarksColumn study/>
							</td>
						</tr>
						<@csr.tableRowForJustificationForTypeOfInformation study/>
					</#list>

					<#list resultStudyList2 as study>
						<tr>
							<!-- Method -->
							<td>
								<para>
									<#if study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies?has_content>
										<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/> (aquatic plants)
									</#if>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["EC50","IC50","NOEC","LOEC","EC10","IC10","EC20","IC20","EC0","IC0","EC100","IC100"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
		<#if dataWaivingStudyList1?has_content || dataWaivingStudyList2?has_content>
			<para><emphasis role="HEAD-WoutNo">Data waiving</emphasis></para>
			<@csr.dataWaiving dataWaivingStudyList1 "Growth inhibition study with algae / cyanobacteria" false/>
			<@csr.dataWaiving dataWaivingStudyList2 "Growth inhibition study with aquatic plants other than algae" false/>
		</#if> 
				
		<!-- Testing proposal -->
		<#if testingProposalStudyList1?has_content || testingProposalStudyList2?has_content>
			<para><emphasis role="HEAD-WoutNo">Testing proposal</emphasis></para>
			<@csr.testingProposal testingProposalStudyList1 "Effects on algae" false/>
			<@csr.testingProposal testingProposalStudyList2 "Effects on aquatic plants " false/>
		</#if>
			
		<!-- Discussion -->		
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToAquaticAlgae") />
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToAquaticAlgae(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToAquaticAlgae summaryCSAValue typeText typeText1 typeText2 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content ||
				summary.KeyValueForChemicalSafetyAssessment.KeyValue3?has_content ||
				summary.KeyValueForChemicalSafetyAssessment.KeyValue4?has_content>
				<#assign valueForCsaText>
					EC50/LC50 for freshwater algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
					EC50/LC50 for marine water algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					EC10/LC10 or NOEC for freshwater algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue3/>
					EC10/LC10 or NOEC for marine water algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue4/>
				</#assign>
				</#if>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>	
		
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToAquaticAlgae") />
		<#if summaryList?has_content>
			<#if isContentForAquaticAlgae(summaryList)>
				<para><emphasis role="HEAD-WoutNo">Discussion</emphasis></para>
			</#if>
		</#if>
		
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityPlants") />
		<#if summaryList?has_content>

			<#assign summaryCSAValue = getValuesForToxicityPlants(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityPlants summaryCSAValue typeText typeText1 typeText2 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.KeyValue3?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.KeyValue4?has_content>
				
				<#assign valueForCsaText>
					EC50/LC50 for freshwater algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
					EC50/LC50 for marine water algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
					EC10/LC10 or NOEC for freshwater algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue3/>
					EC10/LC10 or NOEC for marine water algae: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue4/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
		<#assign studyList1 = [] />
		<#assign studyList2 = [] />
		<#assign resultStudyList1 = []/>
		<#assign dataWaivingStudyList1 = []/>
		<#assign testingProposalStudyList1 = []/>
		<#assign resultStudyList2 = []/>
		<#assign dataWaivingStudyList2 = []/>
		<#assign testingProposalStudyList2 = []/>
			
	</section>

	<!-- 7.1.4. Sediment organisms -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Sediment organisms</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "SedimentToxicity") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
			
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on sediment organisms</title>
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
									<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								
								<para>
									<@com.picklist study.AdministrativeData.Endpoint/>
									
									<#if study.MaterialsAndMethods.StudyDesign.StudyType?has_content>
										(<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>)
									</#if>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
								</para>
								
								<para>
									Sediment: <@com.picklist study.MaterialsAndMethods.StudyDesign.TypeOfSediment/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LOEC","EC10","LC10","LD10","EC50","LC50","LD50","EC0","LC0","LD0"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on sediment organisms"/>
				
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Effects on sediment organisms"/>
			
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "SedimentToxicity") />
			
		
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForSedimentToxicity(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextSedimentToxicity summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForFreshwaterSediment?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForMarineWaterSediment?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForFreshwaterSediment?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForMarineWaterSediment?has_content>
				<#assign valueForCsaText>
					EC50 or LC50 for freshwater sediment: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForFreshwaterSediment/>
					EC50 or LC50 for marine water sediment: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForMarineWaterSediment/>
					EC10, LC10 or NOEC for freshwater sediment: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForFreshwaterSediment/>
					EC10, LC10 or NOEC for marine water sediment: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForMarineWaterSediment/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
									
	</section>

	<!-- 7.1.5. Other aquatic organisms -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Other aquatic organisms</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToOtherAqua") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
			
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on other aquatic organisms</title>
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
									<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","IC10","LC10","EC50","IC50","LC50","EC0","IC0","LC0"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on other aquatic organisms"/>
				
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Effects on other aquatic organisms"/>
			
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityOtherAquaOrganisms") />
			
		
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValues(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueText summaryCSAValue typeText typeText1 />
			</#if>	
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>				
				<#assign valueForCsaText></#assign>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
									
	</section>
</section>

<!-- 7.2. Terrestrial compartment -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Terrestrial compartment</title>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "TerrestrialToxicity") />

	<#if summaryList?has_content>
		<#assign printSummaryName = summaryList?size gt 1 />
		<#list summaryList as summary>
			<@csr.endpointSummary summary "" printSummaryName/>
		</#list>
	</#if>

	<!-- 7.2.1. Toxicity to soil macro-organisms -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Toxicity to soil macro-organisms</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToSoilMacroorganismsExceptArthropods") />
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		<#assign resultStudyList1 = resultStudyList/>
		<#assign dataWaivingStudyList1 = dataWaivingStudyList/>
		<#assign testingProposalStudyList1 = testingProposalStudyList/>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToTerrestrialArthropods") />
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
		<#assign resultStudyList2 = resultStudyList/>
		<#assign dataWaivingStudyList2 = dataWaivingStudyList/>
		<#assign testingProposalStudyList2 = testingProposalStudyList/>	
			
		<!-- Study results -->
		<#if !resultStudyList1?has_content && !resultStudyList2?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
			
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on soil macro-organisms</title>
				<col width="39%" />
				<col width="41%" />
				<col width="20%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Method</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Results</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
					</tr>
					
					<#list resultStudyList1 as study>
						<tr>
							<!-- Method -->
							<td>
								<para>
									<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/>
									
									<#if study.MaterialsAndMethods.TestOrganisms.AnimalGroup?has_content>
										(<@com.picklist study.MaterialsAndMethods.TestOrganisms.AnimalGroup/>)
									</#if>
								</para>
								
								<para>
									<@com.picklist study.AdministrativeData.Endpoint/>
										
									<#if study.MaterialsAndMethods.StudyDesign.StudyType?has_content>
										(<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>)
									</#if>
								</para>
								
								<para>
									Substrate: <@com.picklist study.MaterialsAndMethods.StudyDesign.SubstrateType/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","LD10","EC50","LC50","LD50"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
							</td>
							<!-- Remarks -->
							<td>
								<@csr.studyRemarksColumn study/>
							</td>
						</tr>
						<@csr.tableRowForJustificationForTypeOfInformation study/>						
					</#list>
					
					<#list resultStudyList2 as study>
					
						<#if isSoilMacroOrganismsInvolved(study)> 
							<tr>
								<!-- Method -->
								<td>
									<para>
										<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/> (<@com.picklist study.MaterialsAndMethods.TestOrganisms.AnimalGroup/>)
									</para>
									
									<para>
										Application method: <@com.picklist study.MaterialsAndMethods.ApplicationMethod/>
									</para>
									
									<para>
										<@com.picklist study.AdministrativeData.Endpoint/>
										
										<#if study.MaterialsAndMethods.StudyDesign.StudyType?has_content>
											(<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>)
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","LD10","EC50","LC50","LD50"]) />
									<@effectList sortedEffectList/>
								</td>
								<!-- Remarks -->
								<td>
									<@csr.studyRemarksColumn study/>
								</td>
							</tr>
						</#if>
						<@csr.tableRowForJustificationForTypeOfInformation study/>
					</#list>
				</tbody>
			</table>
		</#if>
		
		<!-- Data waiving -->
		<#if dataWaivingStudyList1?has_content || dataWaivingStudyList2?has_content>
			<para><emphasis role="HEAD-WoutNo">Data waiving</emphasis></para>
			<@csr.dataWaiving dataWaivingStudyList1 "Toxicity to soil macro-organisms except arthropods" false/>
			<@csr.dataWaiving dataWaivingStudyList2 "Toxicity to soil arthropods" false/>
		</#if>          
				
		<!-- Testing proposal -->
		<#if testingProposalStudyList1?has_content || testingProposalStudyList2?has_content>
			<para><emphasis role="HEAD-WoutNo">Testing proposal</emphasis></para>
			<@csr.testingProposal testingProposalStudyList1 "Toxicity to soil macro-organisms except arthropods" false/>
			<@csr.testingProposal testingProposalStudyList2 "Toxicity to soil arthropods" false/>
		</#if>
			
		<!-- Discussion -->	
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToSoilMacroorganismsExceptArthropods") />
		<#if summaryList?has_content>
		
			<#assign summaryCSAValue = getValuesForToxicityToSoilMacroorganismsExceptArthropods(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToSoilMacroorganismsExceptArthropods summaryCSAValue typeText typeText1 />
			</#if>	
			
			<#assign printSummaryName = summaryList?size gt 1 />
				<#list summaryList as summary>
					<@com.emptyLine/>
					<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMacroorganisms?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMacroorganisms?has_content> 
					<#assign valueForCsaText>
						Short-term EC50 or LC50 for soil macro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMacroorganisms/>
						Long-term EC10/LC10 or NOEC for soil macro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMacroorganisms/>
					</#assign>
					</#if>
					
					<@csr.endpointSummary summary valueForCsaText printSummaryName/>
				</#list>
		</#if>
					
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToTerrestrialArthropods") />
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToTerrestrialArthropods(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToTerrestrialArthropods summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilDwellingArthropods?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilDwellingArthropods?has_content> 
				<#assign valueForCsaText>
					Short-term EC50 or LC50 for soil dwelling arthropods: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilDwellingArthropods/>
					Long-term EC10/LC10 or NOEC for soil dwelling arthropods: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilDwellingArthropods/>
				</#assign>
				</#if>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
		<#assign studyList1 = [] />
		<#assign studyList2 = [] />
		<#assign resultStudyList1 = []/>
		<#assign dataWaivingStudyList1 = []/>
		<#assign testingProposalStudyList1 = []/>
		<#assign resultStudyList2 = []/>
		<#assign dataWaivingStudyList2 = []/>
		<#assign testingProposalStudyList2 = []/>
				
	</section>

	<!-- 7.2.2. Toxicity to terrestrial plants -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Toxicity to terrestrial plants</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToTerrestrialPlants") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on terrestrial plants</title>
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
								<@TestOrgsForTerrestrialPlants study.MaterialsAndMethods.TestOrganisms.TestOrganisms/>
								</para>
								
								<para>									
									<@com.picklist study.AdministrativeData.Endpoint/> 
									
									<#if study.MaterialsAndMethods.StudyDesign.StudyType?has_content>
										(<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>)
									</#if>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
								</para>
								
								<para>
									Substrate: <@com.picklist study.MaterialsAndMethods.StudyDesign.SubstrateType/>
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
								<@effectIncludingSpeciesList csr.orderByKeyResult(study.ResultsAndDiscussion.EffectConcentrations)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on terrestrial plants"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "" true/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToTerrestrialPlants") />
				
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToTerrestrialPlants(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToTerrestrialPlants summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForTerrestrialPlants?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForTerrestrialPlants?has_content> 
				<#assign valueForCsaText>
					Short-term EC50 or LC50 for terrestrial plants: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForTerrestrialPlants/>
					Long-term EC10/LC10 or NOEC for terrestrial plants: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForTerrestrialPlants/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>

	<!-- 7.2.3. Toxicity to soil micro-organisms -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Toxicity to soil micro-organisms</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToSoilMicroorganisms") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on soil micro-organisms</title>
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
									Species/Inoculum: <@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsInoculum/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","EC10","EC25","EC50","EC100"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on soil micro-organisms"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Effects on soil micro-organisms"/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToSoilMicroorganisms") />
						
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToSoilMicroorganisms(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToSoilMicroorganisms summaryCSAValue typeText typeText1 />
			</#if>
			
			<#assign printSummaryName = summaryList?size gt 1 />
			
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMicroorganisms?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMicroorganisms?has_content> 
				
				<#assign valueForCsaText>
					Short-term EC50 or LC50 for soil micro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMicroorganisms/>
					Long-term EC10/LC10 or NOEC for soil micro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMicroorganisms/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>

	<!-- 7.2.4. Toxicity to other terrestrial organisms -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Toxicity to other terrestrial organisms</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToTerrestrialArthropods") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on terrestrial arthropods</title>
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
						<#if !isSoilMacroOrganismsInvolved(study)>
							<tr>
								<!-- Method -->
								<td>
									<para>
										<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/> 
										
										<#if study.MaterialsAndMethods.TestOrganisms.AnimalGroup?has_content>
											(<@com.picklist study.MaterialsAndMethods.TestOrganisms.AnimalGroup/>)
										</#if>
									</para>
									
									<para>
										Application method: <@com.picklist study.MaterialsAndMethods.ApplicationMethod/>
									</para>
									
									<para>
										<@com.picklist study.AdministrativeData.Endpoint/> 
										
										<#if study.MaterialsAndMethods.StudyDesign.StudyType?has_content>
											(<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>
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
									<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","LD10","EC50","LC50","LD50"]) />
									<@effectList csr.orderByKeyResult(sortedEffectList)/>
								</td>
								<!-- Remarks -->
								<td>
									<@csr.studyRemarksColumn study/>
								</td>
							</tr>
						</#if>
						<@csr.tableRowForJustificationForTypeOfInformation study/>
					</#list>
				</tbody>
			</table>
		</#if>
		
		<!-- Data waiving -->
		<@csr.dataWaiving dataWaivingStudyList "Toxicity to terrestrial arthropods other than soil macro-organisms"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Toxicity to terrestrial arthropods other than soil macro-organisms"/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToTerrestrialArthropods") />
				
		
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValues(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueText summaryCSAValue typeText typeText1 />
			</#if>			
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>			
				<#assign valueForCsaText></#assign>
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>
</section>
	
<!-- 7.3. Atmospheric compartment -->
<#if instructionNeededForAtmosphericCompartment()>
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Atmospheric compartment</title>
	<para><emphasis role="bold">&gt;&gt;&gt;NOTE (please delete this instruction): Move any information related to this section manually from other sections (e.g. from "Toxicity to terrestrial plants" (if fumigation study) or from "Toxicity to other terrestrial organisms" (e.g. if spray application study with honeybees).&lt;&lt;&lt;</emphasis></para>
</section>
<#else>
	<section>
	<@com.emptyLine/><title role="HEAD-2">Atmospheric compartment</title>
	No relevant information available.
	</section>
</#if>

<!-- 7.4. Microbiological activity in sewage treatment systems -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Microbiological activity in sewage treatment systems</title>

	<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToMicroorganisms") />
		
	<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
	<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
	<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on micro-organisms</title>
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
									<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>
								</para>
								
								<para>
									<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
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
								<#assign sortedEffectList = iuclid.sortByField(study.ResultsAndDiscussion.EffectConcentrations, "Endpoint", ["NOEC","LOEC","EC10","LC10","IC10","EC50","IC50","EC0","IC0"]) />
								<@effectList csr.orderByKeyResult(sortedEffectList)/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on aquatic micro-organisms"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Effects on aquatic micro-organisms"/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityMicroorganisms") />
				
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityMicroorganisms(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityMicroorganisms summaryCSAValue typeText typeText1 />
			</#if>	
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content> 
				<#assign valueForCsaText>
				EC50/LC50 for aquatic micro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue1/>
				EC10/LC10 or NOEC for aquatic micro-organisms: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.KeyValue2/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>		

</section>

<!-- 7.5. Non compartment specific effects relevant for the food chain (secondary poisoning) -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Non compartment specific effects relevant for the food chain (secondary poisoning)</title>

	<!-- 7.5.1. Toxicity to birds -->
	<section>
		<title role="HEAD-3">Toxicity to birds</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToBirds") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on birds</title>
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
									<@com.picklist study.AdministrativeData.Endpoint/>
									<#if study.MaterialsAndMethods.TestMaterials.DoseMethod?has_content>
										(<@com.picklist study.MaterialsAndMethods.TestMaterials.DoseMethod/>)
									</#if>
								</para>
									
								<para>
									<#if study.MaterialsAndMethods.StudyDesign.NominalAndMeasuredDosesConcentrations?has_content>
										Doses: <@com.text study.MaterialsAndMethods.StudyDesign.NominalAndMeasuredDosesConcentrations/>
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
								<@effectBirdsList study.ResultsAndDiscussion.EffectLevels/>
								
								<para>
									<@com.text study.ResultsAndDiscussion.RepellencyFactors/>
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
		<@csr.dataWaiving dataWaivingStudyList "Toxicity to birds"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Toxicity to birds"/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToBirds") />
				
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToBirds(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueTextToxicityToBirds summaryCSAValue typeText typeText1 />
			</#if>	
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForBirds?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForBirds?has_content> 
				<#assign valueForCsaText>
					Short-term EC50 or LC50 for birds: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForBirds/>
					Long-term EC10/LC10 or NOEC for birds: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForBirds/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>		
	
	</section>
	
	<!-- 7.5.2. Toxicity to mammals -->
	<@com.emptyLine/>
	<section>
		<title role="HEAD-3">Toxicity to mammals</title>
		
		<#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToOtherAboveGroundOrganisms") />
		
		<#-- Populate resultStudyList, dataWaivingStudyList, testingProposalStudyList -->
		<@populateResultAndDataWaivingAndTestingProposalStudyLists studyList/>
			
		<!-- Study results -->
		<#if !resultStudyList?has_content>
		No relevant information available.
		<#else/>
			The results are summarised in the following table:
				
			<@com.emptyLine/>
			<table border="1">
				<title>Effects on mammals</title>
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
									<@com.picklist study.MaterialsAndMethods.StudyDesign.StudyType/>
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
								<@effectList study.ResultsAndDiscussion.EffectConcentrations/>
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
		<@csr.dataWaiving dataWaivingStudyList "Effects on other above-ground organisms / mammals"/>
					
		<!-- Testing proposal -->
		<@csr.testingProposal testingProposalStudyList "Effects on other above-ground organisms / mammals"/>
				
		<!-- Discussion -->
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToOtherAboveGroundOrganisms") />
						
		<#if summaryList?has_content>
			
			<#assign summaryCSAValue = getValuesForToxicityToOtherAboveGroundOrganisms(summaryList)/>
			<#if summaryCSAValue?has_content>
				<@CSAValueToxicityToOtherAboveGroundOrganisms summaryCSAValue typeText typeText1 />
			</#if>	
			
			<#assign printSummaryName = summaryList?size gt 1 />
			<#list summaryList as summary>
				<@com.emptyLine/>
				<#if summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForMammals?has_content || 
				summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForMammals?has_content> 
				<#assign valueForCsaText>
				Short-term EC50 or LC50 for mammals: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForMammals/>
				Long-term EC10/LC10 or NOEC for mammals: <@com.quantity summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForMammals/>
				</#assign>
				</#if>
				
				<@csr.endpointSummary summary valueForCsaText printSummaryName/>
			</#list>
		</#if>
		
	</section>
</section>
	

<!-- 7.6. PNEC derivation and other hazard conclusions -->

<@com.emptyLine/>
<section>
	
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "EcotoxicologicalInformation") />
	
	<title role="HEAD-2">PNEC derivation and other hazard conclusions</title>
	<#if !(summaryList?has_content)>
	
		No relevant information available.
		
		<#else/>
		<@pnec.generateReportForCSR substance/>
	</#if>
	
</section>



<!-- Macros and functions -->

<#macro effectList effectConcRepeatableBlock>
<#compress>
	<#if effectConcRepeatableBlock?has_content>
		<#list effectConcRepeatableBlock as blockItem>
			<#if blockItem.Endpoint?has_content || blockItem.Duration?has_content 
			|| blockItem.EffectConc?has_content || blockItem.ConcBasedOn?has_content
			|| blockItem.NominalMeasured?has_content || blockItem.BasisForEffect?has_content
			|| blockItem.RemarksOnResults?has_content>
				<para>
					<#if blockItem.Endpoint?has_content> 
						<@com.picklist blockItem.Endpoint/>
					</#if>
					
					<#if blockItem.Duration?has_content> 
						(<@com.quantity blockItem.Duration/>):
					</#if>
					
					<#if blockItem.EffectConc?has_content> 
						<@com.range blockItem.EffectConc/> 
					</#if>
					
					<#if blockItem.ConcBasedOn?has_content> 
						<@com.picklist blockItem.ConcBasedOn/>
					</#if>
					
					<#if blockItem.NominalMeasured?has_content>
						(<@com.picklist blockItem.NominalMeasured/>)
					</#if>
					
					<#if blockItem.BasisForEffect?has_content>
						based on: <@com.picklist blockItem.BasisForEffect/>
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

<#macro effectIncludingSpeciesList effectConcIncludingSpeciesRepeatableBlock>
<#compress>
	<#if effectConcIncludingSpeciesRepeatableBlock?has_content>
		<#list effectConcIncludingSpeciesRepeatableBlock as blockItem>
			<#if blockItem.Species?has_content || blockItem.Endpoint?has_content 
			|| blockItem.Duration?has_content || blockItem.EffectConc?has_content
			|| blockItem.ConcBasedOn?has_content || blockItem.NominalMeasured?has_content
			|| blockItem.BasisForEffect?has_content || blockItem.RemarksOnResults?has_content>
				<para>
					<#if blockItem.Species?has_content>
						<@com.picklist blockItem.Species/>
					</#if>
					
					<#if blockItem.Endpoint?has_content>
						<@com.picklist blockItem.Endpoint/>
					</#if>
					
					<#if blockItem.Duration?has_content>
						(<@com.quantity blockItem.Duration/>):
					</#if>
					
					<#if blockItem.EffectConc?has_content>
						<@com.range blockItem.EffectConc/> 
					</#if>
					
					<#if blockItem.ConcBasedOn?has_content>
						<@com.picklist blockItem.ConcBasedOn/>
					</#if>
					
					<#if blockItem.NominalMeasured?has_content>
						(<@com.picklist blockItem.NominalMeasured/>)
					</#if>
										
					<#if blockItem.BasisForEffect?has_content>
						based on: <@com.picklist blockItem.BasisForEffect/>
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

<#macro effectBirdsList effectConcBirdsRepeatableBlock>
<#compress>
	<#if effectConcBirdsRepeatableBlock?has_content>
		<#list effectConcBirdsRepeatableBlock as blockItem>
			<#if blockItem.Endpoint?has_content || blockItem.Duration?has_content 
			|| blockItem.EffectLevel?has_content || blockItem.ConcDoseBasedOn?has_content
			|| blockItem.BasisForEffect?has_content || blockItem.RemarksOnResults?has_content>
				<para>
					<#if blockItem.Endpoint?has_content>
						<@com.picklist blockItem.Endpoint/> 
					</#if>
					
					<#if blockItem.Duration?has_content>
						(<@com.quantity blockItem.Duration/>):
					</#if>
					
					<#if blockItem.EffectLevel?has_content>
						<@com.range blockItem.EffectLevel/> 
					</#if>
					
					<#if blockItem.ConcDoseBasedOn?has_content>
						<@com.picklist blockItem.ConcDoseBasedOn/>
					</#if>
										
					<#if blockItem.BasisForEffect?has_content>
						based on: <@com.picklist blockItem.BasisForEffect/>
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

<#macro TestOrgsForTerrestrialPlants TestOrgsRepeatableBlock>
<#compress>
	<#if TestOrgsRepeatableBlock?has_content>
		<#list TestOrgsRepeatableBlock as blockItem>
			<#if blockItem.Species?has_content || blockItem.PlantGroup?has_content>
				<para role="indent">
					<#if blockItem.Species?has_content>
						<@com.picklist blockItem.Species/>
					</#if>
					
					<#if blockItem.PlantGroup?has_content>
						(<@com.picklist blockItem.PlantGroup/>)	
					</#if>
				</para>
			</#if>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro hazardConclusion hazardConclusionBlock>
<#compress>
	<#if hazardConclusionBlock.HazAssessConcl?has_content || hazardConclusionBlock.HazAssessConclVal?has_content>
		<para>
			<#if hazardConclusionBlock.HazAssessConcl?has_content>
				<@com.picklist hazardConclusionBlock.HazAssessConcl/>: 
			</#if>
			
			<#if hazardConclusionBlock.HazAssessConclVal?has_content>
				<@com.quantity hazardConclusionBlock.HazAssessConclVal/>
			</#if>
		</para>
	</#if>
</#compress>
</#macro>

<#macro hazardRemarks hazardConclusionBlock>
<#compress>
	<#if hazardConclusionBlock.hasElement("AssessmentFactor")>		
		<#if com.picklistValueMatchesPhrases(hazardConclusionBlock.HazAssessConcl, [".*PNEC.*"])>
			<para>
				<#if hazardConclusionBlock.AssessmentFactor?has_content>
				Assessment factor: <@com.number hazardConclusionBlock.AssessmentFactor/>
				</#if>
			</para>
		</#if>
	</#if>
	<#if hazardConclusionBlock.hasElement("ExtrapolationMethod")>
		<#if com.picklistValueMatchesPhrases(hazardConclusionBlock.HazAssessConcl, [".*PNEC.*"])>
			<para>
				Extrapolation method: <@com.picklist hazardConclusionBlock.ExtrapolationMethod/>
			</para>
		</#if>
	</#if>
	<#if hazardConclusionBlock.hasElement("ExtrapolationMethod")>
		<#if com.picklistValueMatchesPhrases(hazardConclusionBlock.HazAssessConcl, [".*PNEC.*"])>
			<para>
				<@com.picklist hazardConclusionBlock.HazAssessConcl/>
			</para>
		</#if>
	</#if>
	
	
	<para>
		<@com.richText hazardConclusionBlock.Justification/>
	</para>
</#compress>
</#macro>

<#function isSoilMacroOrganismsInvolved study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local AnimalGroup = study.MaterialsAndMethods.TestOrganisms.AnimalGroup />
	<#local TestOrganismsSpecies = study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies />
	<#local ApplicationMethod = study.MaterialsAndMethods.ApplicationMethod />
	
	<#if com.picklistValueMatchesPhrases(AnimalGroup, [".*soil.*"])>
		<#return true>
	<#elseif com.isPicklistEmptyOrOther(AnimalGroup)/>
		<#if com.picklistValueMatchesPhrases(TestOrganismsSpecies, [".*soil.*"])>
			<#return true>
		<#elseif com.isPicklistEmptyOrOther(TestOrganismsSpecies)/>
			<#if com.picklistValueMatchesPhrases(ApplicationMethod, ["soil"])>
				<#return true>
			</#if>
		</#if>
	</#if>
	
	<#return false>
</#function>

<#function isGuidelineListEmptyOrOther GuidelineList>
	<#if !(GuidelineList?has_content)>
		<#return true>
	</#if>
	<#if GuidelineList?size gt 1 >
		<#return false>
	</#if>
	<#local Guideline = GuidelineList[0].Guideline />
	<#return com.isPicklistEmptyOrOther(Guideline) />
</#function>

<#function instructionNeededForAtmosphericCompartment>	
	<#local studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToTerrestrialPlants") />
	<#if studyList?has_content>
		<#list studyList as study>
			<#if com.picklistValueMatchesPhrases(study.MaterialsAndMethods.StudyDesign.StudyType, [".*field study"])>
				<#return true />
			</#if>
		</#list>
  	</#if>
	
	<#local studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "ToxicityToTerrestrialArthropods") />
	<#if studyList?has_content>
		<#list studyList as study>
			<#if com.picklistValueMatchesPhrases(study.MaterialsAndMethods.ApplicationMethod, ["spray"])>
				<#return true />
			</#if>
		</#list>
  	</#if>
	
	<#return false />
</#function>

<#function isContentForAquaticAlgae summaryList>
	
	<#if !(summaryList?has_content)>		
		<#return true />
	</#if>
	<#if summaryList?has_content>		
		<#return false />
	</#if>
	
	<#return false />
</#function>

<#function getValues summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSA(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>

<#function isCSA summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content />
</#function>

<#macro CSAValueText summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for any hazard / risk assessment:">
<#compress>
	<para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>

<#function getValuesForToxicityToBirds summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToBirds(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>

<#function isCSAToxicityToBirds summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForBirds?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForBirds?has_content />
</#function>

<#function getValuesForToxicityToOtherAboveGroundOrganisms summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToOtherAboveGroundOrganisms(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>

<#function isCSAToxicityToOtherAboveGroundOrganisms summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForMammals?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForMammals?has_content />
</#function>

<#function getValuesForToxicityToSoilMicroorganisms summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToSoilMicroorganisms(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityToSoilMicroorganisms summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMicroorganisms?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMicroorganisms?has_content />
</#function>

<#function getValuesForToxicityToTerrestrialPlants summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToTerrestrialPlants(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityToTerrestrialPlants summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForTerrestrialPlants?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForTerrestrialPlants?has_content />
</#function>

<#function getValuesForLongTermToxicityToAquaticInvertebrates summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSALongTermToxicityToAquaticInvertebrates(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSALongTermToxicityToAquaticInvertebrates summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content />
</#function>

<#function getValuesShortTermToxicityToAquaticInvertebrates summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAShortTermToxicityToAquaticInvertebrates(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAShortTermToxicityToAquaticInvertebrates summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content />
</#function>

<#function getValuesLongTermToxicityToFish summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSALongTermToxicityToFish(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSALongTermToxicityToFish summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content />
</#function>


<#function getValuesForToxicityToTerrestrialArthropods summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToTerrestrialArthropods(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityToTerrestrialArthropods summary>
	<#return summary.KeyInformation.KeyInformation?has_content || 
	summary.Discussion.Discussion?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilDwellingArthropods?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilDwellingArthropods?has_content />
</#function>
<#function getValuesForToxicityToAquaticAlgae summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToAquaticAlgae(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityToAquaticAlgae summary>
	<#return summary.KeyInformation.KeyInformation?has_content || 
	summary.Discussion.Discussion?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content ||
	summary.KeyValueForChemicalSafetyAssessment.KeyValue3?has_content ||
	summary.KeyValueForChemicalSafetyAssessment.KeyValue4?has_content />
</#function>
<#function getValueShortTermToxicityToFish summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAShortTermToxicityToFish(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAShortTermToxicityToFish summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
					summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content />
</#function>

<#function getValuesForToxicityToSoilMacroorganismsExceptArthropods summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityToSoilMacroorganismsExceptArthropods(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityToSoilMacroorganismsExceptArthropods summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.ShortTermEc50OrLc50ForSoilMacroorganisms?has_content || summary.KeyValueForChemicalSafetyAssessment.LongTermEc10Lc10OrNoecForSoilMacroorganisms?has_content />
</#function>
<#function getValuesForToxicityPlants summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityPlants(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityPlants summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue3?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.KeyValue4?has_content />
</#function>


<#function getValuesForSedimentToxicity summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSASedimentToxicity(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSASedimentToxicity summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForFreshwaterSediment?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.Ec50Lc50ForMarineWaterSediment?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForFreshwaterSediment?has_content || 
	summary.KeyValueForChemicalSafetyAssessment.Ec10Lc10OrNoecForMarineWaterSediment?has_content />
</#function>
<#function getValuesForToxicityMicroorganisms summaryList>
	<#local valuesCSA = []/>
	
	<#if !(summaryList?has_content)>
		<#return [] />
	</#if>
	
	<#list summaryList as summary>
		<#if isCSAToxicityMicroorganisms(summary)>
			<#local valuesCSA = valuesCSA + [summary]/>			
		</#if>				
	</#list>
	
	<#return valuesCSA />	
</#function>
<#function isCSAToxicityMicroorganisms summary>
	<#return summary.KeyInformation.KeyInformation?has_content || summary.Discussion.Discussion?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue1?has_content || summary.KeyValueForChemicalSafetyAssessment.KeyValue2?has_content />
</#function>

<#macro CSAValueTextToxicityMicroorganisms summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for effects on aquatic micro-organisms for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>

<#macro CSAValueTextToxicityToBirds summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for effects on birds for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>

<#macro CSAValueToxicityToOtherAboveGroundOrganisms summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for effects on mammals for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityToSoilMicroorganisms summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for toxicity on soil micro-organisms for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityToTerrestrialPlants summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for toxicity on terrestrial plants for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextLongTermToxicityToAquaticInvertebrates summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for long-term toxicity to aquatic invertebrates for the derivation of PNEC">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextShortTermToxicityToAquaticInvertebrates summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for short-term toxicity to aquatic invertebrates for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextLongTermToxicityToFish summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for long-term fish toxicity for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextShortTermToxicityToFish summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for acute fish toxicity for the derivation of PNEC:">
<#compress>
	<para><@com.emptyLine/><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityToAquaticAlgae summaryCSAValue typeText="Discussion" typeText1="Effects on algae / cyanobacteria" typeText2="The following information is taken into account for effects on algae / cyanobacteria for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="HEAD-WoutNo">${typeText1}</emphasis></para>
	<para><emphasis role="underline">${typeText2}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityPlants summaryCSAValue typeText="Discussion" typeText1="Effects on aquatic plants other than algae" typeText2="The following information is taken into account for effects on aquatic plants other than algae for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="HEAD-WoutNo">${typeText1}</emphasis></para>
	<para><emphasis role="underline">${typeText2}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextSedimentToxicity summaryCSAValue typeText="Discussion" typeText1="The following information is taken into account for sediment toxicity for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityToSoilMacroorganismsExceptArthropods summaryCSAValue typeText="Discussion of effects on soil macro-organisms except arthropods" typeText1="The following information is taken into account for effects on soil macro-organisms except arthropods for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>
<#macro CSAValueTextToxicityToTerrestrialArthropods summaryCSAValue typeText="Discussion of effects on soil dwelling arthropods" typeText1="The following information is taken into account for effects on soil dwelling arthropods for the derivation of PNEC:">
<#compress>
	<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">${typeText}</emphasis></para>
	<para><emphasis role="underline">${typeText1}</emphasis></para>
</#compress>
</#macro>