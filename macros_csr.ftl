<!-- Reusable macros and functions in templates representing sub-chapters of CSR document -->

<#-- Macros regarding substance name -->

<#macro substanceName substance>
<#compress>
	<#if substance.ReferenceSubstance.ReferenceSubstance?has_content> 
		<#local referenceSubstance = iuclid.getDocumentForKey(substance.ReferenceSubstance.ReferenceSubstance) />
	</#if>
	<#if referenceSubstance?has_content>
		<@com.text referenceSubstance.GeneralInfo.ReferenceSubstanceName/>
	<#else>
		<@com.text substance.ChemicalName/>
  	</#if>  
</#compress>
</#macro>

<#macro classificationSubstanceName ghsOrDsdDpdRecord, substance>
<#compress>
	<#if ghsOrDsdDpdRecord.GeneralInformation.Name?has_content>
		<@com.text ghsOrDsdDpdRecord.GeneralInformation.Name/>
	<#else/>
		<@substanceName substance />
  	</#if>
</#compress>
</#macro>


<#macro guidelineList guidelineRepeatableBlock>
<#compress>
	<#if guidelineRepeatableBlock?has_content>
		<#list guidelineRepeatableBlock as blockItem>
			<#local Qualifier><@com.picklist blockItem.Qualifier/></#local>
			<#local Guideline><@com.picklist blockItem.Guideline/></#local>
			<#if Qualifier?has_content>${Qualifier}</#if>
			<#if Guideline?has_content>${Guideline}</#if>
			<#if blockItem_has_next>; </#if>
		</#list>
  	</#if>
</#compress>
</#macro>


<#-- Macros to print study results column -->

<#macro studyRemarksColumn study>
	<para>
		<@com.text study.ResultsAndDiscussion.InVivo.IrritationCorrosionResponseData/>
	</para>
</#macro>

<#macro studyTestMaterial study>
	<para>
		Test material: <@testMaterialInformation study.MaterialsAndMethods.TestMaterials.TestMaterialInformation/>
	</para>
</#macro>


<#macro studyReference study>
	<para>
		<@literatureReferenceList study.DataSource.Reference/>
	</para>
</#macro>


<#-- Variable to hold the list of Test Material Information documents in the order of appearance. A document should appear only once in this list -->
<#assign testMaterialInformations = [] />

<#macro testMaterialInformation documentKey>
<#compress>
	<#if documentKey?has_content>
		<#local testMaterial = iuclid.getDocumentForKey(documentKey) />
		<#if testMaterial?has_content>
			<#assign testMaterialInformations = com.addDocumentToSequenceAsUnique(testMaterial, testMaterialInformations) />			
			<@com.text testMaterial.Name/>,
			<#if testMaterial.Composition.OtherCharacteristics.TestMaterialForm?has_content>
			<?linebreak?>
			Form: <@com.picklist testMaterial.Composition.OtherCharacteristics.TestMaterialForm/>
			</#if> (full information in <link linkend="${testMaterial.documentKey.uuid!}">Appendix</link>).
		</#if>
	<#else>
		Information not available in IUCLID
	</#if>
</#compress>
</#macro>

<#-- Variable to hold the list of references in the order of appearance. A reference document should appear only once in this list -->
<#assign literatureReferences = [] />

<#macro literatureReferenceList multipleReferenceValue>
<#compress>
	<#if multipleReferenceValue?has_content>
		<#list multipleReferenceValue as item>
			<#local reference = iuclid.getDocumentForKey(item) />
			<#if reference?has_content>
				<#assign literatureReferences = com.addDocumentToSequenceAsUnique(reference, literatureReferences) />
				<link  linkend="${reference.documentKey.uuid!}">
					<@com.text reference.GeneralInfo.Author/> <#if reference.GeneralInfo.ReferenceYear?has_content>${reference.GeneralInfo.ReferenceYear?string["0"]}</#if>
				</link>
				<?linebreak?>
			</#if>
		</#list>
	</#if>
</#compress>
</#macro>

<#-- Variables for hyperlinking/populating Annex III -->

