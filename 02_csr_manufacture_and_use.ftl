<!-- 2. MANUFACTURE AND USES template file -->

<!-- record results -->
<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "EstimatedQuantities") />
	
<#if !recordList?has_content>
	No information available on quantities
<#else/>

	<table border="1">
		<title>Quantities (in tonnes/year)</title>
		<title></title>
		<col width="10%" />
		<col width="90%" />
		<tbody>
			<tr>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Year</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Tonnages (tonnes per year)</emphasis></th>
			</tr>
			
			<#list recordList as record>
				<tr>
					<!-- Year -->
					<td>
						<para>
							<@com.number record.Year/>
						</para>
					</td>
					<!-- Tonnages (tonnes per year) -->
					<td>
						<para>
							<#if record.TotalTonnage.Manufacturer?has_content>
							Manufactured: <@com.number record.TotalTonnage.Manufacturer/>
							</#if>
						</para>
						
						<para>
							<#if record.TotalTonnage.Imported?has_content>
							Imported: <@com.number record.TotalTonnage.Imported/>
							</#if>
						</para>
						
						<para>
							<#if record.DetailsTonnage.TonnageDirectlyExported?has_content>
							Directly exported: <@com.number record.DetailsTonnage.TonnageDirectlyExported/>
							</#if>
						</para>
						
						<#if record.DetailsTonnage.TonnageIntermediateOnsite?has_content || record.DetailsTonnage.TonnageIntermediateTransporter?has_content>
							<para><emphasis role="underline">Tonnages of uses exempted from CSR</emphasis></para>
							
							<para>
								Uses as intermediate under strictly controlled conditions (on-site): <@com.number record.DetailsTonnage.TonnageIntermediateOnsite/>
							</para>
							
							<para>
								Used as intermediate under strictly controlled conditions (transported): <@com.number record.DetailsTonnage.TonnageIntermediateTransporter/>
							</para>
						</#if>
						
						<#if record.TonnagesNotificationSubstancesInArticles.TonnageImportedArticles?has_content || record.TonnagesNotificationSubstancesInArticles.TonnageProducedArticles?has_content>
							<para><emphasis role="underline">Tonnages relevant for registration/notification of substances in article</emphasis></para>
							
							<para>
								Imported in articles: <@com.number record.TonnagesNotificationSubstancesInArticles.TonnageImportedArticles/>
							</para>
							
							<para>
								Tonnage in produced articles: <@com.number record.TonnagesNotificationSubstancesInArticles.TonnageProducedArticles/>	
							</para>
						</#if>
					</td>
				</tr>
			</#list>
		</tbody>
	</table>
	<@com.emptyLine/>
	
	<#list recordList as record>
		<#if (record.AdditionalInformation.Remarks?has_content)>:
			<para><@com.number record.Year/>: <@com.text record.AdditionalInformation.Remarks/></para>
		</#if>
	</#list>
</#if>

<!-- No identified uses -->
<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FIXED_RECORD", "NoIdentifiedUses") />
	
<#if recordList?has_content>
	<#list recordList as record>
		<#if (record.JustificationNoIdentified?has_content) || (record.JustificationForNoExposureAssessment?has_content)>
			<@com.emptyLine/>
			<para><emphasis role="bold">No identified uses:</emphasis> <@com.picklist record.JustificationNoIdentified/></para>
			<para>
				- Justification for no exposure assessment: <@com.picklistMultiple record.JustificationForNoExposureAssessment/>
			</para>
		</#if>
		
		<para>Cumulative tonnages:</para>
		
		<para role="indent">
			<itemizedlist mark='bullet'>
				<listitem>
					<#if (record.CumulativeTonnages.CumulativeTonnageForUseAtIndustrialSitesTonnesYear?has_content) 
						|| (record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForUseAtIndustrialSites?has_content) 
						|| (record.CumulativeTonnages.CumulativeEUTonnageForUsesAtIndustrialSites?has_content)>
						
							<#if record.CumulativeTonnages.CumulativeEUTonnageForUsesAtIndustrialSites>
								Cumulative EU tonnage for uses at industrial sites:
							<#else/>
								Cumulative tonnage for uses at industrial sites:
							</#if>
							
							<#if record.CumulativeTonnages.CumulativeTonnageForUseAtIndustrialSitesTonnesYear?has_content>
								<@com.range record.CumulativeTonnages.CumulativeTonnageForUseAtIndustrialSitesTonnesYear/> tonnes/year
							</#if>
							
							<#if record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForUseAtIndustrialSites?has_content>
								(<@com.text record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForUseAtIndustrialSites/>)
							</#if>
					</#if>
				</listitem>
				<listitem>
					<#if record.CumulativeTonnages.CumulativeTonnageForWidespreadUsesByProfessionalWorkersTonnesYear?has_content 
					|| record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForWidespreadUsesByProfessionalWorkers?has_content
					|| record.CumulativeTonnages.CumulativeEUTonnageForWidespreadUsesByProfessionalWorkers?has_content>	
						<#if record.CumulativeTonnages.CumulativeEUTonnageForWidespreadUsesByProfessionalWorkers>
							Cumulative EU tonnage for widespread uses by professional workers:
						<#else/>
							Cumulative tonnage for widespread uses by professional workers:
						</#if>
						
						<#if record.CumulativeTonnages.CumulativeTonnageForWidespreadUsesByProfessionalWorkersTonnesYear?has_content>
							<@com.range record.CumulativeTonnages.CumulativeTonnageForWidespreadUsesByProfessionalWorkersTonnesYear/> tonnes/year
						</#if>
						
						<#if record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForWidespreadUsesByProfessionalWorkers?has_content>
							(<@com.text record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForWidespreadUsesByProfessionalWorkers/>)
						</#if>
					</#if>
				</listitem>
				<listitem>
					<#if record.CumulativeTonnages.CumulativeEUTonnageForWidespreadUsesByProfessionalWorkers?has_content
					|| record.CumulativeTonnages.CumulativeEUTonnageConsumerUses?has_content
					|| record.CumulativeTonnages.CumulativeTonnageForConsumerUsesTonnesYear?has_content
					|| record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForConsumerUses?has_content>
						<#if record.CumulativeTonnages.CumulativeEUTonnageConsumerUses>
							Cumulative EU tonnage for consumer uses:
						<#else/>
							Cumulative tonnage for consumer uses:
						</#if>
						
						<#if record.CumulativeTonnages.CumulativeTonnageForConsumerUsesTonnesYear?has_content>
							<@com.range record.CumulativeTonnages.CumulativeTonnageForConsumerUsesTonnesYear/> tonnes/year
						</#if>
						
						<#if record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForConsumerUses?has_content>
							(<@com.text record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForConsumerUses/>)
						</#if>
					</#if>
				</listitem>
				<listitem>
					<#if record.CumulativeTonnages.CumulativeEUTonnageForServiceLife?has_content 
					|| record.CumulativeTonnages.CumulativeTonnageForServiceLifeTonnesYear?has_content
					|| record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForServiceLife?has_content>
						<#if record.CumulativeTonnages.CumulativeEUTonnageForServiceLife>
							Cumulative EU tonnage for service life:
						<#else/>
							Cumulative tonnage for service life:
						</#if>
						
						<#if record.CumulativeTonnages.CumulativeTonnageForServiceLifeTonnesYear?has_content>
							<@com.range record.CumulativeTonnages.CumulativeTonnageForServiceLifeTonnesYear/> tonnes/year
						</#if>
						
						<#if record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForServiceLife?has_content>
							(<@com.text record.CumulativeTonnages.DetailsOnCumulativeTonnageReportedForServiceLife/>)
						</#if>
					</#if>
				</listitem>
			</itemizedlist>
		</para>
	</#list>
