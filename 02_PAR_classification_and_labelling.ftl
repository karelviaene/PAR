<!-- 3. CLASSIFICATION AND LABELLING template file -->

<!-- 3.1. Classification and labelling according to CLP / GHS -->
<section>
	<title role="HEAD-2">Classification and labelling according to CLP / GHS</title>
	
	<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "Ghs") />

	<#if !recordList?has_content>
		No relevant information available.
		<@com.emptyLine/> 
	<#else/>
		<@com.emptyLine/>
		<#list recordList as record>
			<para>
				<@com.emptyLine/>
				<emphasis role="bold"><emphasis role="underline">Substance: <@csr.classificationSubstanceName record substance/></emphasis></emphasis>
			</para>
			
			<para>
				<emphasis role="bold">Implementation:</emphasis> <@com.picklist record.GeneralInformation.Implementation/>
			</para>
			
			<#if record.GeneralInformation.Remarks?has_content>
				<para>
					<emphasis role="bold">Remarks:</emphasis> <@com.richText record.GeneralInformation.Remarks/>
				</para>
			</#if>
			
			<#if record.GeneralInformation.RelatedCompositions.Composition?has_content>
				<para>
					<emphasis role="underline">Related composition: <@com.documentReferenceMultiple record.GeneralInformation.RelatedCompositions.Composition/></emphasis>
				</para>
			</#if>
			
			<#if record.GeneralInformation.NotClassified>
				<para>					
					The substance is not classified
				</para>
			</#if>
			
			<para>
				The substance is classified as follows: 
			</para>

			<@com.emptyLine/>
			<table border="1">
				<title>Classification and labelling according to CLP / GHS</title>
				<col width="30%" />
				<col width="70%" />
				<tbody>
					
					<!-- CLASSIFICATION SECTION -->
					<tr>
						<td colspan="2">
							<?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> Classification </emphasis>
						</td>
					</tr>
					
					<tr>
						<!-- Hazard category -->
						<td>
							Hazard category
						</td>
						<td>
							<!-- Phys chem -->
							<#if record.Classification.PhysicalHazards.Explosives.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.Explosives.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableGases.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableGases.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableAerosols.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableAerosols.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingGases.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingGases.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.GasesPres.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.GasesPres.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableLiquids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableLiquids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableSolids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableSolids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SelfReactiveSubstMixt.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SelfReactiveSubstMixt.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.PyrophoricLiquids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.PyrophoricLiquids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.PyrophoricSolids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.PyrophoricSolids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SelfHeatSubstMixt.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SelfHeatSubstMixt.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SubstMixtWater.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SubstMixtWater.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingLiquids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingLiquids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingSolids.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingSolids.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OrganicPeroxides.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OrganicPeroxides.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.CorMetals.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.CorMetals.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.DesensitizedExplosives.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.DesensitizedExplosives.HazardCategory/> 
								</para>
							</#if>
							
							<!-- Human Tox -->
							<#if record.Classification.HealthHazards.AcuteToxicityOral.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityOral.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AcuteToxicityDermal.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityDermal.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AcuteToxicityInhalation.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityInhalation.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.Irritation.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.Irritation.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.EyeIrritation.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.EyeIrritation.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.RespiratorySensitisation.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.RespiratorySensitisation.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.SkinSensitisation.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.SkinSensitisation.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AspirationHazard.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AspirationHazard.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.ReproductiveToxicity.Effects.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.ReproductiveToxicity.Effects.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.GermCell.GermCell.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.GermCell.GermCell.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.Carcinogenicity.Carcinogenicity.HazardCategory?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.Carcinogenicity.Carcinogenicity.HazardCategory/> 
								</para>
							</#if>
							
							<!-- Environmental Tox -->
							<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm.HazardCategory/> 
								</para>
							</#if>
							<#if record.Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.HazardCategory/> 
								</para>
							</#if>
							
						</td>
					</tr>

					<!-- M-Factor acute -->
					<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute?has_content> 
						<tr>
							<td colspan="2">
								M-Factor acute: <@com.number record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute/>
							</td>
						</tr>
					</#if>
					<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic?has_content> 
						<tr>
							<td colspan="2">
								M-Factor acute: <@com.number record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic/>
							</td>
						</tr>
					</#if>

					<tr>
						<!-- Hazard statement -->
						<td>
							Hazard statement
						</td>
						<td>
							<!-- Phys chem -->
							<#if record.Classification.PhysicalHazards.Explosives.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.Explosives.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableGases.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableGases.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableAerosols.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableAerosols.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingGases.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingGases.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.GasesPres.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.GasesPres.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableLiquids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableLiquids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.FlammableSolids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.FlammableSolids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SelfReactiveSubstMixt.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SelfReactiveSubstMixt.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.PyrophoricLiquids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.PyrophoricLiquids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.PyrophoricSolids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.PyrophoricSolids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SelfHeatSubstMixt.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SelfHeatSubstMixt.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.SubstMixtWater.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.SubstMixtWater.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingLiquids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingLiquids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OxidisingSolids.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OxidisingSolids.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.OrganicPeroxides.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.OrganicPeroxides.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.CorMetals.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.CorMetals.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.PhysicalHazards.DesensitizedExplosives.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.PhysicalHazards.DesensitizedExplosives.HazardStatement/> 
								</para>
							</#if>
						
							<!-- Human Tox -->
							<#if record.Classification.HealthHazards.AcuteToxicityOral.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityOral.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AcuteToxicityDermal.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityDermal.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AcuteToxicityInhalation.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AcuteToxicityInhalation.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.Irritation.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.Irritation.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.EyeIrritation.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.EyeIrritation.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.RespiratorySensitisation.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.RespiratorySensitisation.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.SkinSensitisation.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.SkinSensitisation.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.AspirationHazard.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.AspirationHazard.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.ReproductiveToxicity.ReproductiveToxicity.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.ReproductiveToxicity.Effects.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.ReproductiveToxicity.Effects.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.GermCell.GermCell.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.GermCell.GermCell.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.HealthHazards.Carcinogenicity.Carcinogenicity.HazardStatement?has_content> 
								<para>
								<@com.picklist record.Classification.HealthHazards.Carcinogenicity.Carcinogenicity.HazardStatement/> 
								</para>
							</#if>
						
							<!-- Environmental Tox -->
							<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.AquaticEnvironment.AcuteShortTerm.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.AquaticEnvironment.LongTerm.HazardStatement/> 
								</para>
							</#if>
							<#if record.Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone?has_content> 
								<para>
								<@com.picklist record.Classification.EnvironmentalHazards.OzoneLayer.HazardousOzone.HazardStatement/> 
								</para>
							</#if>
						
						</td>
					</tr>	
					
					<tr>
					<!-- Supplemental Hazard statement -->
						<td>
							Supplemental hazard statement
						</td>
						<td>
							<#if record.Classification.AdditionalHazard.Statements?has_content> 
								<para>
								<@com.text record.Classification.AdditionalHazard.Statements/> 
								</para>
							</#if>
						</td>
					</tr>	
				
					<!-- LABELLING SECTION -->
					<tr>
						<td colspan="2">
							<?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold"> Labelling </emphasis>
						</td>
					</tr>
					
					<!-- GHS pictogram -->
					<tr>
						<td> 
							GHS pictogram
						</td>
						<td>
							<#if record.Labelling.HazardPictogramBlock.HazardPictogram?has_content>
								<@com.emptyLine/>
								<para>
									<@HazardPictogramList record.Labelling.HazardPictogramBlock.HazardPictogram/>
								</para>
							<#else/> <para> / </para>
							</#if>
						</td>
					</tr>					
					<!-- Signal words -->
					<tr>
						<td> 
							Signal words
						</td>
						<td>
							<#if record.Labelling.SignalWord?has_content>
								<para>
									<@com.picklist record.Labelling.SignalWord/>
								</para>
							<#else/> <para> / </para>
							</#if>
						</td>
					</tr>				
				<!-- Hazard statements -->
				<tr>
					<td> 
						Hazard statements
					</td>
					<td>
						<#if record.Labelling.HazardStatementsBlock.HazardStatements?has_content>
							<para>
								<@HazardStatementList record.Labelling.HazardStatementsBlock.HazardStatements/>
							</para>
						<#else/> <para> / </para>
						</#if>
					</td>
				</tr>
				<!-- Supplemental hazard statements -->
				<tr>
					<td> 
						Supplemental hazard statements
					</td>
					<td>
						<#if record.Classification.AdditionalHazard.Statements?has_content>
							<para>
								<@com.text record.Classification.AdditionalHazard.Statements/> 
							</para>
						<#else/> <para> / </para>
						</#if>
					</td>
				</tr>
				<!-- Specific concentration limits, M factor -->
				<tr>
					<td> 
						Specific concentration limits, M factor
					</td>
					<td>
											
						<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute?has_content> 
							M-Factor acute:  <@com.number record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorAcute/>
						</#if>						
						<#if record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic?has_content> 
							M-Factor chronic: <@com.number record.Classification.EnvironmentalHazards.AquaticEnvironment.MFactor.MFactorChronic/>
						</#if>
					</td>
				</tr>				
				<!-- Precautionary statements -->
				<tr>
					<td> 
						Precautionary statements
					</td>
					<td>
						<#if record.Labelling.PrecautionaryStatementsBlock.PrecautionaryStatements?has_content>
							<para>
								<@PrecautionaryStatementsList record.Labelling.PrecautionaryStatementsBlock.PrecautionaryStatements/>
							</para>
						<#else/> <para> / </para>
						</#if>					
					</td>
				</tr>				
				<!-- Additional labelling requirements -->
				<tr>
					<td> 
						Additional labelling requirements
					</td>
					<td>
						<#if record.Labelling.LabelingRequirementsBlock.LabelingRequirements?has_content>
							<para>
								<@SupplimentalHazardStatementList record.Labelling.LabelingRequirementsBlock.LabelingRequirements/>
							</para>
						<#else/> <para> / </para>
						</#if>
					</td>
				</tr>
				<!-- Note -->
				<tr>
					<td> 
						Note
					</td>
					<td>
						<#if record.NotesBlock.Notes?has_content>
							<para>
								<@NotesLabellingList record.NotesBlock.Notes/>
							</para>
						<#else/> <para> / </para>
						</#if>
					</td>
				</tr>

				
				</tbody>
			</table>		
			
		</#list>
	
	</#if>			