<#assign modeOfActionsOthersReproductiveTox = [] />
<#macro modeOfActionOtherReproductiveTox summary>
<#compress>	
	<#assign modeOfActionsOthersReproductiveTox = modeOfActionsOthersReproductiveTox + [summary] />
		<link linkend="${summary.documentKey.uuid!}"><citetitle>Detailed information on the Mode of Action is available in Annex III:</citetitle></link>
</#compress>
</#macro>

<#assign modeOfActionRepeatedDosesToxicity = [] />
<#macro modeOfActionRepeatedDoseToxicity summary>
<#compress>
	<#assign modeOfActionRepeatedDosesToxicity = modeOfActionRepeatedDosesToxicity + [summary] />
		<link linkend="${summary.documentKey.uuid!}"><citetitle>Detailed information on the Mode of Action is available in Annex III:</citetitle></link>
</#compress>
</#macro>

<#assign modeOfActionsOthersGenetic = [] />
<#macro modeOfActionOtherGenetic summary>
<#compress>
	<#assign modeOfActionsOthersGenetic = modeOfActionsOthersGenetic + [summary]/>
		<link linkend="${summary.documentKey.uuid!}"><citetitle>Detailed information on the Mode of Action is available in Annex III:</citetitle></link>
</#compress>
</#macro>

<#assign modeOfActionsOthersCarcinogenicity = [] />
<#macro modeOfActionOtherCarcinogenicity summary>
<#compress>
	<#assign modeOfActionsOthersCarcinogenicity = modeOfActionsOthersCarcinogenicity + [summary]/>
		<link linkend="${summary.documentKey.uuid!}"><citetitle>Detailed information on the Mode of Action is available in Annex III:</citetitle></link>
</#compress>
</#macro>

<#-- Macros to print endpoint summary -->

<#macro endpointSummary summary valueForCsaText="" printName=false>
	<#if printName>
		<para><emphasis role="bold"><@com.text summary.name/></emphasis></para>
	</#if>
	<@summaryKeyInformation summary/>
	<#if valueForCsaText?has_content>
		<@com.emptyLine/>
		<para>
			<emphasis role="bold">Value used for CSA:</emphasis>
			<?linebreak?>
			${valueForCsaText}
		</para>
	</#if>
	
	<#if assessmentEntitiesExist>
		<#assign aeList = getAssessmentEntitiesLinkedToSummary(summary)/>
		<#if aeList?has_content>
			<@com.emptyLine/>
			<para>
				<emphasis role="bold">Assessment entity linked:</emphasis>
				<#list aeList as ae>
					<@com.text ae.AssessmentEntityName/>
					<#if ae_has_next>; </#if>
				</#list>
			</para>
		</#if>
	</#if>
	
	<@summaryAdditionalInformation summary/>
</#macro>

<#macro summaryKeyInformation summary>
	<#if summary.KeyInformation.KeyInformation?has_content>
		<para><@com.richText summary.KeyInformation.KeyInformation/></para>
	</#if>
</#macro>

<#macro summaryAdditionalInformation summary>
	<#if summary.Discussion.Discussion?has_content>
		<@com.emptyLine/>
		<para><emphasis role="bold">Additional information:</emphasis> <@com.richText summary.Discussion.Discussion/></para>
	</#if>
</#macro>


<#-- Macros to print study records -->

<#macro dataWaiving dataWaivingStudyList endpoint printHeader=true>
	<#if dataWaivingStudyList?has_content>
		<#if printHeader>
			<@com.emptyLine/>
			<para><emphasis role="HEAD-WoutNo">Data waiving</emphasis></para>
		</#if>
		<#list dataWaivingStudyList as study>
			<@dataWaivingRecord study endpoint/>
		</#list>
	</#if>
</#macro>

<#macro dataWaivingRecord study endpoint>
	<#if study?has_content>
		<para><emphasis role="bold">Information requirement:</emphasis> ${endpoint!}</para>
		<para role="indent">
			<emphasis role="bold">Reason: </emphasis>
			<@com.picklist study.AdministrativeData.DataWaiving/>
		</para>
		<para role="indent">
			<emphasis role="bold">Justification:</emphasis>
			<@com.picklistMultiple study.AdministrativeData.DataWaivingJustification/>
		</para>
	</#if>
