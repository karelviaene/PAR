<!-- 5.11. Derivation of DNEL(s) and other hazard conclusions -->

	<title role="HEAD-2">Derivation of DNEL(s) and other hazard conclusions</title>

	<!-- 5.11.1. Overview of typical dose descriptors for all endpoints -->
	<section>
		<title role="HEAD-3">Overview of typical dose descriptors for all endpoints</title>

		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "AcuteToxicity") />
		<#assign summaryList1 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "IrritationCorrosion") />
		<#assign summaryList2 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Sensitisation") />
		<#assign summaryList3 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "RepeatedDoseToxicity") />
		<#assign summaryList4 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "GeneticToxicity") />
		<#assign summaryList5 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "Carcinogenicity") />
		<#assign summaryList6 = (summaryList) />
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "ToxicityToReproduction") />
		<#assign summaryList7 = (summaryList) />

		<#if !(summaryList1?has_content) && !(summaryList2?has_content) && !(summaryList3?has_content) && !(summaryList4?has_content) && !(summaryList5?has_content) && !(summaryList6?has_content) && !(summaryList7?has_content)>

		No relevant information available.
		<@com.emptyLine/>
	
		<#else/>
		
			<table border="1">
				<title>Available dose-descriptor(s) per endpoint as a result of its hazard assessment</title>
				<col width="25%" />
				<col width="25%" />
				<col width="50%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Endpoint</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Route </emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Dose descriptor or qualitative effect characterisation; test type</emphasis></th>
					</tr>

					<#assign printSummaryName = summaryList1?size gt 1 />
					<#list summaryList1 as summary>

						<#if printSummaryName>
						    <#assign summaryName> 
								<#if summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

	                    <!-- Acute toxicity oral -->
						<@endpointConclusionOfDoseDescriptor summary "AcuteToxicityViaOralRoute" />
						<@doseOfDoseDescriptor summary "AcuteToxicityViaOralRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Acute toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									oral
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
                                    ${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Acute toxicity dermal -->
						<@endpointConclusionOfDoseDescriptor summary "AcuteToxicityViaDermalRoute" />
						<@doseOfDoseDescriptor summary "AcuteToxicityViaDermalRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Acute toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Acute toxicity inhalation -->
						<@endpointConclusionOfDoseDescriptor summary "AcuteToxicityViaInhalationRoute" />
						<@doseOfDoseDescriptor summary "AcuteToxicityViaInhalationRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Acute toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
								</para>
							</td>
						</tr>
						</#if>
					</#list>

					<#assign printSummaryName = summaryList2?size gt 1 />
					<#list summaryList2 as summary>

						<#if printSummaryName>
							<#assign summaryName> 
								<#if summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

                    	<!-- Irritation / Corrosion skin -->
						<@endpointConclusionOfDoseDescriptor summary "SkinIrritationCorrosion" />
						<#if endpointConclusion?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Irritation / Corrosivity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									skin
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Irritation / Corrosion eye -->
						<@endpointConclusionOfDoseDescriptor summary "EyeRespirationIrritation" />
						<#if endpointConclusion?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Irritation / Corrosivity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									eye
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Irritation / Corrosion resp. tract -->
						<@endpointConclusionOfDoseDescriptor summary "RespiratoryIrritation" />
						<#if endpointConclusion?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Irritation / Corrosivity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									resp. tract
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>
							</td>
						</tr>
						</#if>

					</#list>

					<#assign printSummaryName = summaryList3?size gt 1 />
					<#list summaryList3 as summary>

						<#if printSummaryName>
							<#assign summaryName> 
								<#if summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

						<!-- Sensitisation skin -->
						<@endpointConclusionOfDoseDescriptor summary "SkinSensitisation" />
						<#if endpointConclusion?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Sensitisation${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									skin
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Sensitisation resp. tract -->
						<@endpointConclusionOfDoseDescriptor summary "RespiratorySensitisation" />
						<#if endpointConclusion?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Sensitisation${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									resp. tract
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>
							</td>
						</tr>
						</#if>

					</#list>

					<#assign printSummaryName = summaryList4?size gt 1 />
					<#list summaryList4 as summary>

						<#if printSummaryName>
							<#assign summaryName> 
								<#if summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

                    	<!-- Repeated dose toxicity oral -->
						<@endpointConclusionOfDoseDescriptor summary "RepeatedDoseToxicityViaOralRouteSystemicEffects" />
						<@doseOfDoseDescriptor summary "RepeatedDoseToxicityViaOralRouteSystemicEffects" />
						<@studyDurationOfDoseDescriptor summary "RepeatedDoseToxicityViaOralRouteSystemicEffects" />
						<@targetSystemOrganOfDoseDescriptor summary "RepeatedDoseToxicityViaOralRouteSystemicEffects" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Repeated dose toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									oral
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Repeated dose toxicity dermal (systemic effects) -->
						<@endpointConclusionOfDoseDescriptor summary "RepeatedDoseToxicityDermalSystemicEffects" />
						<@doseOfDoseDescriptor summary "RepeatedDoseToxicityDermalSystemicEffects" />
						<@studyDurationOfDoseDescriptor summary "RepeatedDoseToxicityDermalSystemicEffects" />
						<@targetSystemOrganOfDoseDescriptor summary "RepeatedDoseToxicityDermalSystemicEffects" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
                        <tr>
							<!-- Endpoint -->
							<td>
								Repeated dose toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal (systemic effects)
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Repeated dose toxicity dermal (local effects) -->
						<@endpointConclusionOfDoseDescriptor summary "RepeatedDoseToxicityDermalLocalEffects" />
						<@doseOfDoseDescriptor summary "RepeatedDoseToxicityDermalLocalEffects" />
						<@studyDurationOfDoseDescriptor summary "RepeatedDoseToxicityDermalLocalEffects" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Repeated dose toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal (local effects)
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Repeated dose toxicity inhalation (systemic effects) -->
						<@endpointConclusionOfDoseDescriptor summary "RepeatedDoseToxicityInhalationSystemicEffects" />
						<@doseOfDoseDescriptor summary "RepeatedDoseToxicityInhalationSystemicEffects" />
						<@studyDurationOfDoseDescriptor summary "RepeatedDoseToxicityInhalationSystemicEffects" />
						<@targetSystemOrganOfDoseDescriptor summary "RepeatedDoseToxicityInhalationSystemicEffects" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Repeated dose toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation (systemic effects)
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Repeated dose toxicity inhalation (local effects) -->
						<@endpointConclusionOfDoseDescriptor summary "RepeatedDoseToxicityInhalationLocalEffects" />
						<@doseOfDoseDescriptor summary "RepeatedDoseToxicityInhalationLocalEffects" />
						<@studyDurationOfDoseDescriptor summary "RepeatedDoseToxicityInhalationLocalEffects" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Repeated dose toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation (local effects)
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

					</#list>

					<#assign printSummaryName = summaryList5?size gt 1 />
					<#list summaryList5 as summary>

						<#if printSummaryName>
							<#assign summaryName> 
								<#if summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>
	
						<!-- Mutagenicity in vitro / in vivo -->
						<@endpointConclusionOfDoseDescriptor summary "GeneticToxicityInVitro" />
						<#assign endpointConclusionVitro = endpointConclusion />
						<@endpointConclusionOfDoseDescriptor summary "GeneticToxicityInVivo" />
						<#assign endpointConclusionVivo = endpointConclusion />
						<#if endpointConclusionVitro?has_content || endpointConclusionVivo?has_content >
                        <tr>
							<!-- Endpoint -->
							<td>
								Mutagenicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									in vitro / in vivo
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									In vitro: ${endpointConclusionVitro}
								</para>

								<para>
									In vivo: ${endpointConclusionVivo}
								</para>
							</td>
						</tr>
						</#if>

					</#list>

					<#assign printSummaryName = summaryList6?size gt 1 />
					<#list summaryList6 as summary>

						<#if printSummaryName>
							<#assign summaryName> (<@com.text summary.name/>)
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

						<!-- Carcinogenicity oral -->
						<@endpointConclusionOfDoseDescriptor summary "CarcinogenicityViaOralRoute" />
						<@doseOfDoseDescriptor summary "CarcinogenicityViaOralRoute" />
						<@studyDurationOfDoseDescriptor summary "CarcinogenicityViaOralRoute" />
						<@targetSystemOrganOfDoseDescriptor summary "CarcinogenicityViaOralRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Carcinogenicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									oral
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Carcinogenicity dermal -->
						<@endpointConclusionOfDoseDescriptor summary "CarcinogenicityViaDermalRoute" />
						<@doseOfDoseDescriptor summary "CarcinogenicityViaDermalRoute" />
						<@studyDurationOfDoseDescriptor summary "CarcinogenicityViaDermalRoute" />
						<@targetSystemOrganOfDoseDescriptor summary "CarcinogenicityViaDermalRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Carcinogenicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Carcinogenicity inhalation -->
						<@endpointConclusionOfDoseDescriptor summary "CarcinogenicityViaInhalationRoute" />
						<@doseOfDoseDescriptor summary "CarcinogenicityViaInhalationRoute" />
						<@studyDurationOfDoseDescriptor summary "CarcinogenicityViaInhalationRoute" />
						<@targetSystemOrganOfDoseDescriptor summary "CarcinogenicityViaInhalationRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content || targetSystemOrgan?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Carcinogenicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>

								<para>
									${targetSystemOrgan}
								</para>
							</td>
						</tr>
						</#if>

					</#list>

					<#assign printSummaryName = summaryList7?size gt 1 />
					<#list summaryList7 as summary>

						<#if printSummaryName>
							<#assign summaryName> 
								<#if  summary.name?has_content>
									(<@com.text summary.name/>)
								</#if>
							</#assign>
						<#else>
							<#assign summaryName = "" />
						</#if>

						<!-- Reproductive toxicity: effects on fertility oral -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaOralRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaOralRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaOralRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: effects on fertility${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									oral
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

	                    <!-- Reproductive toxicity: effects on fertility dermal -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaDermalRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaDermalRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaDermalRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: effects on fertility${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

                    	<!-- Reproductive toxicity: effects on fertility inhalation -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaInhalationRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaInhalationRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnFertility" "EffectOnFertilityViaInhalationRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: effects on fertility${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Reproductive toxicity: developmental toxicity oral -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaOralRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaOralRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaOralRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: developmental toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									oral
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Reproductive toxicity: developmental toxicity dermal -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaDermalRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaDermalRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaDermalRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: developmental toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									dermal
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

						<!-- Reproductive toxicity: developmental toxicity inhalation -->
						<@endpointConclusionOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaInhalationRoute" />
						<@doseOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaInhalationRoute" />
						<@studyDurationOfDoseDescriptor summary "EffectsOnDevelopmentalToxicity" "EffectOnDevelopmentalToxicityViaInhalationRoute" />
						<#if endpointConclusion?has_content || doseDescriptor?has_content || studyDuration?has_content>
						<tr>
							<!-- Endpoint -->
							<td>
								Reproductive toxicity: developmental toxicity${summaryName}
							</td>
							<!-- Route -->
							<td>
								<para>
									inhalation
								</para>
							</td>
							<!-- Dose descriptor or qualitative effect characterisation; test type -->
							<td>
								<para>
									${endpointConclusion}
								</para>

								<para>
									${doseDescriptor}
									${studyDuration}
								</para>
							</td>
						</tr>
						</#if>

					</#list>
				</tbody>
			</table>
		</#if>
		<@com.emptyLine/>


	</section>

	<!-- 5.11.2. Selection of the DNEL(s) or other hazard conclusions for critical health effects -->
	<section>
		<title role="HEAD-3">Selection of the DNEL(s) or other hazard conclusions for critical health effects</title>

	<#if dnelReport??> 
		<@generateDNELReport reportingDocument />
	<#else>
		<@generateDNELReportForCSR substance />
	</#if>
</section>
		

<#macro generateDNELReportForCSR substance>
		<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "DataTox") />
        <#assign printSummaryName = summaryList?size gt 1 />

        <#if !(summaryList?has_content)>
			No relevant information available.
	
		<#else/>
            <#list summaryList as summary>
                <#if printSummaryName>
					<@com.emptyLine/>
                    <para><emphasis role="bold"><@com.text summary.name/></emphasis></para>
                </#if>

			<@generateDNELReport summary />
		</#list>
	</#if>
</#macro>

<#macro generateDNELReport summary>

				<#-- Hazard conclusions for workers -->
				<table border="1">
				<title>Hazard conclusions for workers</title>
				<col width="15%" />
				<col width="20%" />
				<col width="35%" />
				<col width="30%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Route</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Type of effect</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Hazard conclusion</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Most sensitive endpoint</emphasis></th>
					</tr>

						<!-- inhalation -->
						<#if !(@hazardAssessmentMacro?has_content) && !(summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content) && !(summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.StDose?has_content) &&
							!(summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content) &&
							!(summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content)>
						
						No relevant information available.
						<@com.emptyLine/>
	
						<#else/>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.HazardAssessment summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.StDose />
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content || summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content ||
							summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects  - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content || summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.StDose?has_content ||
							summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.HazardAssessment summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<para>
									<@com.picklist summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint/>
								</para>
							</td>
						</tr>
						</#if>
						
						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content || summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>

						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.StDose?has_content ||
							summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.HazardAssessment summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content> 
									<para>
										<@com.picklist summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>

						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content || summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
						
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects  - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content || summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.StDose?has_content ||
							summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.HazardAssessment summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>

						<#if @hazardAssessmentMacro?has_content || summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content || summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<@hazardAssessmentMacro summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.StDose/>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Eyes
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion?has_content>
									<para>
										<@com.picklist summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<para>
									<!-- empty -->
								</para>
							</td>
						</tr>
						</#if>
				</tbody>
			    </table>
				<@com.emptyLine/>

                <@toxInfoEffectsWorkers summary />
                <#if summary.AdditionalInformationWorkers.DiscussionWorkers?has_content >
                    <para><emphasis role="bold">Discussion:</emphasis></para>
                    <para><@com.richText summary.AdditionalInformationWorkers.DiscussionWorkers/></para>
                </#if>

		    	<!-- Hazard conclusions for the general population -->
				<@com.emptyLine/>
				<table border="1">
				<title>Hazard conclusions for the general population</title>
				<col width="15%" />
				<col width="20%" />
				<col width="35%" />
				<col width="30%" />
				<tbody>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Route</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Type of effect</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Hazard conclusion</emphasis></th>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Most sensitive endpoint</emphasis></th>
					</tr>
					
					
						<!-- inhalation -->
						<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
						<tr>							
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content>										
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.HazardAssessment/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.StDose?has_content>
									<para>									
										<@com.quantity summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content>	
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>							
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects  - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Inhalation
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>

						<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects  - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Dermal
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Oral
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects - Long-term
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.HazardAssessment/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content ||
							summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
						
						<tr>
							<!-- Route -->
							<td>
								<para>
									Oral
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Systemic effects  - Acute
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.HazardAssessment/>
									</para>
								</#if>
								
								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose?has_content>
									<para>
										<@com.quantity summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.StDose/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint?has_content>
									<para>
										<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.MostSensitiveEndpoint/>
									</para>
								</#if>

								<#if summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy?has_content>
									<para>
										(<@com.picklist summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy.OriginalStudy/>)
									</para>
								</#if>
							</td>
						</tr>
						</#if>
						
						<#if summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion?has_content>
						<tr>
							<!-- Route -->
							<td>
								<para>
									Eyes
								</para>
							</td>
							<!-- Type of effect -->
							<td>
								<para>
									Local effects
								</para>
							</td>
							<!-- Hazard conclusion -->
							<td>
								<#if summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion?has_content>
									<para>
										<@com.picklist summary.WorkersHazardForTheEyes.EyesLocalEffects.Conclusion/>
									</para>
								</#if>
							</td>
							<!-- Most sensitive endpoint -->
							<td>
								<para>
									<!-- empty -->
								</para>
							</td>
						</tr>
						</#if>
				</tbody>
			    </table>
				<@com.emptyLine/>
                <@toxInfoEffectsGeneralPopulation summary />
                <#if summary.AdditionalInformationGeneralPopulation.DiscussionGenPop?has_content >
                    <para><emphasis role="bold">Discussion:</emphasis></para>
                    <para><@com.richText summary.AdditionalInformationGeneralPopulation.DiscussionGenPop/></para>
                </#if>
</#macro>

<#macro AFJustification af justification label>
    <#if af?has_content>
        <#if af != 1 || (af == 1 && justification?has_content)>
        <para role="indent"><emphasis role="bold">${label}</emphasis> <@com.number af/> <#if justification?has_content>(<@com.text justification/>)</#if></para>
        </#if>
    </#if>
</#macro>

<#macro toxInfoEffectsWorkers summary>
    
	<#local valueForSystemicEffectsLongTermInhalation = summary.WorkersHazardViaInhalationRoute.SystemicEffects.LongTermStudy />	
		<#if valueForSystemicEffectsLongTermInhalation?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsLongTerm summary "WorkersHazardViaInhalationRoute" "Inhalation Systemic effects - Long-term" />	
		</#if>
    <#local valueForSystemicEffectsAcuteInhalation = summary.WorkersHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy />	
		<#if valueForSystemicEffectsAcuteInhalation?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsAcute summary "WorkersHazardViaInhalationRoute" "Inhalation Systemic effects - Acute" />
		</#if>
	<#local valueForLocalEffectsLongTermInhalation = summary.WorkersHazardViaInhalationRoute.LocalEffects.LongTermNoStudy />	
		<#if valueForLocalEffectsLongTermInhalation?has_content>	
			<@com.emptyLine/><@toxInfoLocalEffectsLongTerm summary "WorkersHazardViaInhalationRoute" "Inhalation Local effects - Long-term" />
		</#if>
	<#local valueForLocalEffectsAcuteInhalation = summary.WorkersHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy />	
		<#if valueForLocalEffectsAcuteInhalation?has_content>	
			<@com.emptyLine/><@toxInfoLocalEffectsAcute summary "WorkersHazardViaInhalationRoute" "Inhalation Local effects - Acute" />
		</#if>
	
	<#local valueForSystemicEffectsLongTermDermal = summary.WorkersHazardViaDermalRoute.SystemicEffects.LongTermStudy />	
		<#if valueForSystemicEffectsLongTermDermal?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsLongTerm summary "WorkersHazardViaDermalRoute" "Dermal Systemic effects - Long-term" />
		</#if>
	<#local valueForSystemicEffectsAcuteDermal = summary.WorkersHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy />	
		<#if valueForSystemicEffectsAcuteDermal?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsAcute summary "WorkersHazardViaDermalRoute" "Dermal Systemic effects - Acute" />
		</#if>
	<#local valueForLocalEffectsLongTermDermal = summary.WorkersHazardViaDermalRoute.LocalEffects.LongTermNoStudy />	
		<#if valueForLocalEffectsLongTermDermal?has_content>
			<@com.emptyLine/><@toxInfoLocalEffectsLongTerm summary "WorkersHazardViaDermalRoute" "Dermal Local effects - Long-term" />
		</#if>
	<#local valueForLocalEffectsAcuteDermal = summary.WorkersHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy />	
		<#if valueForLocalEffectsAcuteDermal?has_content>	
			<@com.emptyLine/><@toxInfoLocalEffectsAcute summary "WorkersHazardViaDermalRoute" "Dermal Local effects - Acute" false />
		</#if>
</#macro>

<#macro toxInfoEffectsGeneralPopulation summary>
    <#local valueForSystemicEffectsLongTermGeneralPopInhalation = summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.LongTermStudy />	
		<#if valueForSystemicEffectsLongTermGeneralPopInhalation?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsLongTerm summary "GeneralPopulationHazardViaInhalationRoute" "Inhalation Systemic effects - Long-term" />
		</#if>
    <#local valueForSystemicEffectsAcuteInhalation = summary.GeneralPopulationHazardViaInhalationRoute.SystemicEffects.AcuteShortTermExposureStudy />	
		<#if valueForSystemicEffectsAcuteInhalation?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsAcute summary "GeneralPopulationHazardViaInhalationRoute" "Inhalation Systemic effects - Acute" />
		</#if>
    <#local valueForLocalEffectsLongTermGeneralPopInhalation = summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.LongTermNoStudy />	
		<#if valueForLocalEffectsLongTermGeneralPopInhalation?has_content>
			<@com.emptyLine/><@toxInfoLocalEffectsLongTerm summary "GeneralPopulationHazardViaInhalationRoute" "Inhalation Local effects - Long-term" />
		</#if>
    <#local valueForLocalEffectsAcuteInhalation = summary.GeneralPopulationHazardViaInhalationRoute.LocalEffects.AcuteShortTermExposureStudy />	
		<#if valueForLocalEffectsAcuteInhalation?has_content>
			<@com.emptyLine/><@toxInfoLocalEffectsAcute summary "GeneralPopulationHazardViaInhalationRoute" "Inhalation Local effects - Acute" />
		</#if>
		
	<#local valueForSystemicEffectsLongTermGeneralPopDermal = summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.LongTermStudy />	
		<#if valueForSystemicEffectsLongTermGeneralPopDermal?has_content>	
			<@com.emptyLine/><@toxInfoSystemicEffectsLongTerm summary "GeneralPopulationHazardViaDermalRoute" "Dermal Systemic effects - Long-term" />
		</#if>
	<#local valueForSystemicEffectsAcuteDermal = summary.GeneralPopulationHazardViaDermalRoute.SystemicEffects.AcuteShortTermExposureStudy />	
		<#if valueForSystemicEffectsAcuteDermal?has_content>	
			<@com.emptyLine/><@toxInfoSystemicEffectsAcute summary "GeneralPopulationHazardViaDermalRoute" "Dermal Systemic effects - Acute" />
		</#if>
	<#local valueForLocalEffectsLongTermGeneralPopDermal = summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.LongTermNoStudy />	
		<#if valueForLocalEffectsLongTermGeneralPopDermal?has_content>
			<@com.emptyLine/><@toxInfoLocalEffectsLongTerm summary "GeneralPopulationHazardViaDermalRoute" "Dermal Local effects - Long-term" />
		</#if>
	<#local valueForLocalEffectsAcuteDermal = summary.GeneralPopulationHazardViaDermalRoute.LocalEffects.AcuteShortTermExposureStudy />	
		<#if valueForLocalEffectsAcuteDermal?has_content>
			<@com.emptyLine/><@toxInfoLocalEffectsAcute summary "GeneralPopulationHazardViaDermalRoute" "Dermal Local effects - Acute" false />
		</#if>

	<#local valueForSystemicEffectsLongTermGeneralPopOral = summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.LongTermStudy />	
		<#if valueForSystemicEffectsLongTermGeneralPopOral?has_content>	
			<@com.emptyLine/><@toxInfoSystemicEffectsLongTerm summary "GeneralPopulationHazardViaOralRoute" "Oral Systemic effects - Long-term" />
		</#if>
	<#local valueForSystemicEffectsAcuteOral = summary.GeneralPopulationHazardViaOralRoute.SystemicEffects.AcuteShortTermExposureStudy />	
		<#if valueForSystemicEffectsAcuteOral?has_content>
			<@com.emptyLine/><@toxInfoSystemicEffectsAcute summary "GeneralPopulationHazardViaOralRoute" "Oral Systemic effects - Acute" />
		</#if>
</#macro>

<#macro toxInfoSystemicEffectsLongTerm summary subPath title>
			
	<#assign basePath = "summary."+subPath+".SystemicEffects.LongTermStudy" />
	<#assign basePathDNEL = basePath+".DNMELInfoWithRTR" />
	<#local HazardAssesment = (basePath + ".HazardAssessment")?eval />
	<#local HazardConclusion = (basePath + ".ExplanationForHazardConclusion.JustificationAndComments")?eval />

	<#if HazardAssesment?has_content || HazardConclusion?has_content>
	
		<para><emphasis role="HEAD-WoutNo">${title}</emphasis></para>
		
		<#local derivationValue = (basePathDNEL + ".DerivationMethod")?eval />	
		<#local doseDescriptorValue = (basePathDNEL + ".DoseDescriptorStartingPoint")?eval />	
		<#local modifiedDoseDescriptorValue = (basePathDNEL + ".DoseDescriptorStartRTR")?eval />	
		<#local OverallAssessmentFactorValue = (basePathDNEL + ".AssessmentFactor")?eval />
		<#if derivationValue?has_content || doseDescriptorValue?has_content || modifiedDoseDescriptorValue?has_content || OverallAssessmentFactorValue?has_content>
	
			<#if derivationValue?has_content>
				<para role="indent">DNEL derivation method: <@com.picklist derivationValue /></para>
			</#if>
							
			<#if doseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Dose descriptor starting point:</emphasis> <@com.picklist doseDescriptorValue /></para>
			</#if>
		
			<#if modifiedDoseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Modified dose descriptor starting point:</emphasis> <@com.picklist modifiedDoseDescriptorValue/></para><para role="indent"><#if (basePathDNEL+".JustificationRTR")?eval?has_content><@com.richText (basePathDNEL+".JustificationRTR")?eval /></#if></para>
			</#if>
		
			<#if OverallAssessmentFactorValue?has_content>
				<para role="indent"><emphasis role="bold">Overall Assessment Factor:</emphasis> <@com.number OverallAssessmentFactorValue /></para>
			</#if>
				
			<@AFJustification af=(basePathDNEL+".DoseResponseAF")?eval justification=(basePathDNEL+".DoseResponseJustif")?eval label="AF for dose response relationship:"/>
			<@AFJustification af=(basePathDNEL+".DiffInDurationAF")?eval justification=(basePathDNEL+".DiffInDurationJustif")?eval label="AF for difference in duration of exposure:"/>
			<@AFJustification af=(basePathDNEL+".InterspeciesAF")?eval justification=(basePathDNEL+".InterspeciesJustif")?eval label="AF for interspecies differences (allometric scaling):"/>
			<@AFJustification af=(basePathDNEL+".OthInterspeciesAF")?eval justification=(basePathDNEL+".OthInterspeciesJustif")?eval label="AF for other interspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".IntraspeciesAF")?eval justification=(basePathDNEL+".IntraspeciesJustif")?eval label="AF for intraspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".DatabaseQualityAF")?eval justification=(basePathDNEL+".DatabaseJustif")?eval label="AF for the quality of the whole database:"/>
			<@AFJustification af=(basePathDNEL+".OthUncertaintiesAF")?eval justification=(basePathDNEL+".OthUncertaintiesJustif")?eval label="AF for remaining uncertainties:"/>
		
		</#if>
			
			<#local comments>
				<#if ("summary."+subPath+".SystemicEffects.LongTermStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval?has_content>
				<@com.richText ("summary."+subPath+".SystemicEffects.LongTermStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval />
				</#if>
			</#local>	
				
			<#if comments?has_content>
				<para role="indent"><emphasis role="underline">Further explanation on hazard conclusions:</emphasis></para>
				<para role="indent">${comments}</para>
			</#if>
	</#if>
</#macro>


<#macro toxInfoSystemicEffectsAcute summary subPath title>
			
	<#assign basePath = "summary."+subPath+".SystemicEffects.AcuteShortTermExposureStudy" />
	<#assign basePathDNEL = basePath+".DNELInfoWithRouteToRouteWithExtrapolation" />
	<#local HazardAssesment = (basePath + ".HazardAssessment")?eval />
	<#local HazardConclusion = (basePath + ".ExplanationForHazardConclusion.JustificationAndComments")?eval />

	<#if HazardAssesment?has_content || HazardConclusion?has_content>
			
			<para><emphasis role="HEAD-WoutNo">${title}</emphasis></para>
			
		<#local derivationValue = (basePathDNEL + ".DerivationMethod")?eval />	
		<#local doseDescriptorValue = (basePathDNEL + ".DoseDescriptorStartingPoint")?eval />	
		<#local modifiedDoseDescriptorValue = (basePathDNEL + ".DoseDescriptorStartRTR")?eval />	
		<#local OverallAssessmentFactorValue = (basePathDNEL + ".OverallAssessmentFactor")?eval />
		<#if derivationValue?has_content || doseDescriptorValue?has_content || modifiedDoseDescriptorValue?has_content || OverallAssessmentFactorValue?has_content>
		
			<#if derivationValue?has_content>
				<para role="indent">DNEL derivation method: <@com.picklist derivationValue /></para>
			</#if>
							
			<#if doseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Dose descriptor starting point:</emphasis> <@com.picklist doseDescriptorValue /></para>
			</#if>
		
			<#if modifiedDoseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Modified dose descriptor starting point:</emphasis> <@com.picklist modifiedDoseDescriptorValue/></para><para role="indent"><#if (basePathDNEL+".DoseDescriptorJustificationRTR")?eval?has_content><@com.richText (basePathDNEL+".DoseDescriptorJustificationRTR")?eval /></#if></para>
			</#if>
		
			<#if OverallAssessmentFactorValue?has_content>
				<para role="indent"><emphasis role="bold">Overall Assessment Factor:</emphasis> <@com.number OverallAssessmentFactorValue /></para>
			</#if>
				
			<@AFJustification af=(basePathDNEL+".DoseResponseAF")?eval justification=(basePathDNEL+".DoseResponseJustif")?eval label="AF for dose response relationship:"/>
			<@AFJustification af=(basePathDNEL+".InterspeciesAF")?eval justification=(basePathDNEL+".InterspeciesJustif")?eval label="AF for interspecies differences (allometric scaling):"/>
			<@AFJustification af=(basePathDNEL+".OthInterspeciesAF")?eval justification=(basePathDNEL+".OthInterspeciesJustif")?eval label="AF for other interspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".IntraspeciesAF")?eval justification=(basePathDNEL+".IntraspeciesJustifAF")?eval label="AF for intraspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".DatabaseQualityDatabaseQualityAF")?eval justification=(basePathDNEL+".DatabaseQualityJustif")?eval label="AF for the quality of the whole database:"/>
			<@AFJustification af=(basePathDNEL+".OthUncertaintiesAF")?eval justification=(basePathDNEL+".UncertaintiesJustif")?eval label="AF for remaining uncertainties:"/>
		</#if>
		<#local comments>
			<#if ("summary."+subPath+".SystemicEffects.AcuteShortTermExposureStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval?has_content>
			<@com.richText ("summary."+subPath+".SystemicEffects.AcuteShortTermExposureStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval />
			</#if>
		</#local>
			<#if comments?has_content>
			<para role="indent"><emphasis role="underline">Further explanation on hazard conclusions:</emphasis></para>
			<para role="indent">${comments}</para>
		</#if>
	</#if>
</#macro>

<#macro toxInfoLocalEffectsLongTerm summary subPath title>
			
	<#assign basePath = "summary."+subPath+".LocalEffects.LongTermNoStudy" />
	<#assign basePathDNEL = basePath+".DNMELInfoWithoutRTR" />
	<#local HazardAssesment = (basePath + ".HazardAssessment")?eval />
	<#local HazardConclusion = (basePath + ".ExplanationForHazardConclusion.JustificationAndComments")?eval />

	<#if HazardAssesment?has_content || HazardConclusion?has_content>
	
		<para><emphasis role="HEAD-WoutNo">${title}</emphasis></para>
	
		<#local derivationValue = (basePathDNEL + ".DerivationMethod")?eval />	
		<#local doseDescriptorValue = (basePathDNEL + ".DoseDescriptorStart")?eval />	
		<#local OverallAssessmentFactorValue = (basePathDNEL + ".AssessmentFactor")?eval />
		<#if derivationValue?has_content || doseDescriptorValue?has_content || OverallAssessmentFactorValue?has_content>
						
			<#if derivationValue?has_content>
				<para role="indent">DNEL derivation method: <@com.picklist derivationValue /></para>
			</#if>
							
			<#if doseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Dose descriptor starting point:</emphasis> <@com.picklist doseDescriptorValue /></para>
			</#if>
	
			<#if OverallAssessmentFactorValue?has_content>
				<para role="indent"><emphasis role="bold">Overall Assessment Factor:</emphasis> <@com.number OverallAssessmentFactorValue /></para>
			</#if>
				
			<@AFJustification af=(basePathDNEL+".DoseResponseAF")?eval justification=(basePathDNEL+".DoseResponseJustif")?eval label="AF for dose response relationship:"/>
			<@AFJustification af=(basePathDNEL+".DiffInDurationAF")?eval justification=(basePathDNEL+".DiffInDurationJustif")?eval label="AF for difference in duration of exposure:"/>
			<@AFJustification af=(basePathDNEL+".InterspeciesAF")?eval justification=(basePathDNEL+".InterspeciesJustif")?eval label="AF for interspecies differences (allometric scaling):"/>
			<@AFJustification af=(basePathDNEL+".OthInterspeciesAF")?eval justification=(basePathDNEL+".OthInterspeciesJustif")?eval label="AF for other interspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".IntraspeciesAF")?eval justification=(basePathDNEL+".IntraspeciesJustif")?eval label="AF for intraspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".DatabaseQualityAF")?eval justification=(basePathDNEL+".DatabaseJustif")?eval label="AF for the quality of the whole database:"/>
			<@AFJustification af=(basePathDNEL+".OthUncertaintiesAF")?eval justification=(basePathDNEL+".OthUncertaintiesJustif")?eval label="AF for remaining uncertainties:"/>
		</#if>
		<#local comments>
			<#if ("summary."+subPath+".LocalEffects.LongTermNoStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval?has_content>
			<@com.richText ("summary."+subPath+".LocalEffects.LongTermNoStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval />
			</#if>
		</#local>
		<#if comments?has_content>
			<para role="indent"><emphasis role="underline">Further explanation on hazard conclusions:</emphasis></para>
			<para role="indent">${comments}</para>
		</#if>
	</#if>
</#macro>

<#macro toxInfoLocalEffectsAcute summary subPath title withExtrapolation = true>
	
	<#assign basePath = "summary."+subPath+".LocalEffects.AcuteShortTermExposureStudy" />
	<#local HazardAssesment = (basePath + ".HazardAssessment")?eval />
	<#local HazardConclusion = (basePath + ".ExplanationForHazardConclusion.JustificationAndComments")?eval />
	
	<#if withExtrapolation>
        <#assign basePathDNEL = basePath+".DNELInfoWithoutRouteToRouteWithExtrapolation" >
    <#else>
        <#assign basePathDNEL = basePath+".DNELInfoWithoutRouteToRouteWithoutExtrapolation" >
    </#if>
	
	<#if HazardAssesment?has_content || HazardConclusion?has_content>
	
	<para><emphasis role="HEAD-WoutNo">${title}</emphasis></para>
	
		<#local derivationValue = (basePathDNEL + ".DerivationMethod")?eval />	
		<#local doseDescriptorValue = (basePathDNEL + ".DoseDescriptorStart")?eval />	
		<#local OverallAssessmentFactorValue = (basePathDNEL + ".OverallAssessmentFactor")?eval />
		<#if derivationValue?has_content || doseDescriptorValue?has_content || OverallAssessmentFactorValue?has_content>
					
			<#if derivationValue?has_content>
				<para role="indent">DNEL derivation method: <@com.picklist derivationValue /></para>
			</#if>
							
			<#if doseDescriptorValue?has_content>
				<para role="indent"><emphasis role="bold">Dose descriptor starting point:</emphasis> <@com.picklist doseDescriptorValue /></para>
			</#if>
	
			<#if OverallAssessmentFactorValue?has_content>
				<para role="indent"><emphasis role="bold">Overall Assessment Factor:</emphasis> <@com.number OverallAssessmentFactorValue /></para>
			</#if>
				
			<@AFJustification af=(basePathDNEL+".DoseResponseAF")?eval justification=(basePathDNEL+".DoseResponseJustif")?eval label="AF for dose response relationship:"/>
			<@AFJustification af=(basePathDNEL+".InterspeciesAF")?eval justification=(basePathDNEL+".InterspeciesJustif")?eval label="AF for interspecies differences (allometric scaling):"/>
			<@AFJustification af=(basePathDNEL+".OthInterspeciesAF")?eval justification=(basePathDNEL+".OthInterspeciesJustif")?eval label="AF for other interspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".IntraspeciesAF")?eval justification=(basePathDNEL+".IntraspeciesJustifAF")?eval label="AF for intraspecies differences:"/>
			<@AFJustification af=(basePathDNEL+".DatabaseQualityDatabaseQualityAF")?eval justification=(basePathDNEL+".DatabaseQualityJustif")?eval label="AF for the quality of the whole database:"/>
			<@AFJustification af=(basePathDNEL+".OthUncertaintiesAF")?eval justification=(basePathDNEL+".UncertaintiesJustif")?eval label="AF for remaining uncertainties:"/>
		</#if>
		<#local comments>
			<#if ("summary."+subPath+".LocalEffects.AcuteShortTermExposureStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval?has_content>
			<@com.richText ("summary."+subPath+".LocalEffects.AcuteShortTermExposureStudy.ExplanationForHazardConclusion.JustificationAndComments")?eval />
			</#if>
		</#local>
		<#if comments?has_content>
			<para role="indent"><emphasis role="underline">Further explanation on hazard conclusions:</emphasis></para>
			<para role="indent">${comments}</para>
		</#if>
	</#if>
</#macro>


<#macro endpointConclusionOfDoseDescriptor summary path pathOptional = "EndpointConclusion">
	<#assign endpointConclusion>
		<@com.picklist ("summary.KeyValueForChemicalSafetyAssessment."+path+"."+pathOptional+".EndpointConclusion")?eval/>
	</#assign>
</#macro>
<#macro doseOfDoseDescriptor summary path pathOptional = "EndpointConclusion">
	<#local unit>
		<@com.picklist ("summary.KeyValueForChemicalSafetyAssessment."+path+"."+pathOptional+".EffectLevelUnit")?eval/>
	</#local>
	<#local value>
		<@com.quantity ("summary.KeyValueForChemicalSafetyAssessment."+path+"."+pathOptional+".EffectLevelValue")?eval/>
	</#local>
	<#if unit?has_content || value?has_content>
		<#assign doseDescriptor>
        (${unit}): ${value}
		</#assign>
	<#else>
		<#assign doseDescriptor></#assign>
	</#if>
</#macro>

<#macro studyDurationOfDoseDescriptor summary path pathOptional = "EndpointConclusion">
	<#local type>
		<@com.picklist ("summary.KeyValueForChemicalSafetyAssessment."+path+"."+pathOptional+".TestType")?eval/>
	</#local>
	<#local species>
		<@com.picklist ("summary.KeyValueForChemicalSafetyAssessment."+path+"."+pathOptional+".Species")?eval/>
	</#local>
	<#if type?has_content || species?has_content>
		<#assign studyDuration>
        (${type}; ${species})
		</#assign>
	<#else>
		<#assign studyDuration></#assign>
	</#if>
</#macro>
<#macro targetSystemOrganOfDoseDescriptor summary path>
	<#local system>
		<@com.picklist ("summary.KeyValueForChemicalSafetyAssessment."+path+".EndpointConclusion.System")?eval/>
	</#local>
	<#local organ>
		<@com.picklistMultiple ("summary.KeyValueForChemicalSafetyAssessment."+path+".EndpointConclusion.Organ")?eval/>
	</#local>
	<#if system?has_content || organ?has_content>
		<#assign targetSystemOrgan>
        Target system/organs:${system} ${organ}
		</#assign>
	<#else>
		<#assign targetSystemOrgan></#assign>
	</#if>
</#macro>
<#macro hazardAssessmentMacro hazardPicklist dosePicklist>
	<#compress>
		<#assign hazardAssessment>
			<@com.picklist hazardPicklist/>
		</#assign>
		<para>
			${hazardAssessment}
		</para>

		<#if hazardAssessment?matches(".*DNEL.*") || hazardAssessment?matches(".*DMEL.*") || hazardAssessment?matches(".*other toxicological threshold.*")>
		<para>
			<@com.quantity dosePicklist/>
		</para>
		</#if>
	</#compress>
</#macro>