</#if>

<#--TODO: Table 2. Overview on uses -->
<#assign csrType = estimateCsrType() />

<!-- 2.1. Manufacture -->

<@com.emptyLine/>
<section>	
	<title role="HEAD-2">Manufacture</title>
	
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "Manufacturer"), csrType, "Manufacture") />
			
	<#if !recordList?has_content>
		No information available on manufacture. 
		<@com.emptyLine/>
	<#else/>
		<table border="1">
			<title>Manufacture</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Manufacture</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								M-<@com.number record.Manufacture.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Manufacture -->
						<td>
							<#if isConfidentialityCBI(record.Manufacture.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.Manufacture.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.Manufacture.RelatedComposition?has_content>
								Manufactured composition (see section 1.x): <@com.documentReferenceMultiple record.Manufacture.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of manufacturing process: </emphasis>
								<@com.richText record.Manufacture.Description/>
							</para>
							
							<#if !isUseAccordingToArticle1718(record.Manufacture.RegistrationNotificationStatusForTheUse)>
								<para>
									Contributing activity/technique for the environment
									<#if record.Manufacture.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithMinimisationOfReleaseToTheEnvironment>
										(Rigorously contained system with minimisation of release to the environment)
									</#if>:
								</para>
								<@contributingActivityEnvironmentList record.Manufacture.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers
									<#if record.Manufacture.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithStrictControlForManualInterventions>
										(Rigorously contained system with strict control for manual interventions)
									</#if>:
								</para>
								<@contributingActivityWorkersList record.Manufacture.ContributingActivityTechniqueForWorkers/>
							</#if>
							
							<para>
								<@com.picklist record.Manufacture.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.Manufacture.TonnageSubstance?has_content || record.Manufacture.TotalEUTonnageForThisUse?has_content>
								<para>
									Tonnage of substance for that use: <@com.range record.Manufacture.TonnageSubstance/> tonnes/year
									<#if record.Manufacture.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.Manufacture.DetailsOnTonnageReported/>
							</para>
							
							<para>
								<emphasis>Related assessment: <@com.picklist record.Manufacture.UseCoverageInCSR/></emphasis>
							</para>
							
							<#if record.Manufacture.Remarks?has_content>
								<para>
									<emphasis role="underline">Remarks:</emphasis> <@com.richText record.Manufacture.Remarks/>
								</para>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
	
</section>