</#macro>


<#macro testingProposal testingProposalStudyList endpoint printHeader=true printEndpointField=false>
	<#if testingProposalStudyList?has_content>
		<#if printHeader>
			<@com.emptyLine/>
			<para><emphasis role="HEAD-WoutNo">Testing proposal</emphasis></para>
		</#if>
		<#list testingProposalStudyList as study>
			<@testingProposalRecord study endpoint printEndpointField/>
		</#list>
	</#if>
</#macro>

<#macro testingProposalRecord study endpoint printEndpointField=false>
	<#if study?has_content>
		<para>
			<emphasis role="bold">Information requirement:</emphasis> ${endpoint!}
			<#if printEndpointField>
				<#if endpoint?has_content>(</#if>
				<@com.picklist study.AdministrativeData.Endpoint/>
				<#if endpoint?has_content>)</#if>
			</#if>
		</para>
		<para role="indent">
			<emphasis role="bold">Justification for testing proposal:</emphasis>
			<@com.text study.AdministrativeData.JustificationForTypeOfInformation/>
		</para>
		<para role="indent">
			<emphasis role="bold">Proposed test guideline:</emphasis>
			<@guidelineList study.MaterialsAndMethods.Guideline/>
		</para>
		
		<#if study.hasElement("MaterialsAndMethods.StudyType") && study.MaterialsAndMethods.StudyType?has_content>
			<para role="indent">
				<emphasis role="bold">Planned study type:</emphasis>
				<@com.picklist study.MaterialsAndMethods.StudyType/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.MethodType") && study.MaterialsAndMethods.MethodType?has_content>
			<para role="indent">
				Type of method:
				<@com.picklist study.MaterialsAndMethods.MethodType/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.DetailsOnMethods") && study.MaterialsAndMethods.StudyDesign.DetailsOnMethods?has_content>
			<para role="indent">
				Details on methods:
				<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnMethods/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.InoculumOrTestSystem") && study.MaterialsAndMethods.StudyDesign.InoculumOrTestSystem?has_content>
			<para role="indent">
				Test system:
				<@com.picklist study.MaterialsAndMethods.StudyDesign.InoculumOrTestSystem/>
				(<@com.picklist study.MaterialsAndMethods.StudyDesign.OxygenConditions/>)
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSurfaceWater") && study.MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSurfaceWater?has_content>
			<para role="indent">
				Source and properties of surface water:
				<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSurfaceWater/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSediment") && study.MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSediment?has_content>
			<para role="indent">
				Source and properties of sediment:
				<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnSourceAndPropertiesOfSediment/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.DetailsOnStudyDesign") && study.MaterialsAndMethods.StudyDesign.DetailsOnStudyDesign?has_content>
			<para role="indent">
				Study design:
				<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnStudyDesign/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.DetailsOnExperimentalConditions") && study.MaterialsAndMethods.StudyDesign.DetailsOnExperimentalConditions?has_content>
			<para role="indent">
				Study design:
				<@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnExperimentalConditions/>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies") && study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies?has_content>
			<para role="indent">
				Species:
				<@com.picklist study.MaterialsAndMethods.TestOrganisms.TestOrganismsSpecies/>
				<#if study.hasElement("MaterialsAndMethods.StudyDesign.WaterMediaType") && study.MaterialsAndMethods.StudyDesign.WaterMediaType?has_content>
					(<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>)
				</#if>
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.RouteOfExposure") && study.MaterialsAndMethods.StudyDesign.RouteOfExposure?has_content>
			<para role="indent">
				Compartment / route:
				<@com.picklist study.MaterialsAndMethods.StudyDesign.RouteOfExposure/> (<@com.picklist study.MaterialsAndMethods.StudyDesign.WaterMediaType/>)
			</para>
		</#if>
		<#if study.hasElement("MaterialsAndMethods.StudyDesign.TestType") && study.MaterialsAndMethods.StudyDesign.TestType?has_content>
			<para role="indent">
				Test type:
				<@com.picklist study.MaterialsAndMethods.StudyDesign.TestType/>
			</para>
		</#if>
		
		<para role="indent">
			<emphasis role="bold">Principles of method if other than guideline:</emphasis>
			<?linebreak?>
			<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
		</para>
		<para role="indent">
			<emphasis role="bold">Planned study period:</emphasis>
			<@com.text study.AdministrativeData.StudyPeriod/>
		</para>
		<para role="indent">
			<emphasis role="bold">Test material:</emphasis>
			<@testMaterialInformation study.MaterialsAndMethods.TestMaterials.TestMaterialInformation/>
		</para>
	</#if>
