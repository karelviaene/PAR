<@com.emptyLine/>
<!-- 6. PAR efficacy template file -->

<!-- 6.7 Efficacy data to support these claims -->
<section>
    <title role="HEAD-3">Efficacy against target organisms</title>
</section>



<section>
    <title role="HEAD-4">Function and field of use</title>

    <#assign FunctionMode= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !FunctionMode?has_content>
        No information available about function and mode of control.
    <#else/>
        <#list FunctionMode as fm>
            <para>
                <@com.text fm.OverallRemarksAttachments.RemarksOnResults/>
            </para>
            <@com.emptyLine/>     <@com.emptyLine/>
           <para>
                <emphasis role="bold">Function addressed: </emphasis>
                <@com.picklistMultiple fm.GeneralInformation.InformationOnIntendedUseAndApplication.FunctionAddressed/>
                <@com.emptyLine/>
            </para>
            <para>
                <emphasis role="bold">Field of use envisaged/user: </emphasis>
                <@com.text fm.GeneralInformation.InformationOnIntendedUseAndApplication.FieldOfUseEnvisagedUser/>
                <@com.emptyLine/>
            </para>
        </#list>
    </#if>
</section>




<section>
<title role="HEAD-4">Organisms to be controlled and products, organisms or objects to be protected</title>
<!-- TODO   TARGET SPECIES KUNNEN NOG PROPERDER IN EEN TABELLETJE (ZOALS IN PAR TEMPLATE), MAAR IS EVEN ZOEKEN HOE -->
<#assign FunctionMode= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !FunctionMode?has_content>
        No information available about function and mode of control.
    <#else/>
        <#list FunctionMode as fm>
            <table border="1"><title>Target organisms:</title>
                <col width="100%" />
                <tbody>
                    <tr>
                        <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Scientific name / common name / developmental stage</emphasis></th>
                     </tr>
                    <tr><td>
                        <@testorganisms fm.GeneralInformation.PestTargetOrganismsToBeControlled.TargetOrganisms/>
                    </td></tr>
                </tbody>
            </table>
            <@com.emptyLine/>
            <emphasis role="bold">Organisms (to be protected) or treated materials: </emphasis> <@com.text fm.GeneralInformation.ProductsOrganismsOrObjectsToBeProtectedUnderStudy.OrganismsToBeProtectedOrTreatedMaterials/>
        </#list>
    </#if>
</section>