</section>

<!-- Macros and functions -->
<#macro HazardPictogramList HazardPictogramRepeatableBlock>
<#compress>
	<#if HazardPictogramRepeatableBlock?has_content>
		<#list HazardPictogramRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Code/>
				<#if blockItem.Code.code?has_content>
					<#assign phraseImageMeta = iuclid.getImageMetadataForPhraseCode(blockItem.Code.code) />					
					<#if phraseImageMeta?has_content>
						<#assign phraseImagePrinted = false/> 
						<#if iuclid.imageMimeTypeSupported(phraseImageMeta.mediaType)>
							<#assign phraseImagePrinted = true/> 
								<mediaobject>
									<imageobject>
										<imagedata fileref="data:${phraseImageMeta.mediaType};base64,${iuclid.getImageContentForPhraseCode(phraseImageMeta.code, phraseImageMeta.mediaType)}" />
									</imageobject>
								</mediaobject>
							<@com.emptyLine/>
						</#if>
						<#if !phraseImagePrinted>
							<para><emphasis role="bold">The image for phrase code ${blockItem.Code.code} is in an unsupported format!</emphasis></para>
						</#if>
					<#else/>
						<para><emphasis role="bold">No image found for phrase code ${blockItem.Code.code}</emphasis></para>
					</#if>
				</#if>				
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro HazardStatementList HazardStatementRepeatableBlock>
<#compress>
	<#if HazardStatementRepeatableBlock?has_content>
		<#list HazardStatementRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.HazardStatement/>
				<#if blockItem.AdditionalText?has_content>
					(<@com.text blockItem.AdditionalText/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro PrecautionaryStatementsList PrecautionaryStatementRepeatableBlock>
<#compress>
	<#if PrecautionaryStatementRepeatableBlock?has_content>
		<#list PrecautionaryStatementRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.PrecautionaryStatement/>
				<#if blockItem.AdditionalText?has_content>
					(<@com.text blockItem.AdditionalText/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro SupplimentalHazardStatementList SupplimentalHazardStatementRepeatableBlock>
<#compress>
	<#if SupplimentalHazardStatementRepeatableBlock?has_content>
		<#list SupplimentalHazardStatementRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.SupplHazardStatement/>
				<#if blockItem.AdditionalText?has_content>
					(<@com.text blockItem.AdditionalText/>)
				</#if>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro AdditionalLabellingList AdditionalLabellingRepeatableBlock>
<#compress>
	<#if AdditionalLabellingRepeatableBlock?has_content>
		<#list AdditionalLabellingRepeatableBlock as blockItem>
			<para role="indent">
				<@com.text blockItem.Labelling/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#macro NotesLabellingList NotesRepeatableBlock>
<#compress>
	<#if NotesRepeatableBlock?has_content>
		<#list NotesRepeatableBlock as blockItem>
			<para role="indent">
				<@com.picklist blockItem.Note/>
			</para>
		</#list>
  	</#if>
</#compress>
</#macro>

<#function isNotEmptyClassificationBlock block>
	<#if !(block?has_content)>
		<#return false>
	</#if>
	<#if block.HazardCategory?has_content || block.HazardStatement?has_content || block.ReasonForNoClassification?has_content>
		<#return true>
	</#if>
	<#return false>
</#function>

<#function isNotEmptyConcentrationBlock record>
	<#if !(record?has_content)>
		<#return false>
	</#if>
	<#if record.ConcentrationRangeVal?has_content || record.HazardCategories?has_content>
		<#return true>
	</#if>
	<#return false>
</#function>