</#macro>


<#macro tableRowForJustificationForTypeOfInformation study>
	<#if study?has_content && study.AdministrativeData.JustificationForTypeOfInformation?has_content>
		<tr>
			<td colspan="3">
				Justification for type of information:
				<@com.text study.AdministrativeData.JustificationForTypeOfInformation/>
			</td>
		</tr>
	</#if>
</#macro>


<#-- Macros regarding assessment entity -->

<#-- Variable to hold the list of assessment entities -->
<#assign assessmentEntities = [] />

<#-- Variable that flags wheather assessment entities exist or not -->
<#assign assessmentEntitiesExist = false />


<#-- Initialize assessmentEntities list with the different type of assessment entities: RegisteredSubstanceAsSuch, SpecificCompositionOfTheRegisteredSubstance, GroupOfConstituentInTheRegisteredSubstance, TransformationProductOfTheRegisteredSubstance-->
<#macro initAssessmentEntities substance>
	<#local aeList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ASSESSMENT_ENTITY", "RegisteredSubstanceAsSuch") />
	<#assign assessmentEntities = assessmentEntities + aeList/>
	
	<#local aeList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ASSESSMENT_ENTITY", "SpecificCompositionOfTheRegisteredSubstance") />
	<#assign assessmentEntities = assessmentEntities + aeList/>
	
	<#local aeList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ASSESSMENT_ENTITY", "GroupOfConstituentInTheRegisteredSubstance") />
	<#assign assessmentEntities = assessmentEntities + aeList/>
	
	<#local aeList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ASSESSMENT_ENTITY", "TransformationProductOfTheRegisteredSubstance") />
	<#assign assessmentEntities = assessmentEntities + aeList/>
	
	<#assign assessmentEntitiesExist = assessmentEntities?size gt 1 />
</#macro>

<#function getAssessmentEntitiesLinkedToSummary summary>
	<#local aeList = [] />
	<#list assessmentEntities as ae>
		<#local linkedSummaryList = ae.EndpointSummariesList />
		<#if linkedSummaryList?has_content>
			<#list linkedSummaryList as blockItem>
				<#local summaryList = blockItem.Name />
				<#if summaryList?has_content>
					<#list summaryList as sumKey>
						<#if summary.documentKey == sumKey>
							<#local aeList = aeList + [ae] />
						</#if>
					</#list>
				</#if>
			</#list>
		</#if>
	</#list>
	<#return aeList />
</#function>


<#-- Function to order test result repeatable block items according to KeyResult values. KeyResulst should come first -->
<#function orderByKeyResult resultsRepeatableBlock>
	<#local orderedList = resultsRepeatableBlock />
	<#if resultsRepeatableBlock?has_content>
		<#local keyResultList = [] />
		<#local otherResultList = [] />
		<#list resultsRepeatableBlock as result>
			<#if isKeyResult(result) >
				<#local keyResultList = keyResultList + [result] />
			<#else/>
				<#local otherResultList = otherResultList + [result] />
			</#if>
		</#list>
		<#local orderedList = keyResultList + otherResultList />
	</#if>
	<#return orderedList />
</#function>

<#function isKeyResult resultBlockItem>
	<#if resultBlockItem?has_content && resultBlockItem.hasElement("KeyResult") && resultBlockItem.KeyResult >
		<#return true />
	</#if>
	<#return false />
</#function>