<!-- 2.2. Identified uses -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Identified uses</title>
	
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "Formulation"), csrType, "Formulation") />
	
	<#if !recordList?has_content>
	No information available on identified uses.
	<@com.emptyLine/>
	<#else/>
		<table border="1">
			<title>Formulation</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Formulation</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								F-<@com.number record.Formulation.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Formulation -->
						<td>
							<#if isConfidentialityCBI(record.Formulation.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.Formulation.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.Formulation.RelatedComposition?has_content>
								Related composition (see section 1.2): <@com.documentReferenceMultiple record.Formulation.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of the use:</emphasis>
								<@com.richText record.Formulation.Description/>
							</para>
							
							<#if !isUseAccordingToArticle1718(record.Formulation.RegistrationNotificationStatusForTheUse)>
								<para>
									Contributing activity/technique for the environment
									<#if record.Formulation.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithMinimisationOfReleaseToTheEnvironment>
										(Rigorously contained system with minimisation of release to the environment)
									</#if>:
								</para>
								<@contributingActivityEnvironmentList record.Formulation.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers
									<#if record.Formulation.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithStrictControlForManualInterventions>
										(Rigorously contained system with strict control for manual interventions)
									</#if>:
								</para>
								<@contributingActivityWorkersList record.Formulation.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.Formulation.ProductCategories?has_content>
									<emphasis role="bold">Product Category formulated: </emphasis>
									<@useDescriptorPicklistMultipleValue record.Formulation.ProductCategories/>
									</#if>
								</para>
								
								<para>
									<#if record.Formulation.TechnicalFunctions?has_content>
									<emphasis role="bold">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.Formulation.TechnicalFunctions/>
									</#if>
								</para>
							</#if>
							
							<para>
								<@com.picklist record.Formulation.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.Formulation.TonnageSubstance?has_content || record.Formulation.TotalEUTonnageForThisUse?has_content>	
								<para>
									Tonnage of substance for that use: <@com.range record.Formulation.TonnageSubstance/> tonnes/year
									<#if record.Formulation.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.Formulation.DetailsOnTonnageReported/>
							</para>
							
							<#if record.Formulation.NumSitesRange>
								<para>
									Limited number of sites: <@com.text record.Formulation.DetailsOnLimitedNumberOfSites/>
								</para>
							</#if>
							
							<para>
								Substance supplied to that use: <@com.picklistMultiple record.Formulation.UseInForms/>
							</para>
							
							<#if record.Formulation.Remarks?has_content>
								<para>
									Remarks: <@com.richText record.Formulation.Remarks/>
								</para>
							</#if>
							
							<para>
								<emphasis>Related assessment: <@com.picklist record.Formulation.UseCoverageInCSR/></emphasis>
							</para>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
	
	
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "UseAtIndustrialSites"), csrType, "UsesAtIndustrialSites") />
	
	<#if recordList?has_content>
		<@com.emptyLine/>
		<table border="1">
			<title>Uses at industrial sites</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Uses at industrial sites</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								IW-<@com.number record.UsesAtIndustrialSites.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Uses at industrial sites -->
						<td>
							<#if isConfidentialityCBI(record.UsesAtIndustrialSites.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.UsesAtIndustrialSites.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.UsesAtIndustrialSites.RelatedComposition?has_content>
								Related composition (see section 1.2): <@com.documentReferenceMultiple record.UsesAtIndustrialSites.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of the use:</emphasis>
								<@com.richText record.UsesAtIndustrialSites.Description/>
							</para>
							
							<#if !isUseAccordingToArticle1718(record.UsesAtIndustrialSites.RegistrationNotificationStatusForTheUse)>
								<para>
									Contributing activity/technique for the environment
									<#if record.UsesAtIndustrialSites.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithMinimisationOfReleaseToTheEnvironment>
										(Rigorously contained system with minimisation of release to the environment)
									</#if>:
								</para>
								<@contributingActivityEnvironmentList record.UsesAtIndustrialSites.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers
									<#if record.UsesAtIndustrialSites.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithStrictControlForManualInterventions>
										(Rigorously contained system with strict control for manual interventions)
									</#if>:
								</para>
								<@contributingActivityWorkersList record.UsesAtIndustrialSites.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.UsesAtIndustrialSites.ProductCategories?has_content>
									<emphasis role="bold">Product Category used:	</emphasis>								
									<@useDescriptorPicklistMultipleValue record.UsesAtIndustrialSites.ProductCategories/>
									</#if>
								</para>
								
								<para>
									<#if record.UsesAtIndustrialSites.SectorUses?has_content>
									<emphasis role="bold">Sector of end use: </emphasis>	
									<@useDescriptorPicklistMultipleValue record.UsesAtIndustrialSites.SectorUses/>
									</#if>
								</para>
								
								<para>
									<#if record.UsesAtIndustrialSites.TechnicalFunctions?has_content>
									<emphasis role="bold">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.UsesAtIndustrialSites.TechnicalFunctions/>
									</#if>
								</para>
							</#if>
							
							<para>
								<@com.picklist record.UsesAtIndustrialSites.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.UsesAtIndustrialSites.RegulatoryStatus?has_content || record.UsesAtIndustrialSites.ExplanationForTheRegulatoryStatus?has_content>
								<para>
									Regulatory status: <@com.picklistMultiple record.UsesAtIndustrialSites.RegulatoryStatus/>.
									<emphasis><@com.text record.UsesAtIndustrialSites.ExplanationForTheRegulatoryStatus/></emphasis>
								</para>
							</#if>
							
							<#if record.UsesAtIndustrialSites.TonnageSubstance?has_content || record.UsesAtIndustrialSites.TotalEUTonnageForThisUse?has_content>
								<para>
									Tonnage of substance for that use: <@com.range record.UsesAtIndustrialSites.TonnageSubstance/> tonnes/year
									<#if record.UsesAtIndustrialSites.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.UsesAtIndustrialSites.DetailsOnTonnageReported/>
							</para>
							
							<#if record.UsesAtIndustrialSites.NumSitesRange>
								<para>
									Limited number of sites: <@com.text record.UsesAtIndustrialSites.DetailsOnLimitedNumberOfSites/>
								</para>
							</#if>
							
							<para>
								Substance supplied to that use: <@com.picklistMultiple record.UsesAtIndustrialSites.UseInForms/>
							</para>
							
							<para>
								<#if record.UsesAtIndustrialSites.SubServiceLifeRelevant?has_content>
								Subsequent service life relevant for that use: <@com.picklist record.UsesAtIndustrialSites.SubServiceLifeRelevant/>
								</#if>
								<?linebreak?>
								<#if record.UsesAtIndustrialSites.LinkSubsequentServiceLife?has_content>
								Link to the subsequent service life: <@com.documentReferenceMultiple record.UsesAtIndustrialSites.LinkSubsequentServiceLife/>
								</#if>
							</para>
							
							<#if record.UsesAtIndustrialSites.Remarks?has_content>
								<para>
									Remarks: <@com.richText record.UsesAtIndustrialSites.Remarks/>
								</para>
							</#if>
							
							<#if record.UsesAtIndustrialSites.UseCoverageInCSR?has_content>
								<para>
									<emphasis>Related assessment: <@com.picklist record.UsesAtIndustrialSites.UseCoverageInCSR/></emphasis>
								</para>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
	
	
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ProfessionalWorkers"), csrType, "UsesByProfessionalWorkers") />
	
	<#if recordList?has_content>
		<@com.emptyLine/>
		<table border="1">
			<title>Uses by professional workers</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Uses by professional workers</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								PW-<@com.number record.UsesByProfessionalWorkers.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Uses by professional workers -->
						<td>
							<#if isConfidentialityCBI(record.UsesByProfessionalWorkers.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.UsesByProfessionalWorkers.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.UsesByProfessionalWorkers.RelatedComposition?has_content>
								Related composition (see section 1.2): <@com.documentReferenceMultiple record.UsesByProfessionalWorkers.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of the use:</emphasis>
								<@com.richText record.UsesByProfessionalWorkers.Description/>
							</para>
							
							<#if !isUseAccordingToArticle1718(record.UsesByProfessionalWorkers.RegistrationNotificationStatusForTheUse)>
								<para>
									Contributing activity/technique for the environment
									<#if record.UsesByProfessionalWorkers.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithMinimisationOfReleaseToTheEnvironment>
										(Rigorously contained system with minimisation of release to the environment)
									</#if>:
								</para>
								<@contributingActivityEnvironmentList record.UsesByProfessionalWorkers.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers
									<#if record.UsesByProfessionalWorkers.UseTakesPlaceUnderRigorouslyContainedConditions.RigorouslyContainedSystemWithStrictControlForManualInterventions>
										(Rigorously contained system with strict control for manual interventions)
									</#if>:
								</para>
								<@contributingActivityWorkersList record.UsesByProfessionalWorkers.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.UsesByProfessionalWorkers.ProductCategories?has_content>
									<emphasis role="bold">Product Category used:	</emphasis>								
									<@useDescriptorPicklistMultipleValue record.UsesByProfessionalWorkers.ProductCategories/>
									</#if>
								</para>
								
								<para>
									<#if record.UsesByProfessionalWorkers.SectorUses?has_content>
									<emphasis role="bold">Sector of end use: </emphasis>		
									<@useDescriptorPicklistMultipleValue record.UsesByProfessionalWorkers.SectorUses/>
									</#if>
								</para>
								
								<para>
									<#if record.UsesByProfessionalWorkers.TechnicalFunctions?has_content>
									<emphasis role="bold">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.UsesByProfessionalWorkers.TechnicalFunctions/>
									</#if>
								</para>
							</#if>
							
							<para>
								<@com.picklist record.UsesByProfessionalWorkers.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.UsesByProfessionalWorkers.RegulatoryStatus?has_content || record.UsesByProfessionalWorkers.ExplanationForTheRegulatoryStatus?has_content>
								<para>
									Regulatory status: <@com.picklistMultiple record.UsesByProfessionalWorkers.RegulatoryStatus/>.
									<emphasis><@com.text record.UsesByProfessionalWorkers.ExplanationForTheRegulatoryStatus/></emphasis>
								</para>
							</#if>
								
							<#if record.UsesByProfessionalWorkers.TonnageSubstance?has_content || record.UsesByProfessionalWorkers.TotalEUTonnageForThisUse?has_content>
								<para>
									Tonnage of substance for that use: <@com.range record.UsesByProfessionalWorkers.TonnageSubstance/> tonnes/year
									<#if record.UsesByProfessionalWorkers.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.UsesByProfessionalWorkers.DetailsOnTonnageReported/>
							</para>
							
							<para>
								<#if record.UsesByProfessionalWorkers.SubServiceLifeRelevant?has_content>
								Subsequent service life relevant for that use: <@com.picklist record.UsesByProfessionalWorkers.SubServiceLifeRelevant/>
								</#if>
								<?linebreak?>
								<#if record.UsesByProfessionalWorkers.LinkSubsequentServiceLife?has_content>
								Link to the subsequent service life: <@com.documentReferenceMultiple record.UsesByProfessionalWorkers.LinkSubsequentServiceLife/>
								</#if>
							</para>
							
							<#if record.UsesByProfessionalWorkers.Remarks?has_content>
								<para>
									Remarks: <@com.richText record.UsesByProfessionalWorkers.Remarks/>
								</para>
							</#if>
							
							<#if record.UsesByProfessionalWorkers.UseCoverageInCSR?has_content>
								<para>
									<emphasis>Related assessment: <@com.picklist record.UsesByProfessionalWorkers.UseCoverageInCSR/></emphasis>
								</para>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
	
	
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ConsumerUses"), csrType, "ConsumerUses") />
	
	<#if recordList?has_content>
		<@com.emptyLine/>
		<table border="1">
			<title>Consumer uses</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Consumer uses</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								C-<@com.number record.ConsumerUses.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Consumer uses -->
						<td>
							<#if isConfidentialityCBI(record.ConsumerUses.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.ConsumerUses.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.ConsumerUses.RelatedComposition?has_content>
								Related composition (see section 1.2): <@com.documentReferenceMultiple record.ConsumerUses.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of the use:</emphasis>
								<@com.richText record.ConsumerUses.Description/>
							</para>
							
							<#if !isUseAccordingToArticle1718(record.ConsumerUses.RegistrationNotificationStatusForTheUse)>
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ConsumerUses.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for consumers:
								</para>
								<@contributingActivityConsumersList record.ConsumerUses.ContributingActivityTechniqueForConsumers/>
								
								<para>
									<#if record.ConsumerUses.TechnicalFunctions?has_content>
									<emphasis role="bold">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.ConsumerUses.TechnicalFunctions/>
									</#if>
								</para>
							</#if>
							
							<para>
								<@com.picklist record.ConsumerUses.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.ConsumerUses.RegulatoryStatus?has_content || record.ConsumerUses.ExplanationForTheRegulatoryStatus?has_content>
								<para>
									Regulatory status: <@com.picklistMultiple record.ConsumerUses.RegulatoryStatus/>.
									<emphasis><@com.text record.ConsumerUses.ExplanationForTheRegulatoryStatus/></emphasis>
								</para>
							</#if>
							
							<#if record.ConsumerUses.TonnageSubstance?has_content || record.ConsumerUses.TotalEUTonnageForThisUse?has_content>
								<para>
									Tonnage of substance for that use: <@com.range record.ConsumerUses.TonnageSubstance/> tonnes/year
									<#if record.ConsumerUses.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.ConsumerUses.DetailsOnTonnageReported/>
							</para>
							
							<para>
								<#if record.ConsumerUses.SubServiceLifeRelevant?has_content>
								Subsequent service life relevant for that use: <@com.picklist record.ConsumerUses.SubServiceLifeRelevant/>
								</#if>
								<?linebreak?>
								<#if record.ConsumerUses.LinkSubsequentServiceLife?has_content>
								Link to the subsequent service life: <@com.documentReferenceMultiple record.ConsumerUses.LinkSubsequentServiceLife/>
								</#if>
							</para>
							
							<#if record.ConsumerUses.Remarks?has_content>
								<para>
									Remarks: <@com.richText record.ConsumerUses.Remarks/>
								</para>
							</#if>
								
							<#if record.ConsumerUses.UseCoverageInCSR?has_content>	
								<para>
									<emphasis>Related assessment: <@com.picklist record.ConsumerUses.UseCoverageInCSR/></emphasis>
								</para>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
		
	<#assign recordList = filterForCsrType(iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ArticleServiceLife"), csrType, "ArticleServiceLife") />
	
	<#if recordList?has_content>
		<@com.emptyLine/>
		<table border="1">
			<title>Article service life</title>
			<col width="10%" />
			<col width="90%" />
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Article service life</emphasis></th>
				</tr>
				
				<#list recordList as record>
					<tr>
						<!-- empty -->
						<td>
							<para>
								SL-<@com.number record.ArticleServiceLife.IdentifiedUseNumber/>
							</para>
						</td>
						<!-- Article service life -->
						<td>
							<#if isConfidentialityCBI(record.ArticleServiceLife.DataProtection)>
								<para>Confidential:</para>
							</#if>
							
							<para>
								<emphasis role="bold"><@com.text record.ArticleServiceLife.IdentifiedUseName/></emphasis>
							</para>
							
							<para>
								<#if record.ArticleServiceLife.RelatedComposition?has_content>
								Related composition (see section 1.2): <@com.documentReferenceMultiple record.ArticleServiceLife.RelatedComposition/>
								</#if>
							</para>
							
							<para>
								<emphasis role="underline">Further description of the use:</emphasis>
								<@com.richText record.ArticleServiceLife.Description/>
							</para>
							
							<#-- TODO inconsistent IUCLID structure and specs -->
							
							<#if !isUseAccordingToArticle1718(record.ArticleServiceLife.RegistrationNotificationStatusForTheUse)>
								<para>
									Article used by: <@com.picklistMultiple	record.ArticleServiceLife.ArticleUsedBy/>
								</para>
								
								<para>
									Substance intended to be released from article: <@com.picklist record.ArticleServiceLife.SubstanceIntendedToBeReleasedFromArticle/>
								</para>
								
								<para>
									<emphasis role="bold">Article category related to subsequent service life (AC):</emphasis> <@useDescriptorPicklistMultipleValue record.ArticleServiceLife.ArticleCategories/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ArticleServiceLife.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for consumers:
								</para>
								<@contributingActivityServiceLifeList record.ArticleServiceLife.ContributingActivityTechniqueForConsumers/>
								
								<para>
									Contributing activity/technique for the workers:
								</para>
								<@contributingActivityWorkersList record.ArticleServiceLife.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.ArticleServiceLife.TechnicalFunctions?has_content>
									<emphasis role="bold">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.ArticleServiceLife.TechnicalFunctions/>
									</#if>
								</para>
							</#if>
							
							<para>
								<@com.picklist record.ArticleServiceLife.RegistrationNotificationStatusForTheUse/>
							</para>
							
							<#if record.ArticleServiceLife.RegulatoryStatus?has_content || record.ArticleServiceLife.ExplanationForTheRegulatoryStatus?has_content>
								<para>
									Regulatory status: <@com.picklistMultiple record.ArticleServiceLife.RegulatoryStatus/>.
									<emphasis><@com.text record.ArticleServiceLife.ExplanationForTheRegulatoryStatus/></emphasis>
								</para>
							</#if>
							
							<#if record.ArticleServiceLife.TonnageSubstance?has_content || record.ArticleServiceLife.TotalEUTonnageForThisUse?has_content>
								<para>
									Tonnage of substance for that use: <@com.range record.ArticleServiceLife.TonnageSubstance/> tonnes/year
									<#if record.ArticleServiceLife.TotalEUTonnageForThisUse>(EU tonnage)</#if> 
								</para>
							</#if>
							
							<para>
								<@com.text record.ArticleServiceLife.DetailsOnTonnageReported/>
							</para>
							
							<#if record.ArticleServiceLife.Remarks?has_content>
								<para>
									Remarks: <@com.richText record.ArticleServiceLife.Remarks/>
								</para>
							</#if>
							
							<#if record.ArticleServiceLife.UseCoverageInCSR?has_content>
								<para>
									<emphasis>Related assessment: <@com.picklist record.ArticleServiceLife.UseCoverageInCSR/></emphasis>
								</para>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</#if>
	
