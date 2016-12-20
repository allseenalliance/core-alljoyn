<!--
////////////////////////////////////////////////////////////////////////////////
// Copyright AllSeen Alliance. All rights reserved.
//
//    Permission to use, copy, modify, and/or distribute this software for any
//    purpose with or without fee is hereby granted, provided that the above
//    copyright notice and this permission notice appear in all copies.
//
//    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

<xsl:param name="fileName"/>
<xsl:param name="baseFileName"/>

<xsl:template match="/">////////////////////////////////////////////////////////////////////////////////
// Copyright AllSeen Alliance. All rights reserved.
//
//    Permission to use, copy, modify, and/or distribute this software for any
//    purpose with or without fee is hereby granted, provided that the above
//    copyright notice and this permission notice appear in all copies.
//
//    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  ALLJOYN MODELING TOOL - GENERATED CODE
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  <xsl:value-of select="$baseFileName"/>.m
//
////////////////////////////////////////////////////////////////////////////////

#import "<xsl:value-of select="$baseFileName"/>.h"

<xsl:apply-templates select=".//node" mode="objc"/>

</xsl:template>

<xsl:template match="node" mode="objc">////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Bus Object implementation for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
//
////////////////////////////////////////////////////////////////////////////////

@implementation <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
<xsl:text>&#10;</xsl:text>
<xsl:apply-templates select="./interface/method" mode="objc-method-definition"/>
@end

////////////////////////////////////////////////////////////////////////////////
</xsl:template>

<xsl:template match="property" mode="objc-property-dynamic">
    <xsl:text>@dynamic </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="property" mode="objc-property-synthesize">
    <xsl:text>@synthesize </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text> = _</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="method" mode="objc-method-definition">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="." mode="objc-declaration"/>
{
    // TODO: complete the implementation of this method
    //
    @throw([NSException exceptionWithName:@"NotImplementedException" reason:@"You must implement this method" userInfo:nil]);
}
</xsl:template>

<xsl:template match="method" mode="objc-declaration">
    <xsl:text>- (</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg[@direction='out']) > 1 or count(./arg[@direction='out']) = 0">
            <xsl:text>void</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-argType"/>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg) = 0 or (count(./arg) = 1 and count(./arg[@direction='out']) = 1)">
            <xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>
            <xsl:text>:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:when>
        <xsl:when test="count(./arg[@direction='out']) > 1">
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:if test="count(./arg[@direction='out']) > 1">
                <xsl:text>&#32;</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-messageParam"/>
            <xsl:text> message:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:text> message:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-messageParam">
    <xsl:if test="position() > 1">
        <xsl:text>&#32;</xsl:text>
    </xsl:if>
    <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value" />
    <xsl:text>(</xsl:text>
        <xsl:apply-templates select="." mode="objc-argType"/>
        <xsl:if test="@direction='out'">
            <xsl:text>*</xsl:text>
        </xsl:if>
    <xsl:text>)</xsl:text>
    <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="arg" mode="objc-argType">
    <xsl:call-template name="objcArgType"/>
</xsl:template>

<xsl:template name="objcArgType">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>BOOL</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>NSNumber *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>NSString *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>NString *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='a'">
            <xsl:text>NSArray *</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>AJNMessageArgument *</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="capitalizeFirstLetterOfNameAttr">
   <xsl:variable name="value">
        <xsl:value-of select="@name"/>
   </xsl:variable>
    <xsl:variable name= "ufirstChar" select="translate(substring($value,1,1),$vLower,$vUpper)"/>
    <xsl:value-of select="concat($ufirstChar,substring($value,2))"/>
</xsl:template>

<xsl:template name="uncapitalizeFirstLetterOfNameAttr">
   <xsl:variable name="value">
        <xsl:value-of select="@name"/>
   </xsl:variable>
    <xsl:variable name= "lfirstChar" select="translate(substring($value,1,1),$vUpper,$vLower)"/>
    <xsl:value-of select="concat($lfirstChar,substring($value,2))"/>
</xsl:template>

</xsl:stylesheet>
