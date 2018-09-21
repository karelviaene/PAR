<!-- 1. IDENTITY OF THE SUBSTANCE AND PHYSICAL AND CHEMICAL PROPERTIES template file -->

<!-- 1.1. Name and other identifiers of the substance -->
<section>
	<title role="HEAD-2">Name and other identifiers of the substance</title>
		
	<#if isOriginElement(substance)>
		<para>
			The substance <@csr.substanceName substance/> is an element having the following characteristics and physical–chemical properties (see the IUCLID dataset for further details). 
		</para>
	<#elseif isTypeOfSubstanceOther(substance)/>
		<para>
			Type of substance <@csr.substanceName substance/>: <@com.picklist substance.TypeOfSubstance.Composition/> [<@com.picklist substance.TypeOfSubstance.Origin/> (origin)]. The characteristics and physical–chemical properties are described below (see the IUCLID dataset for further details). 
		</para>
	<#else/>
		<para>
			The substance <@csr.substanceName substance/> is a <@com.picklist substance.TypeOfSubstance.Composition/> (<@com.picklist substance.TypeOfSubstance.Origin/>) having the following characteristics and physical–chemical properties (see the IUCLID dataset for further details).
		</para>
	</#if>
	
	<para>
		The following public name is used: <@com.text substance.PublicName/>
	</para>

	<#if referenceSubstance?has_content>
		<#if referenceSubstanceHasContent(referenceSubstance)>
		<@com.emptyLine/>
		<table border="1">
			<title>Substance identity</title>
			<col width="35%" />
			<col width="65%" />
			<tbody>
				<#if referenceSubstance.Inventory?? && referenceSubstance.Inventory.InventoryEntry?has_content>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">EC number:</emphasis></th>
					<td>						
						<@com.inventoryECNumber referenceSubstance.Inventory.InventoryEntry />						
					</td>
				</tr>
				</#if>
				<#if referenceSubstance.Inventory?? && referenceSubstance.Inventory.InventoryEntry?has_content>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">EC name:</emphasis></th>
					<td>
						<@inventoryECName referenceSubstance.Inventory.InventoryEntry />
					</td>
				</tr>
				</#if>
				<#if referenceSubstance.Inventory?? && referenceSubstance.Inventory.InventoryEntry?has_content>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">CAS number (EC inventory):</emphasis></th>
					<td>
						<@com.inventoryECCasNumber referenceSubstance.Inventory.InventoryEntry />
					</td>
				</tr>
				</#if>
				<#if referenceSubstance.ReferenceSubstanceInfo?? && referenceSubstance.ReferenceSubstanceInfo.CASInfo.CASNumber?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">CAS number:</emphasis></th>
						<td>
							<@com.text referenceSubstance.ReferenceSubstanceInfo.CASInfo.CASNumber/>
						</td>
					</tr>
				</#if>
				<#if referenceSubstance.ReferenceSubstanceInfo?? && referenceSubstance.ReferenceSubstanceInfo.CASInfo.CASName?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">CAS name:</emphasis></th>
						<td>
							<@com.text referenceSubstance.ReferenceSubstanceInfo.CASInfo.CASName/>
						</td>
					</tr>
				</#if>
				<#if referenceSubstance.ReferenceSubstanceInfo?? && referenceSubstance.ReferenceSubstanceInfo.IupacName?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">IUPAC name:</emphasis></th>
						<td>
							<@com.text referenceSubstance.ReferenceSubstanceInfo.IupacName/>
						</td>
					</tr>
				</#if>
				<#if referenceSubstance.ReferenceSubstanceInfo?? && referenceSubstance.ReferenceSubstanceInfo.Description?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Description:</emphasis></th>
						<td>
							<@com.text referenceSubstance.ReferenceSubstanceInfo.Description/>
						</td>
					</tr>
				</#if>
				<#if referenceSubstance.ReferenceSubstanceInfo?? && referenceSubstance.ReferenceSubstanceInfo.Synonyms?has_content>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Synonyms:</emphasis></th>
					<td>
						<@synonymsList referenceSubstance.ReferenceSubstanceInfo.Synonyms/>
					</td>
				</tr>
				</#if>
				<#if referenceSubstance.MolecularStructuralInfo?? && referenceSubstance.MolecularStructuralInfo.MolecularFormula?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Molecular formula:</emphasis></th>
						<td>
							<@com.text referenceSubstance.MolecularStructuralInfo.MolecularFormula/>
						</td>
					</tr>
				</#if>
				<#if referenceSubstance.MolecularStructuralInfo?? && referenceSubstance.MolecularStructuralInfo.MolecularWeightRange?has_content>
					<tr>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Molecular weight range:</emphasis></th>
						<td>
							<@com.range referenceSubstance.MolecularStructuralInfo.MolecularWeightRange/>
						</td>
					</tr>
				</#if>
			</tbody>
		</table>
		<#else>
			<@com.emptyLine/>
			<table border="0">
				<title>Substance identity</title>
				<col width="100%" />
				<tbody><tr><td>No information available</td></tr></tbody>
			</table>
		</#if>
		
		<!-- Structural formula -->
		<#assign attachmentKey = referenceSubstance.MolecularStructuralInfo.StructuralFormula />
		<#if attachmentKey?has_content>
			<#assign structuralFormula = iuclid.getMetadataForAttachment(attachmentKey) />
			<#if structuralFormula?has_content && structuralFormula.isImage>
				<@com.emptyLine/>
				<para><emphasis role="bold">Structural formula:</emphasis></para>
				<#if structuralFormula.exceedsLimit(10000000)>
					<para><emphasis role="bold">Image size is too big (${structuralFormula.size} bytes) and cannot be displayed!</emphasis></para>
				<#elseif !iuclid.imageMimeTypeSupported(structuralFormula.mediaType) />
					<para><emphasis role="bold">Image type (${structuralFormula.mediaType}) is not yet supported!</emphasis></para>
				<#else/>
					<mediaobject>
						<imageobject>
							<imagedata width="100%" scalefit="1" fileref="data:${structuralFormula.mediaType};base64,${iuclid.getContentForAttachment(attachmentKey)}" />
						</imageobject>
					</mediaobject>
				</#if>
			</#if>
		</#if>
	</#if>
	

	<#if substance.OtherNames?has_content>
		<para>Other identifiers:</para>
		<@otherIdentifiersList substance.OtherNames/>
	</#if>
	
	<#if referenceSubstance.MolecularStructuralInfo?? && referenceSubstance.MolecularStructuralInfo.Remarks?has_content>
		<para><emphasis role="bold">Remarks:</emphasis></para>
		<#if referenceSubstance?has_content>
			<para>
				<@com.text referenceSubstance.MolecularStructuralInfo.Remarks/>
				<@com.emptyLine/>
			</para>
		</#if>
	</#if>
	