</section>

<!-- 2.3. Uses advised against -->

<#assign recordList1 = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "FormulationUsesAdvisedAgainst") />
<#assign recordList2 = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "UseAtIndustrialSitesAdvisedAgainst") />
<#assign recordList3 = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ProfessionalWorkersAdvisedAgainst") />
<#assign recordList4 = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ConsumerUsesAdvisedAgainst") />
<#assign recordList5 = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ArticleServiceLifeAdvisedAgainst") />

<#if (recordList1?has_content) || (recordList2?has_content) || (recordList3?has_content) || (recordList4?has_content) || (recordList5?has_content)>

<@com.emptyLine/>
	<section>
			
		<title role="HEAD-2">Uses advised against</title>
		
		<#--TODO: inconsistent specs and IUCLID data structure -->
		
		<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "FormulationUsesAdvisedAgainst") />
		
		<#if recordList?has_content>
			<table border="1">
				<title>Formulation advised against</title>
				<col width="10%" />
				<col width="90%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Formulation advised against</emphasis></th>
					</tr>
					
					<#list recordList as record>
						<tr>
							<!-- empty -->
							<td>
								<para>
									F-<@com.number record.IdentifiedUseNumber/>
								</para>
							</td>
							<!-- Formulation -->
							<td>
								<#if isConfidentialityCBI(record.DataProtection)>
									<para>Confidential:</para>
								</#if>
								
								<para>
									<emphasis role="bold"><@com.text record.IdentifiedUseName/></emphasis>
								</para>
								
								<para>
									<emphasis role="underline">Further description of the use:</emphasis>
									<@com.richText record.Description/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers:
								</para>
								<@contributingActivityWorkersList record.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.ProductCategories?has_content>
									<emphasis role="underline">Product Category formulated: </emphasis>
									<@useDescriptorPicklistMultipleValue record.ProductCategories/>
									</#if>
								</para>
								
								<para>
									<#if record.TechnicalFunctions?has_content>
									<emphasis role="underline">Technical function of the substance: </emphasis>
									<@com.picklistMultiple record.TechnicalFunctions/>
									</#if>
								</para>
										
								<#if record.Remarks?has_content>
									<para>
										Remarks: <@com.richText record.Remarks/>
									</para>
								</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
		</#if>
		
		
		<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "UseAtIndustrialSitesAdvisedAgainst") />
		
		<#if recordList?has_content>
			<@com.emptyLine/>
			<table border="1">
				<title>Uses at industrial sites advised against</title>
				<col width="10%" />
				<col width="90%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Uses at industrial sites advised against</emphasis></th>
					</tr>
					
					<#list recordList as record>
						<tr>
							<!-- empty -->
							<td>
								<para>
									IW-<@com.number record.IdentifiedUseNumber/>
								</para>
							</td>
							<!-- Uses at industrial sites -->
							<td>
								<#if isConfidentialityCBI(record.DataProtection)>
									<para>Confidential:</para>
								</#if>
								
								<para>
									<emphasis role="bold"><@com.text record.IdentifiedUseName/></emphasis>
								</para>
								
								<para>
									<emphasis role="underline">Further description of the use:</emphasis>
									<@com.richText record.Description/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers:
								</para>
								<@contributingActivityWorkersList record.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.ProductCategories?has_content>
									<para><emphasis role="underline">Product Category used: </emphasis></para>
									<@useDescriptorPicklistMultipleValue record.ProductCategories/>
									</#if>
								</para>
								
								<para>
									<#if record.TechnicalFunctions?has_content>
									<para><emphasis role="underline">Technical function of the substance: </emphasis></para>
									<@com.picklistMultiple record.TechnicalFunctions/>
									</#if>
								</para>
								
								<#if record.Remarks?has_content>
									<para>
										Remarks: <@com.richText record.Remarks/>
									</para>
								</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
		</#if>	
		
		<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ProfessionalWorkersAdvisedAgainst") />
		
		<#if recordList?has_content>
			<@com.emptyLine/>
			<table border="1">
				<title>Uses by professional workers advised against</title>
				<col width="10%" />
				<col width="90%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Uses by professional workers advised against</emphasis></th>
					</tr>
					
					<#list recordList as record>
						<tr>
							<!-- empty -->
							<td>
								<para>
									PW-<@com.number record.IdentifiedUseNumber/>
								</para>
							</td>
							<!-- Uses by professional workers -->
							<td>
								<#if isConfidentialityCBI(record.DataProtection)>
									<para>Confidential:</para>
								</#if>
								
								<para>
									<emphasis role="bold"><@com.text record.IdentifiedUseName/></emphasis>
								</para>
								
								<para>
									<emphasis role="underline">Further description of the use:</emphasis>
									<@com.richText record.Description/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for the workers:
								</para>
								<@contributingActivityWorkersList record.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<emphasis role="underline">Product Category: </emphasis>
									<@useDescriptorPicklistMultipleValue record.ProductCategories/>
								</para>
								
								<para>
									<#if record.SectorUses?has_content>
									<emphasis role="underline">Sector of end use: </emphasis>
									<@useDescriptorPicklistMultipleValue record.SectorUses/>
									</#if>
								</para>
								
								<para>
									<#if record.TechnicalFunctions?has_content>
									<para><emphasis role="underline">Technical function of the substance: </emphasis></para>
									<@com.picklistMultiple record.TechnicalFunctions/>
									</#if>
								</para>
								
								<#if record.Remarks?has_content>
									<para>
										Remarks: <@com.richText record.Remarks/>
									</para>
								</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
		</#if>
		
		<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ConsumerUsesAdvisedAgainst") />
		
		<#if recordList?has_content>
			<@com.emptyLine/>
			<table border="1">
				<title>Consumer uses advised against</title>
				<col width="10%" />
				<col width="90%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Consumer uses advised against</emphasis></th>
					</tr>
					
					<#list recordList as record>
						<tr>
							<!-- empty -->
							<td>
								<para>
									C-<@com.number record.IdentifiedUseNumber/>
								</para>
							</td>
							<!-- Consumer uses -->
							<td>
								<#if isConfidentialityCBI(record.DataProtection)>
									<para>Confidential:</para>
								</#if>
								
								<para>
									<emphasis role="bold"><@com.text record.IdentifiedUseName/></emphasis>
								</para>
								
								<para>
									<emphasis role="underline">Further description of the use:</emphasis>
									<@com.richText record.Description/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for consumers:
								</para>
								<@contributingActivityConsumersList record.ContributingActivityTechniqueForConsumers/>
								
								<para>
									<#if record.TechnicalFunctions?has_content>
									Technical function of the substance:
									<@com.picklistMultiple record.TechnicalFunctions/>
									</#if>
								</para>
								
								<#if record.Remarks?has_content>
									<para>
										Remarks: <@com.richText record.Remarks/>
									</para>
								</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
		</#if>
		
		
		<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ArticleServiceLifeAdvisedAgainst") />
		
		<#if recordList?has_content>
			<@com.emptyLine/>
			<table border="1">
				<title>Article service life advised against</title>
				<col width="10%" />
				<col width="90%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Article service life advised against</emphasis></th>
					</tr>
					
					<#list recordList as record>
						<tr>
							<!-- empty -->
							<td>
								<para>
									SL-<@com.number record.IdentifiedUseNumber/>
								</para>
							</td>
							<!-- Article service life -->
							<td>
								<#if isConfidentialityCBI(record.DataProtection)>
									<para>Confidential:</para>
								</#if>
								
								<para>
									<emphasis role="bold"><@com.text record.IdentifiedUseName/></emphasis>
								</para>
								
								<para>
									<emphasis role="underline">Further description of the use:</emphasis>
									<@com.richText record.Description/>
								</para>
								
								<para>
									Article used by: <@com.picklistMultiple	record.ArticleUsedBy/>
								</para>
								
								<para>
									Substance intended to be released from article: <@com.picklist record.SubstanceIntendedToBeReleasedFromArticle/>
								</para>
								
								<para>
									<emphasis role="bold">Article category related to subsequent service life (AC):</emphasis> <@useDescriptorPicklistMultipleValue record.ArticleCategories/>
								</para>
								
								<para>
									Contributing activity/technique for the environment:
								</para>
								<@contributingActivityEnvironmentList record.ContributingActivityTechniqueForTheEnvironment/>
								
								<para>
									Contributing activity/technique for consumers:
								</para>
								<@contributingActivityServiceLifeList record.ContributingActivityTechniqueForConsumers/>
								
								<para>
									Contributing activity/technique for the workers:
								</para>
								<@contributingActivityWorkersList record.ContributingActivityTechniqueForWorkers/>
								
								<para>
									<#if record.TechnicalFunctions?has_content>
									Technical function of the substance:
									<@com.picklistMultiple record.TechnicalFunctions/>
									</#if>
								</para>
								
								<#if record.Remarks?has_content>
									<para>
										Remarks: <@com.richText record.Remarks/>
									</para>
								</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
			<@com.emptyLine/>
		</#if>
	
	</section>