<section>
<title role="HEAD-4">Effects on target organisms, including unacceptable suffering</title>
<!--Please describe here the effects of the biocidal product on target organism(s.-->
<#-- [Instruction NL: Regarding unacceptable suffering: for vertebrate target organisms (PT14, 15, 17, 19, 20) information on humaneness of the treatment should be provided.] -->
</section>




<section>
<title role="HEAD-4">Mode of action, including time delay</title>
<!--Please describe here the mode of action, including time delay.-->
    <#assign ModeOfAction= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !ModeOfAction?has_content>
        No information available about mode of action.
    <#else/>
        <#list ModeOfAction as moa>
        <para>
            <emphasis role="bold">Effects on target organisms: </emphasis> <@com.text moa.GeneralInformation.GeneralInformationOnEffectiveness.EffectsOnTargetOrganisms/>
            <@com.emptyLine/>
        </para>
        <para>
            <emphasis role="bold">Mode of action: </emphasis> <@com.picklist moa.GeneralInformation.GeneralInformationOnEffectiveness.ModeAction/>
            <@com.emptyLine/>
            </para>
         </#list>
    </#if>

</section>




<section><title role="HEAD-4">Efficacy data </title>
<!-- Any experimental data on the efficacy of the active substance against target organism.-->
<#-- [Instruction NL: Where relevant a short description on the rational of the testing performed can be given before the table. This is however, not in all cases necessary.] -->

    <#assign studyList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EfficacyData") />
    <#assign studyList1 = getSortedEfficacyData(studyList) />
    <@populateResultAndDataWaivingAndTestingProposalStudyLists studyList1/>

        <!-- Study list -->
        <#if !resultStudyList?has_content>
            No relevant information available.
        <#else/>
                The studies on efficacy are summarised in the following table:
                <@com.emptyLine/>
                <table border="1"><title>Experimental data on the efficacy of the biocidal product against target organisms</title>
                    <col width="12,5%" /><col width="12,5%" /><col width="12,5%" /><col width="12,5%" />
                    <col width="12,5%" /><col width="12,5%" /><col width="12,5%" /><col width="12,5%" />
                    <tbody>
                        <tr>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Function</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Field of use envisaged</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test substance</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test organism(s)</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test method</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test system / concentrations applied / exposure time</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Test results: effects</emphasis></th>
                            <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Reference</emphasis></th>
                        </tr>

                        <#list resultStudyList as study>

                            <tr>
                                <!-- Function -->
                                    <td>
                                        <@com.text study.Background.ObjectiveLabelClaimAddressed/>
                                    </td>

                                <!-- Field of use -->
                                    <td>

                                    </td>

                                <!-- Test substance -->
                                    <td>
                                        <@csr.testMaterialInformation study.MaterialsAndMethods.TestMaterials.TestMaterialInformation/>
                                        <@com.text study.MaterialsAndMethods.TestMaterials.SpecificDetailsOnTestMaterialUsedForTheStudy/>
                                   </td>

                                <!-- Test organism -->
                                    <td>
                                         <@testorganisms study.MaterialsAndMethods.PestTargetOrganismsToBeControlled.TestTargetOrganisms/>                       <para><@com.text study.MaterialsAndMethods.PestTargetOrganismsToBeControlled.DetailsOnTestTargetOrganisms/></para>
                                    </td>

                                <!-- Test method -->
                                    <td>
                                        <para>
                                            <@csr.guidelineList study.MaterialsAndMethods.Guideline/>
                                        </para>
                                        <para>
                                            <@com.text study.MaterialsAndMethods.MethodNoGuideline/>
                                        </para>
                                    </td>

                                <!-- Test system / concentration / exposure time -->
                                    <td>
                                        <emphasis role="bold">Test system: </emphasis>
                                            <para><@com.picklist study.MaterialsAndMethods.StudyDesign.MethodOfApplication/>;</para>
                                            <para><@com.picklist study.MaterialsAndMethods.TestMaterials.FormulationType/>; </para>
                                            <para><@com.text study.MaterialsAndMethods.StudyDesign.ModeOfEfficacyAssessment/></para>
                                        <@com.emptyLine/>
                                        <@com.text study.MaterialsAndMethods.StudyDesign.DetailsOnStudyDesign/>
                                    </td>

                                <!-- Effects -->
                                    <td>
                                        <@com.text study.ResultsAndDiscussion.ResultsOnDetails/>
                                    </td>

                                <!-- Reference -->
                                    <td>
                                        <@csr.literatureReferenceList study.DataSource.Reference/>
                                    </td>
                               </tr>
                                <@csr.tableRowForJustificationForTypeOfInformation study/>

                            </#list>
                        </tbody>
                    </table>

        </#if>
</section>






<section><title role="HEAD-4">CONCLUSION ON THE EFFICACY OF THE PRODUCT </title>
    <table border="1"><title>Conclusion on the efficacy of the product</title>
        <col width="100%" />
        <tbody>
            <tr>
                <th><?dbfo bgcolor="#FBDDA6" ?><emphasis role="bold">Conclusion on the efficacy of the product</emphasis></th>
            </tr>
            <tr>
              <td>
                <#assign summaryList = iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_SUMMARY", "EffectivenessAgainstTargetOrganisms") />
                <#if summaryList?has_content>
                    <#assign printSummaryName = summaryList?size gt 1 />
                    <#list summaryList as summary>
                        <#assign valueForCsaText>                </#assign>
                        <@csr.endpointSummary summary valueForCsaText printSummaryName/>
                    </#list>
                </#if>
              </td>
            </tr>
        </tbody>
    </table>

        <!--  hier moet dan de gevraagd efficacy claim komen -->
</section>


<section><title role="HEAD-4">Occurrence of resistance and resistance management </title>
    <#assign Resistance= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !Resistance?has_content>
        No information available about resistance and appropriate management strategies.
    <#else/>
        <#list Resistance as rs>
            <emphasis role="bold">Occurrence or possible occurrence of resistance: </emphasis>
            <@com.text rs.GeneralInformation.GeneralInformationOnEffectiveness.PossibleOccurrenceOfResistance/>
            <@com.emptyLine/>
            <emphasis role="bold">Management strategies to avoid resistance: </emphasis>
            <@com.text rs.GeneralInformation.GeneralInformationOnEffectiveness.ManagementStrategiesToAvoidResistance/>
            <@com.emptyLine/>
         </#list>
    </#if>
</section>


<section><title role="HEAD-4">Known limitations </title>
    <#assign Limitations= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !Limitations?has_content>
        No information limitations known.
    <#else/>
        <#list Limitations as lm>
            <@com.text lm.GeneralInformation.GeneralInformationOnEffectiveness.AnyOtherKnownLimitationsAndManagementStrategies/>
            <@com.emptyLine/>
        </#list>
    </#if>
</section>



<section><title role="HEAD-4">Evaluation of the label claims </title>
    <!--Please include here the assessment on how efficacy of the product is reflected in the label claim.-->
    <#assign EvalClaim= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "EffectivenessAgainstTargetOrganisms") />
    <#if !EvalClaim?has_content>
        No conclusion about lable claims available.
    <#else/>
        <#list EvalClaim as ec>
            <para><@com.text ec.ApplicantSummaryAndConclusion.Conclusions/></para>
            <para><@com.richText ec.ApplicantSummaryAndConclusion.ExecutiveSummary/></para>
        </#list>
    </#if>
</section>



<section><title role="HEAD-4">Relevant information if the product is intended to be authorised for use with other biocidal product(s) </title>
    <!--Please include here any relevant info-->
<#-- If not relevant, please include: “This biocidal product (or the product’s in this meta SPC) is not intended to be used in combination with other biocidal products”.
-->
<!-- te halen uit 7.1 remarks? -->
    <#assign TogetherUse= iuclid.getSectionDocumentsForParentKey(substance.documentKey, "ENDPOINT_STUDY_RECORD", "BioIntendedUsesExposure") />
    <#if !TogetherUse?has_content>
        This biocidal product (or the product’s in this meta SPC) is not intended to be used in combination with other biocidal products.
    <#else/>
        <#list TogetherUse as tu>
            <@com.text tu.IntendedUsesAndExposure.Remarks/>
        </#list>
    </#if>
</section>





<!-- Macros and functions -->

<#function getSortedEfficacyData studyList>
    <#if !(studyList?has_content)>
        <#return []>
    </#if>
    <#local returnList = [] />
    <#list studyList as study>
        <#local endpoint = study.AdministrativeData.Endpoint />
        <#local PurposeFlag = study.AdministrativeData.PurposeFlag />
        <#if com.picklistValueMatchesPhrases(endpoint, ["efficacy data"]) && PurposeFlag?has_content >
            <#local returnList = returnList + [study] />
        </#if>
    </#list>
    <#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>

<#function getSortedFunctionData studyList>
    <#if !(studyList?has_content)>
        <#return []>
    </#if>
    <#local returnList = [] />
    <#list studyList as study>
        <#local endpoint = study.AdministrativeData.Endpoint />
        <#local PurposeFlag = study.AdministrativeData.PurposeFlag />
        <#if com.picklistValueMatchesPhrases(endpoint, ["effectiveness against target organisms and intended uses - general information"]) && PurposeFlag?has_content >
            <#local returnList = returnList + [study] />
        </#if>
    </#list>
    <#assign returnList = iuclid.sortByField(returnList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) />
    <#return returnList />
</#function>



<#macro testorganisms target>
    <#compress>
        <#if target?has_content>
            <#list target as blockItem>
                <#if blockItem.ScientificName?has_content>
                    <@com.picklist blockItem.ScientificName/>;
                </#if>
                <#if blockItem.CommonName?has_content>
                    <para> Common name: <@com.picklist blockItem.CommonName/></para>
                </#if>
                <#if blockItem.DevelopmentalStage?has_content>
                <para> Developmental stage: <@com.picklist blockItem.DevelopmentalStage/></para>
                </#if>
           </#list>
        </#if>
    </#compress>
</#macro>