</section>

<!-- 1.2. Composition of the substance -->
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Composition of the substance</title>
	
	<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "SubstanceComposition") />
	
	<#if !(recordList?has_content) && !(recordList?size gt 1)>
	No relevant information available.
	<@com.emptyLine/>
	
	<#else/>
	
		<para>Overall information on composition:</para>
		<informaltable border="1">
			<#if csr.assessmentEntitiesExist>
				<col width="30%" />
				<col width="35%" />
				<col width="35%" />
			<#else/>
				<col width="35%" />
				<col width="65%" />
			</#if>
			<tbody>
				<tr>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Composition</emphasis></th>
					<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Related composition(s)</emphasis></th>
					<#if csr.assessmentEntitiesExist>
						<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Related assessment entity</emphasis></th>
					</#if>
				</tr>
				
				<@com.emptyLine/>
				
				<#list recordList as record>
					<tr>
						<td>
							<para>
							<@com.text record.GeneralInformation.Name/> 
								<#if record.GeneralInformation.TypeOfComposition?has_content>
									(<@com.picklist record.GeneralInformation.TypeOfComposition/>)
								</#if>
							</para>
						</td>
						<td>
							<@relatedCompositionNameList record.GeneralInformation.RelatedCompositions.RelatedComposition/>
							<para>
								<@com.text record.GeneralInformation.RelatedCompositions.ReferenceToRelatedCompositions/>
							</para>
						</td>
						<#if csr.assessmentEntitiesExist>
							<td>
								<#assign aeList = getAssessmentEntitiesRelatedToComposition(record)/>
								<#list aeList as ae>
									<@com.text ae.AssessmentEntityName/>
									<?linebreak?>
								</#list>
							</td>
						</#if>
					</tr>
				</#list>
			</tbody>
		</informaltable>
  	</#if>
	
	<#if recordList?has_content>
		<#list recordList as record>
			<@com.emptyLine/>
			<para><emphasis role="HEAD-WoutNo">Name: <@com.text record.GeneralInformation.Name/></emphasis></para>
			
			<#if record.GeneralInformation.StateForm?has_content>
			<para>State/form: <@com.picklist record.GeneralInformation.StateForm/></para>
			</#if>
			<#if record.DegreeOfPurity.Purity?has_content>
			<para>Degree of purity: <@com.range record.DegreeOfPurity.Purity/></para>
			</#if>
			<#if record.GeneralInformation.DescriptionOfComposition?has_content>
			<para>Description: <@com.text record.GeneralInformation.DescriptionOfComposition/></para>
			</#if>
			
			<!-- Constituents -->
			<#assign itemList = record.Constituents.Constituents />
			<#if itemList?has_content>
				<@com.emptyLine/>
				<table border="1">
					<title>Constituents 
					<#if record.GeneralInformation.Name?has_content>
					(<@com.text record.GeneralInformation.Name/>)</#if></title>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<tbody>
						<tr>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Constituent</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Typical concentration</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Concentration range</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						</tr>
						<#list itemList as item>
							<tr>
								<td>
									<@referenceSubstanceData item.ReferenceSubstance/>
								</td>
								<td>
									<@com.range item.ProportionTypical/>
								</td>
								<td>
									<@com.range item.Concentration/>
								</td>
								<td>
									<@com.text item.Remarks/>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</#if>
			
			<!-- Impurities -->
			<#assign itemList = record.Impurities.Impurities />
			<#if itemList?has_content>
				<@com.emptyLine/>
				<table border="1">
					<title>Impurities 
					<#if record.GeneralInformation.Name?has_content>
					(<@com.text record.GeneralInformation.Name/>)</#if></title>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<tbody>
						<tr>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Constituent</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Typical concentration</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Concentration range</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						</tr>
						<#list itemList as item>
							<tr>
								<td>
									<@referenceSubstanceData item.ReferenceSubstance/>
								</td>
								<td>
									<@com.range item.ProportionTypical/>
								</td>
								<td>
									<@com.range item.Concentration/>
								</td>
								<td>
									<#if item.RelevantForClassificationLabeling><emphasis role="bold">Impurity is relevant for C&amp;L of the substance</emphasis><?linebreak?></#if>
									<@com.text item.Remarks/>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</#if>
			
			<!-- Additives -->
			<#assign itemList = record.Additives.Additives />
			<#if itemList?has_content>
				<@com.emptyLine/>
				<table border="1">
					<title>Additives <#if record.GeneralInformation.Name?has_content>
					(<@com.text record.GeneralInformation.Name/>)</#if></title>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<tbody>
						<tr>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Constituent</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Function</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Typical concentration</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Concentration range</emphasis></th>
							<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
						</tr>
						<#list itemList as item>
							<tr>
								<td>
									<@referenceSubstanceData item.ReferenceSubstance/>
								</td>
								<td>
									<@com.picklist item.Function/>
								</td>
								<td>
									<@com.range item.ProportionTypical/>
								</td>
								<td>
									<@com.range item.Concentration/>
								</td>
								<td>
									<#if item.RelevantForClassificationLabeling><emphasis role="bold">Impurity is relevant for C&amp;L of the substance</emphasis><?linebreak?></#if>
									<@com.text item.Remarks/>
								</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</#if>
			
			<!--TODO: Description of the chemistry of the substance: -->
			
			<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "FLEXIBLE_RECORD", "SubstanceComposition") />
			
			<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Percentile?has_content
			|| record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Shape?has_content
			|| record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.XDimension?has_content
			|| record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.YDimension?has_content
			|| record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.ZDimension?has_content
			|| record.CharacterisationOfNanomaterials.SpecificSurfaceArea.SpecificSurfaceArea?has_content
			|| record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Shape?has_content
			|| record.CharacterisationOfNanomaterials.SurfaceTreatment.SurfaceTreatmentApplied?has_content
			|| record.CharacterisationOfNanomaterials.SurfaceTreatment.repeatableSet8912?has_content> 
						
				<@com.emptyLine/>
				<para><emphasis role="HEAD-WoutNo">Characterisation of nanomaterial</emphasis></para>
				
				<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Percentile?has_content>
					<para>
						Particle size: <@com.picklist record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Percentile/>
					</para>
				</#if>	
				
				<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Shape?has_content>
					<para>
						Shape and particle size range: <@com.picklist record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.Shape/>
					</para>	
				</#if>

				<para>
					<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.XDimension?has_content>
						(X dimension: <@com.range record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.XDimension/>;
					</#if>
						
					<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.YDimension?has_content>
						Y dimension: <@com.range record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.YDimension/>;
					</#if>
					
					<#if record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.ZDimension?has_content>
						Z dimension: <@com.range record.CharacterisationOfNanomaterials.ShapeAndParticleSizeRange.ZDimension/>)
					</#if>
				</para>
				
				<#if record.CharacterisationOfNanomaterials.SpecificSurfaceArea.SpecificSurfaceArea?has_content>					
					<para>
						Specific surface area: <@com.range record.CharacterisationOfNanomaterials.SpecificSurfaceArea.SpecificSurfaceArea/>
					</para>
				</#if>
				
				<#if record.CharacterisationOfNanomaterials.SurfaceTreatment.SurfaceTreatmentApplied?has_content>					
					<para>
						Surface treatment applied: <@com.picklist record.CharacterisationOfNanomaterials.SurfaceTreatment.SurfaceTreatmentApplied/>
					</para>
				</#if>	
					
				<@com.emptyLine/>
				<@surfaceTreatmentList record.CharacterisationOfNanomaterials.SurfaceTreatment.repeatableSet8912/>
			</#if>
		</#list>
			
  	</#if>
	
	<#assign chemistryAssessment = iuclid.getChemistryAssessmentFor(substance.documentKey) />
	<#if chemistryAssessment?? && chemistryAssessment.description?has_content>
		<para>
			<emphasis role="bold">Approach to fate/hazard assessment: </emphasis><@com.richText chemistryAssessment.description/>
		</para>
	</#if>
	