</#if>


<!-- Macros and functions -->

<#function isConfidentialityCBI dataProtection>
	<#if !(dataProtection.confidentiality?has_content)>
		<#return false>
	</#if>
	<#-- Phrase code for "CBI" is 2732 -->
	<#if dataProtection.confidentiality == "2732">
		<#return true>
	</#if>
	<#return false>
</#function>

<#function isUseAccordingToArticle1718 registrationStatus>
	<#if com.picklistValueMatchesPhrases(registrationStatus, ["use registered according to REACH Article 17/18"])>
		<#return true>
	</#if>
	<#return false>
</#function>

<#macro contributingActivityEnvironmentList contributingActivityEnvironmentRepeatableBlock>
<#compress>
	<#if contributingActivityEnvironmentRepeatableBlock?has_content>
		<#list contributingActivityEnvironmentRepeatableBlock as blockItem>			
			<para role="indent">
				<emphasis role="bold">
				<#if blockItem.NameOfActivityTechnique?has_content && !(blockItem.EnvironmentalReleaseCategoryERC?has_content)>
				- <@com.text blockItem.NameOfActivityTechnique/>
				<#elseif !(blockItem.NameOfActivityTechnique)?has_content && blockItem.EnvironmentalReleaseCategoryERC?has_content>
				- <@com.picklistMultiple blockItem.EnvironmentalReleaseCategoryERC/>
				<#elseif blockItem.NameOfActivityTechnique?has_content && blockItem.EnvironmentalReleaseCategoryERC?has_content>
				- <@com.text blockItem.NameOfActivityTechnique/> (<@useDescriptorCodeList blockItem.EnvironmentalReleaseCategoryERC/>)
				</#if>
				</emphasis>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro useDescriptorCodeList picklistMultipleValue>
