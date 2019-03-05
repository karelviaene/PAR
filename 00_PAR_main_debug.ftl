<?xml version="1.0" encoding="UTF-8"?>

<!-- Import common macros and functions -->
<#import "macros_common.ftl" as com>
<#import "macros_csr.ftl" as csr>
<#import "macros_pnec.ftl" as pnec>

<!-- Variable to hold base URL -->
<#assign baseURL = "http://localhost:8080/iuclid6-web/browser/" />

<!-- PAR main template file -->
<#assign locale = "en" />
<#assign sysDateTime = .now>

<book version="5.0" xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude">

	<#assign substance = rootDocument />
	
	<#assign left_header_text = ''/> 
	<#assign central_header_text = rootDocument.name /> 
	<#assign right_header_text = ''/> 
	
	<#assign left_footer_text = sysDateTime?string["dd/MM/yyyy"] + " - IUCLID 6 " + iuclid6Version!/> 
	<#assign central_footer_text = 'Chemical Safety Report'/> 
	<#assign right_footer_text = ''/> 
	
	<#assign ownerLegalEntity = iuclid.getDocumentForKey(substance.OwnerLegalEntity) />
	<#-- Initialize assessment entity related lists -->
	<@csr.initAssessmentEntities substance/>
	
    <info>
        <title>PAR</title>
		<cover>
            <para>
				<para>
					<emphasis role="bold">Substance Name:</emphasis> <@com.text substance.MixtureName />
				</para>
			</para>
        </cover>
    </info>
	
    <chapter label="1">
		<title role="HEAD-1">ASSESSMENT REPORT</title>
            <#include "02_PAR_classification_and_labelling.ftl" encoding="UTF-8" />

			<@com.emptyLine/>
            <#include "02_PAR_phys_chem_properties.ftl" encoding="UTF-8" />

			<@com.emptyLine/>
            <#include "02_PAR_metal corrosion.ftl" encoding="UTF-8" />

			<@com.emptyLine/>
            <#include "02_PAR_Skin.ftl" encoding="UTF-8" />

			<@com.emptyLine/>
	</chapter>


</book>

<!-- Macros and functions -->

<!-- Macros to separate documents into three lists: 'study results', 'data waiving', 'testing proposal' -->

<#macro populateResultAndDataWaivingAndTestingProposalStudyLists studyList>
	<#assign resultStudyList = [] />
	<#assign dataWaivingStudyList = [] />
	<#assign testingProposalStudyList = [] />
	<#if studyList?has_content>
		<#list studyList as study>
			<#if isTestingProposalStudy(study)>
				<#assign testingProposalStudyList = testingProposalStudyList + [study] />
			<#elseif isDataWaivingStudy(study)>
				<#assign dataWaivingStudyList = dataWaivingStudyList + [study] />
			<#elseif isRelevantAdequacyOfStudy(study)>
				<#assign resultStudyList = resultStudyList + [study] />
			</#if>
		</#list>
	</#if>
	<#-- sort resultStudyList according to PurposeFlag -->
	<#-- <#assign resultStudyList = iuclid.sortByField(resultStudyList, "AdministrativeData.PurposeFlag", ["key study","supporting study","weight of evidence","disregarded due to major methodological deficiencies","other information"]) /> -->
</#macro>

<#function isRelevantAdequacyOfStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
    <#return PurposeFlag?has_content && !com.picklistValueMatchesPhrases(PurposeFlag, ["other information"]) />
</#function>

<#function isDataWaivingStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
	<#local PurposeFlag = study.AdministrativeData.PurposeFlag />
	<#local DataWaiving = study.AdministrativeData.DataWaiving />
    <#return !(PurposeFlag?has_content) && DataWaiving?has_content />
</#function>

<#function isTestingProposalStudy study>
	<#if !(study?has_content)>
		<#return false>
	</#if>
    <#return com.picklistValueMatchesPhrases(study.AdministrativeData.StudyResultType, ["experimental study planned.*"]) />
</#function>
