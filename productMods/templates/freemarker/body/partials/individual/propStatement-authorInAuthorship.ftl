<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for http://vivoweb.org/ontology/core#authorInAuthorship. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
 
<#import "lib-sequence.ftl" as s>
<#import "lib-datetime.ftl" as dt>

<@showAuthorship statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAuthorship statement>
    <#local resourceTitle>
        <#if statement.infoResource??>
            <a href="${profileUrl(statement.infoResource)}"  title="resource name">${statement.infoResourceName}</a>.&nbsp;
        <#else>
            <#-- This shouldn't happen, but we must provide for it -->
            <a href="${profileUrl(statement.authorship)}" title="missing resource">missing information resource</a>.&nbsp;
        </#if>
    </#local>

    <#local citationDetails>
        <#if statement.subclass??>
            <#if statement.subclass?contains("Article")>
                <#if statement.journal??>
                    <em>${statement.journal!}</em>.&nbsp;
                    <#if statement.volume?? && statement.startPage?? && statement.endPage??>
                        ${statement.volume!}:${statement.startPage!}-${statement.endPage!}.
                    <#elseif statement.volume?? && statement.startPage??>
                        ${statement.volume!}:${statement.startPage!}.
                    <#elseif statement.volume??>
                        ${statement.volume!}.
                    <#elseif statement.startPage?? && statement.endPage??>
                        ${statement.startPage!}-${statement.endPage!}.
                    <#elseif statement.startPage??>
                        ${statement.startPage!}.
                    </#if>
                </#if>
            <#elseif statement.subclass?contains("Chapter")>
                <#if statement.journal??>
                    <em>${statement.journal!}</em>.
                <#elseif statement.appearsIn??>
                    <em>${statement.appearsIn!}</em>.
                <#elseif statement.partOf??>
                    <em>${statement.partOf!}</em>.
                </#if>
                <#if statement.editor??>
                    Ed.&nbsp;${statement.editor!}.&nbsp;
                </#if>
                <#if statement.locale?? && statement.publisher??>
                    ${statement.locale!}:&nbsp;${statement.publisher!}.
                <#elseif statement.locale??>
                    ${statement.locale!}.
                <#elseif statement.publisher??>
                    ${statement.publisher!}.
                </#if>
                <#if statement.startPage?? && statement.endPage??>
                    ${statement.startPage!}-${statement.endPage!}.
                <#elseif statement.startPage??>
                    ${statement.startPage!}.
                </#if>
            <#elseif statement.subclass?contains("Book")>
                <#if statement.volume??>
                    Vol.&nbsp;${statement.volume!}.&nbsp;
                </#if>
                <#if statement.editor??>
                    Ed.&nbsp;${statement.editor!}.&nbsp;
                </#if>
                <#if statement.locale?? && statement.publisher??>
                    ${statement.locale!}:&nbsp;${statement.publisher!}.
                <#elseif statement.locale??>
                    ${statement.locale!}.
                <#elseif statement.publisher??>
                    ${statement.publisher!}.
                </#if>
            <#else>
                <#if statement.journal??>
                    <em>${statement.journal!}</em>.
                <#elseif statement.appearsIn??>
                    <em>${statement.appearsIn!}</em>.
                <#elseif statement.partOf??>
                    <em>${statement.partOf!}</em>.
                </#if>
                <#if statement.editor??>
                    Ed. ${statement.editor!}.&nbsp;
                </#if>
                <#if statement.startPage?? && statement.endPage??>
                    ${statement.startPage!}-${statement.endPage!}.
                <#elseif statement.startPage??>
                    ${statement.startPage!}.
                </#if>
            </#if>
        </#if>
    </#local>

    ${resourceTitle} ${citationDetails}  <@dt.yearSpan "${statement.dateTime!}" />

</#macro>