<#compress>
	<#if picklistMultipleValue?has_content>
		<#list picklistMultipleValue as item>
			<#local picklistText><@com.picklist item "en" true/></#local>
			
			<#if picklistText?has_content>
				<#-- the use descriptor code is the text before ':' -->
				<#local codeEndIdx = picklistText?index_of(":") />
				<#if codeEndIdx gt 0>
					${picklistText?substring(0, codeEndIdx)}
				</#if>
			</#if>
			<#if item_has_next>; </#if>
		</#list>
	</#if>
</#compress>
</#macro>


<#macro useDescriptorPicklistMultipleValue picklistMultipleValue>
<#compress>
	<#if picklistMultipleValue?has_content>
		<#list picklistMultipleValue as item>
			<@com.picklist item "en" true/>
			<#if item_has_next>; </#if>
		</#list>
	</#if>
</#compress>
</#macro>


<#macro contributingActivityWorkersList contributingActivityWorkersRepeatableBlock>
<#compress>
	<#if contributingActivityWorkersRepeatableBlock?has_content>
		<#list contributingActivityWorkersRepeatableBlock as blockItem>
			<para role="indent">
				<emphasis role="bold">
				<#if blockItem.NameOfActivityTechnique?has_content && !(blockItem.ProcessCategoryPROC?has_content)>
				- <@com.text blockItem.NameOfActivityTechnique/>
				<#elseif !(blockItem.NameOfActivityTechnique)?has_content && blockItem.ProcessCategoryPROC?has_content>
				- <@com.picklistMultiple blockItem.ProcessCategoryPROC/>
				<#elseif blockItem.NameOfActivityTechnique?has_content && blockItem.ProcessCategoryPROC?has_content>
				- <@com.text blockItem.NameOfActivityTechnique/> (<@useDescriptorCodeList blockItem.ProcessCategoryPROC/>)
				</#if>
				</emphasis>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro contributingActivityConsumersList contributingActivityConsumersRepeatableBlock>