</section>

<!-- 1.3. Assessment entity -->
<#if csr.assessmentEntitiesExist>
<@com.emptyLine/>
<section>
	<title role="HEAD-2">Assessment entity information</title>
	
	<#assign aeList = csr.assessmentEntities/>
	
	<informaltable border="1">
		<col width="35%" />
		<col width="65%" />
		<tbody>
			<tr>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Assessment entity name</emphasis></th>
				<th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Remarks</emphasis></th>
			</tr>
			<#list aeList as ae>
				<tr>
					<td>
						<emphasis role="bold"><@com.text ae.AssessmentEntityName/></emphasis>
						<?linebreak?>
						<@com.picklist ae.RelationToRegisteredSubstance/>
					</td>
					<td>
						<para>
							Assessment entity composition:
							<@assessmentEntityCompositionList ae/>
						</para>
						<#if ae.hasElement("Description") && ae.Description?has_content>
							<para>
								Additional information: <@com.richText ae.Description/>
							</para>
						</#if>
					</td>
				</tr>
			</#list>
		</tbody>
	</informaltable>
	<@com.emptyLine/>
	
</section>

</#if>


<!-- 1.4. Physicochemical properties -->
<section>
	<title role="HEAD-2">Physicochemical properties</title>
	
	<!--TODO: alternative source for Physical state -->

	<!-- Physicochemical properties table -->
	
	<#assign propertyToDataMap = {
		"Physical state" : 
			{"subType" : "GeneralInformation", 
			"listValuePath" : "KeyValueForChemicalSafetyAssessment.PhysicalState", 
			"postText" : "at 20°C and 101.3 kPa"},
		"Melting / freezing point" : 
			{"subType" : "Melting", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.MelFreezPoint", 
			"postText" : "at 101.3 kPa",
			"infoReq" : "Melting / freezing point"},
		"Boiling point" : 
			{"subType" : "BoilingPoint", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.BoilingPoint", 
			"postText" : "at 101.3 kPa",
			"infoReq" : "Boiling point"},
		"Relative density" : 
			{"subType" : "PcDensity", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.RelativeDensity", 
			"postText" : "at 20°C",
			"infoReq" : "Relative density",
			"recordSubType" : "Density"},
		"Granulometry" : 
			{"subType" : "ParticleSize",
			"infoReq" : "Granulometry",
			"recordSubType" : "Granulometry"},
		"Vapour pressure" : 
			{"subType" : "Vapour", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.VapourPressure", 
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.TemperatureOf",
			"infoReq" : "Vapour pressure"},
		"Partition coefficient n-octanol/water (log value)" : 
			{"subType" : "PartitionCoefficient", 
			"preText" : "Log Kow (Log Pow):", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.LowKow", 
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.TemperatureOf",
			"infoReq" : "Partition coefficient n-octanol/water (log value)",
			"recordSubType" : "Partition"},
		"Water solubility" : 
			{"subType" : "WaterSolubility", 
			"valuePath" : "KeyValueForChemicalSafetyAssessment.WaterSolubility", 
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.TemperatureOf",
			"infoReq" : "Water solubility"},
		"Solubility in organic solvents / fat solubility" : 
			{"subType" : "SolubilityOrganic",
			"preText" : "Solubility in mg/100 g standard fat:",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.SolubilityStandard", 
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf",
			"preText2" : "Solubility in organic solvents at 20°C:",
			"valuePath2" : "KeyValueForChemicalSafetyAssessment.SolubilitySolvents",
			"infoReq" : "Solubility in organic solvents / fat solubility"},
		"Surface tension" : 
			{"subType" : "SurfaceTension",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.SurfaceTension",
			"postText" : "mN/m at 20°C and",
			"valuePath2" : "KeyValueForChemicalSafetyAssessment.Concentration",
			"postText2" : "mg/L",
			"infoReq" : "Surface tension"},
		"Flash point" : 
			{"subType" : "FlashPoint",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.FlashPoint",
			"postText" : "at 1013 hPa",
			"infoReq" : "Flash point"},
		"Autoflammability / self-ignition temperature" : 
			{"subType" : "AutoFlammability",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.AutoFlammability",
			"postText" : "at 1013 hPa",
			"infoReq" : "Self-ignition temperature"},
		"Flammability" : 
			{"subType" : "Flammability",
			"listValuePath" : "KeyValueChemicalAssessment.Flammability",
			"infoReq" : "Flammability"},
		"Explosive properties" : 
			{"subType" : "Explosiveness",
			"listValuePath" : "ResultsAndDiscussion.Explosiveness",
			"infoReq" : "Explosive properties"},
		"Oxidising properties" : 
			{"subType" : "OxidisingProperties",
			"listValuePath" : "KeyValueChemicalAssessment.Oxidising",
			"infoReq" : "Oxidising properties"},
		"Oxidation reduction potential" : 
			{"subType" : "OxidReduction",
			"preText" : "Oxidation reduction potential in mV:",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.ReductionPotential", 
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf",
			"infoReq" : "Oxidation reduction potential",
			"recordSubType" : "OxidationReduction"},
		"Stability in organic solvents and identity of relevant degradation products" : 
			{"subType" : "StabilityOrganic",
			"infoReq" : "Stability in organic solvents and identity of relevant degradation products"},
		"Storage stability and reactivity towards container material" : 
			{"subType" : "StorageStability",
			"infoReq" : "Reactivity towards container material"},
		"Stability: thermal, sunlight, metals" : 
			{"subType" : "StabilityThermal",
			"infoReq" : "Thermal stability"},
		"pH" : 
			{"subType" : "pH"},
		"Dissociation constant" : 
			{"subType" : "Dissociation",
			"preText" : "pKa at 20°C:",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.pka",
			"infoReq" : "Dissociation constant",
			"recordSubType" : "DissociationConstant"},
		"Viscosity" : 
			{"subType" : "Viscosity",
			"preText" : "Viscosity:",
			"valuePath" : "KeyValueForChemicalSafetyAssessment.Viscosity",
			"atValuePath" : "KeyValueForChemicalSafetyAssessment.AtTheTemperatureOf",
			"infoReq" : "Viscosity"},
		"Self-reactive substances" : 
			{"subType" : "SelfReactiveSubstances",
			"infoReq" : "Self-reactive substances"},
		"Organic peroxide" : 
			{"subType" : "OrganicPeroxide",
			"infoReq" : "Organic peroxide"},
		"Corrosive to metals" : 
			{"subType" : "CorrosiveToMetals",
			"infoReq" : "Corrosive to metals"},
		"Gasses under pressure" : 
			{"subType" : "GasesUnderPressure",
			"infoReq" : "Gasses under pressure"}
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
				<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", propertyData["subType"]) />

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
							<@com.richText summary.KeyInformation.KeyInformation/>
						</td>
						<!-- Value used for CSA / Discussion -->
						<td>						
						<#if isValueForCSARelevant(summary, propertyData)>
							<para><emphasis role="bold">Value used for CSA:</emphasis>
							<@valueForCSA summary propertyData/></para>
						</#if>							
						<@com.richText summary.Discussion.Discussion/>
						</td>
						<#if csr.assessmentEntitiesExist>
							<!-- Assessment entity linked -->
							<td>
								<#assign aeList = csr.getAssessmentEntitiesLinkedToSummary(summary)/>
								<#list aeList as ae>
									<para><@com.text ae.AssessmentEntityName/></para>
								</#list>
							</td>
						</#if>
					</tr>
				</#list>
			</#list>
		</tbody>
	</table>
	</#if>
	
	
	<!-- Additional physicochemical properties table -->
	<#assign additionalPropertyToDataMap = {
		"Agglomeration / aggregation" : 
			{"subType" : "AgglomerationAggregation",
			"infoReq" : "Nanomaterial agglomeration / aggregation"},
		"Crystalline phase" : 
			{"subType" : "CrystallinePhase",
			"infoReq" : "Nanomaterial crystalline phase"},
		"Crystallite and grain size" : 
			{"subType" : "CrystalliteGrainSize",
			"infoReq" : "Nanomaterial crystallite and grain size"},
		"Aspect ratio / shape" : 
			{"subType" : "AspectRatioShape",
			"infoReq" : "Nanomaterial aspect ratio / shape"},
		"Specific surface area" : 
			{"subType" : "SpecificSurfaceArea",
			"infoReq" : "Nanomaterial specific surface area"},
		"Zeta potential" : 
			{"subType" : "ZetaPotential",
			"infoReq" : "Nanomaterial Zeta potential"},
		"Surface chemistry" : 
			{"subType" : "SurfaceChemistry",
			"infoReq" : "Nanomaterial surface chemistry"},
		"Dustiness" : 
			{"subType" : "Dustiness",
			"infoReq" : "Nanomaterial dustiness"},
		"Porosity" : 
			{"subType" : "Porosity",
			"infoReq" : "Nanomaterial porosity"},
		"Pour density" : 
			{"subType" : "PourDensity",
			"infoReq" : "Nanomaterial pour density"},
		"Photocatalytic activity" : 
			{"subType" : "PhotocatalyticActivity",
			"infoReq" : "Nanomaterial photocatalytic activityy"},
		"Radical formation potential" : 
			{"subType" : "RadicalFormationPotential",
			"infoReq" : "Nanomaterial radical formation potential"},
		"Catalytic activity" : 
			{"subType" : "CatalyticActivity",
			"infoReq" : "Nanomaterial catalytic activity"}
	}/>
	
	<#assign properties = additionalPropertyToDataMap?keys />

	<#if properties?has_content>
		<#assign existsAdditionalPhysChemPropContent = false />
		
		<#assign additionalPhysChemPropContent>
			<@com.emptyLine/>
			<table border="1">
				<title>Additional physicochemical properties of nanomaterial</title>
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
				
						<#assign propertyData = additionalPropertyToDataMap[property] />
						<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", propertyData["subType"]) />

						<#assign usespan = true />
						
						<#list summaryList as summary>
							<#assign existsAdditionalPhysChemPropContent = true />
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
									<@com.richText summary.KeyInformation.KeyInformation/>
								</td>
								<!-- Value used for CSA / Discussion -->
								<td>
									<@com.richText summary.Discussion.Discussion/>
								</td>
								<#if csr.assessmentEntitiesExist>
									<!-- Assessment entity linked -->
									<td>
										<#assign aeList = csr.getAssessmentEntitiesLinkedToSummary(summary)/>
										<#list aeList as ae>
											<para><@com.text ae.AssessmentEntityName/></para>
										</#list>
									</td>
								</#if>
							</tr>
						</#list>
					</#list>
				</tbody>
			</table>
			<@com.emptyLine/>
		</#assign>
		
		<#if existsAdditionalPhysChemPropContent>
			${additionalPhysChemPropContent}
		</#if>
	</#if>
	
	
	<!-- Data waiving -->
	<#assign allPropertyToDataMap = propertyToDataMap + additionalPropertyToDataMap />
	<#assign properties = allPropertyToDataMap?keys />
	
	<#assign existsDataWaivingContent = false />
	
	<#assign dataWaivingContent>
		<@com.emptyLine/><para><emphasis role="HEAD-WoutNo">Data waiving</emphasis></para>
		
		<#list properties as property>
			<#assign propertyData = allPropertyToDataMap[property] />
			
			<#if propertyData["infoReq"]?has_content>
			
				<#assign recordSubType = propertyData["subType"] />
				<#if propertyData["recordSubType"]?has_content>
					<#assign recordSubType = propertyData["recordSubType"] />
				</#if>
			
				<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", recordSubType) />
				<#assign dataWaivingList = getDataWaivingList(recordList) />
				
				<#if dataWaivingList?has_content>
					<#assign existsDataWaivingContent = true />
					<#list dataWaivingList as study>
						<para><emphasis role="bold">Information requirement:</emphasis> ${propertyData["infoReq"]!}</para>
						<para role="indent">
							<emphasis role="bold">Reason: </emphasis>
							<@com.picklist study.AdministrativeData.DataWaiving/>
						</para>
						<para role="indent">
							<emphasis role="bold">Justification:</emphasis>
							<@com.picklistMultiple study.AdministrativeData.DataWaivingJustification/>
						</para>
						<@com.emptyLine/>
					</#list>
				</#if>
			</#if>		
		</#list>
	</#assign>
	
	<#if existsDataWaivingContent>
		${dataWaivingContent}
	</#if>
		
	<!-- Testing proposal -->
	<#assign existsTestingProposalContent = false />
	
	<#assign testingProposaContent>
		<para><emphasis role="HEAD-WoutNo">Testing proposal</emphasis></para>
		
		<#list properties as property>
			<#assign propertyData = allPropertyToDataMap[property] />
			
			<#if propertyData["infoReq"]?has_content>		
			
				<#assign recordSubType = propertyData["subType"] />
				<#if propertyData["recordSubType"]?has_content>
					<#assign recordSubType = propertyData["recordSubType"] />
				</#if>
			
				<#assign recordList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", recordSubType) />
				<#assign testingProposalList = getTestingProposalList(recordList) />
				
				<#if testingProposalList?has_content>
					<#assign existsTestingProposalContent = true />
					<#list testingProposalList as study>	
						<para><emphasis role="bold">Information requirement:</emphasis> ${propertyData["infoReq"]!}</para>
						<para role="indent">
							<emphasis role="bold">Proposed test guideline:</emphasis>
							<@csr.guidelineList study.MaterialsAndMethods.Guideline/>
						</para>
						<para role="indent">
							<emphasis role="bold">Principles of method if other than guideline:</emphasis>
							<?linebreak?>
							<@com.text study.MaterialsAndMethods.MethodNoGuideline/>
						</para>
						<@com.richText study.MaterialsAndMethods.AnyOtherInformationOnMaterialsAndMethodsInclTables.OtherInformation/>
						<para role="indent">
							<emphasis role="bold">Planned study period:</emphasis>
							<@com.text study.AdministrativeData.StudyPeriod/>
						</para>
						<@com.emptyLine/>
					</#list>
				</#if>
			</#if>		
		</#list>
	</#assign>
	
	<#if existsTestingProposalContent>
		${testingProposaContent}
	</#if>
	
	<!-- Discussion of physicochemical properties -->
	<#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "PhysicalChemicalProperties") />
	
	<#if summaryList?has_content>
		<para><emphasis role="HEAD-WoutNo">Discussion of physicochemical properties</emphasis></para>
	</#if>
	
	<#if summaryList?has_content>
		<#assign printSummaryName = summaryList?size gt 1 />	
		<#list summaryList as summary>
			<@com.emptyLine/>
			<@csr.endpointSummary summary "" printSummaryName/>
		</#list>
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