<#compress>
	<#if contributingActivityConsumersRepeatableBlock?has_content>
		<#list contributingActivityConsumersRepeatableBlock as blockItem>
			<para role="indent">
				<emphasis role="bold">
				<#if blockItem.NameOfActivityTechnique?has_content && !(blockItem.ProductCategoryPC?has_content)>
				- <@com.text blockItem.NameOfActivityTechnique/>
				<#elseif !(blockItem.NameOfActivityTechnique)?has_content && blockItem.ProductCategoryPC?has_content>
				- <@com.picklistMultiple blockItem.ProductCategoryPC/>
				<#elseif blockItem.NameOfActivityTechnique?has_content && blockItem.ProductCategoryPC?has_content>
				- <@com.text blockItem.NameOfActivityTechnique/> (<@useDescriptorCodeList blockItem.ProductCategoryPC/>)
				</#if>
				</emphasis>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro contributingActivityServiceLifeList contributingActivityServiceLifeRepeatableBlock>
<#compress>
	<#if contributingActivityServiceLifeRepeatableBlock?has_content>
		<#list contributingActivityServiceLifeRepeatableBlock as blockItem>
			<para role="indent">
				<emphasis role="bold">
				<#if blockItem.NameOfActivityTechnique?has_content && !(blockItem.ArticleCategoryAC?has_content)>
				- <@com.text blockItem.NameOfActivityTechnique/>
				<#elseif !(blockItem.NameOfActivityTechnique)?has_content && blockItem.ArticleCategoryAC?has_content>
				- <@com.picklistMultiple blockItem.ArticleCategoryAC/>
				<#elseif blockItem.NameOfActivityTechnique?has_content && blockItem.ArticleCategoryAC?has_content>
				- <@com.text blockItem.NameOfActivityTechnique/> (<@useDescriptorCodeList blockItem.ArticleCategoryAC/>)
				</#if>
				</emphasis>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#function estimateCsrType>
	<#-- Check if external parameter was specified by Chesar -->
	<#if extension?has_content && extension.csaType?has_content>
		<#local csaTypeParam = extension.csaType[0] />
		<#if csaTypeParam == "joint">
			<#return "Joint CSR (joint uses)" />
		</#if>
		<#return "Own CSR (own uses)" />
	</#if>

	<#-- Use picklist from section 13.1 Chemical Safety Report (Part A) if not external parameter --> 
	<#local recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "ChemicalSafetyReport") />
	<#if !recordList?has_content || recordList?size <= 0 >
		<#return "CSR (all uses)" />
	</#if>

	<#local record = recordList[0] />
	<#local picklistValue>
		<@com.picklist record.CSR.TypeOfCSR/>
	</#local>
	<#if !picklistValue?has_content>
		<#return "CSR (all uses)" />
	</#if>
	<#return picklistValue />
</#function>

<#function filterForCsrType uses csrType path>
	<#assign filteredUses = [] />
	<#switch csrType>
		<#case "CSR (all uses)">
			<#assign filteredUses = uses />
			<#break>
		<#case "Own CSR (own uses)">
			<#list uses as use>
            	<#if com.picklistValueMatchesPhrases(("use." + path + ".UseCoverageInCSR")?eval, ["use assessed in an own CSR", "use not assessed"]) >
					<#assign filteredUses = filteredUses + [use] />
				</#if>
			</#list>
			<#break>
		<#case "Own CSR initially prepared jointly within the consortium">
			<#list uses as use>
            	<#if com.picklistValueMatchesPhrases(("use." + path + ".UseCoverageInCSR")?eval, ["use assessed in an own CSR", "use not assessed"]) >
					<#assign filteredUses = filteredUses + [use] />
				</#if>
			</#list>
			<#break>
		<#case "Joint CSR (joint uses)">
			<#list uses as use>
				<#if com.picklistValueMatchesPhrases(("use." + path + ".UseCoverageInCSR")?eval, ["use assessed in a joint CSR", "use assessed in a joint CSR but not a lead’s own use"]) >
					<#assign filteredUses = filteredUses + [use] />
				</#if>
			</#list>
			<#break>
		<#default>
		<#-- should never get in here-->
		<#assign filteredUses = uses />
	</#switch>
	<#return filteredUses />
</#function>