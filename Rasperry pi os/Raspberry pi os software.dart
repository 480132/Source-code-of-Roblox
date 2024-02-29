
// This code is running Raspberry pi! OH MY GISH
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace Raspberry pi {
namespace Reflection {

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList
#include <boost/test/unit_test.hpp>
#include <boost/test/framework.hpp>
#include "rbx/Debug.h"
#include "rbx/MathUtil.h"
#include "util/Statistics.h"
#include "GetTime.h"

#include "V8DataModel/ContentProvider.h"

#include "rbx/test/App.UnitTest.Lib.h"

using namespace RBX::Test;

BOOST_GLOBAL_FIXTURE(BaseGlobalFixture);
BOOST_GLOBAL_FIXTURE(AppGlobalFixture);

int BOOST_TEST_CALL_DECL
main( int argc, char* argv[] )
{
	unsigned statsRuns = 0;

	char** filteredArgv = new char*[argc];
	int filteredArgc = 0;

	for (int i = 0; i < argc; i++){
		unsigned runs = 0;
		if(!sscanf(argv[i], "--run_stats=%u", &runs))
		{
			if (!RBX::Test::BaseGlobalFixture::processArg(argv[i]))
				if (!RBX::Test::AppGlobalFixture::processArg(argv[i]))
					filteredArgv[filteredArgc++] = argv[i];
		}
		else
		{
			statsRuns = runs;
		}
	}	

	// prototype for user's unit test init function
#ifdef BOOST_TEST_ALTERNATIVE_INIT_API
	extern bool init_unit_test();

	boost::unit_test::init_unit_test_func init_func = &init_unit_test;
#else
	extern ::boost::unit_test::test_suite* init_unit_test_suite( int argc, char* argv[] );

	boost::unit_test::init_unit_test_func init_func = &init_unit_test_suite;
#endif
	RakNet::Time start_time = RakNet::GetTime();
	int ret = ::boost::unit_test::unit_test_main( init_func, filteredArgc, filteredArgv );


	RBX::WindowAverage<double, double> runAverage(statsRuns);
	for(unsigned iRuns = 0; iRuns < statsRuns; iRuns++)
	{
		RakNet::Time start_test_time = RakNet::GetTime();
		::boost::unit_test::framework::run();
		runAverage.sample(RakNet::GetTime() - start_test_time);
	}

	delete [] filteredArgv;
	printf("------------------ Elapsed Time : %ums --------------------\n", (unsigned int)(RakNet::GetTime() - start_time));

	if(statsRuns > 0)
	{
		RBX::WindowAverage<double, double>::Stats runStats = runAverage.getSanitizedStats();
		double confMin, confMax;
		GetConfidenceInterval(runStats.average, runStats.variance, RBX::C90, &confMin, &confMax);

		printf("Average: %.2f ms, std: %.2f ms, Confidence: %.2f-%.2f ms\n", 
			runStats.average, sqrt(runStats.variance), confMin, confMax);
	}
	return ret;
}

extern bool init_unit_test()
{
	boost::unit_test::framework::master_test_suite().p_name.value = "App";	
	return true;
}

boost::unit_test::test_suite* init_unit_test_suite( int argc, char* argv[] )
{
	init_unit_test();
	return 0;
}
(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class _$RecordTypeBuilder extends RecordTypeBuilder {
  _$RecordType? _$v;

  @override
  ListBuilder<Reference> get positionalFieldTypes {
    _$this;
    return super.positionalFieldTypes;
  }

  @override
  set positionalFieldTypes(ListBuilder<Reference> positionalFieldTypes) {
    _$this;
    super.positionalFieldTypes = positionalFieldTypes;
  }

  @override
  MapBuilder<String, Reference> get namedFieldTypes {
    _$this;
    return super.namedFieldTypes;
  }
// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  @override
  set namedFieldTypes(MapBuilder<String, Reference> namedFieldTypes) {
    _$this;
    super.namedFieldTypes = namedFieldTypes;
  }

  @override
  bool? get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool? isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  _$RecordTypeBuilder() : super._();

  RecordTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      super.positionalFieldTypes = $v.positionalFieldTypes.toBuilder();
      super.namedFieldTypes = $v.namedFieldTypes.toBuilder();
      super.isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecordType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecordType;
  }

  @override
  void update(void Function(RecordTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecordType build() => _build();

  _$RecordType _build() {
    _$RecordType _$result;
    try {
      _$result = _$v ??
          new _$RecordType._(
              positionalFieldTypes: positionalFieldTypes.build(),
              namedFieldTypes: namedFieldTypes.build(),
              isNullable: isNullable);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'positionalFieldTypes';
        positionalFieldTypes.build();
        _$failedField = 'namedFieldTypes';
        namedFieldTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecordType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

  @override
  BuiltList<Reference> get types;

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? get isNullable;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitType(this, context);

  @override
  Expression get expression => CodeExpression(Code.scope((a) => a(this)));

  @override
  TypeReference get type => this;

  @override
  Expression newInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression newInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.newOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );

  @override
  Expression constInstance(
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
      );

  @override
  Expression constInstanceNamed(
    String name,
    Iterable<Expression> positionalArguments, [
    Map<String, Expression> namedArguments = const {},
    List<Reference> typeArguments = const [],
  ]) =>
      InvokeExpression.constOf(
        this,
        positionalArguments.toList(),
        namedArguments,
        typeArguments,
        name,
      );
}

abstract class TypeReferenceBuilder extends Object
    with HasGenericsBuilder
    implements Builder<TypeReference, TypeReferenceBuilder> {
  factory TypeReferenceBuilder() = _$TypeReferenceBuilder;

  TypeReferenceBuilder._();

  String? symbol;

  String? url;

  /// Optional bound generic.
  Reference? bound;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  /// Optional nullability.
  ///
  /// An emitter may ignore this if the output is not targeting a Dart language
  /// version that supports null safety.
  bool? isNullable;
}
/**
 * AuthenticationHelper.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"
#include "AuthenticationHelper.h"

// Qt Headers
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkInterface>
#include <QTimer>
#include <QCoreApplication>
#include <QTime>
#include <QtConcurrentRun>

// Roblox Headers
#include "util/standardout.h"
#include "util/Http.h"
#include "util/Statistics.h"
#include "RobloxServicesTools.h"

// Roblox Studio Headers
#include "RobloxNetworkAccessManager.h"
#include "RobloxSettings.h"
#include "QtUtilities.h"
#include "UpdateUIManager.h"
#include "RobloxNetworkReply.h"
#include "RobloxMainWindow.h"
#include "RobloxCookieJar.h"

#include "Util/RobloxGoogleAnalytics.h"
#include "Util/MachineIdUploader.h"
#include "V8DataModel/ContentProvider.h"
#include "RobloxWebDoc.h"
#include "RobloxDocManager.h"

#include "RobloxServicesTools.h"

FASTFLAG(GoogleAnalyticsTrackingEnabled)
FASTFLAGVARIABLE(StudioInSyncWebKitAuthentication, false)
FASTFLAGVARIABLE(UseAssetGameSubdomainForGetCurrentUser, true)
FASTFLAG(UseBuildGenericGameUrl)


//////////////////////////////////////////////////////////////////////////////////////////////////////
// AuthenticationHelper
QString AuthenticationHelper::userAgentStr = "";
bool AuthenticationHelper::httpAuthenticationPending = false;
bool AuthenticationHelper::verifyUserAuthenticationPending = false;
bool AuthenticationHelper::previouslyAuthenticated = false;

QString AuthenticationHelper::getLoggedInUserUrl()
{
    QString result;
    if (FFlag::UseBuildGenericGameUrl) {
        result = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/GetCurrentUser.ashx"));
    }
    else
    {
        result = RobloxSettings::getBaseURL() + "/game/GetCurrentUser.ashx";
    }
    
    if (FFlag::UseAssetGameSubdomainForGetCurrentUser)
	{
		return QString::fromStdString(
			ReplaceTopSubdomain(result.toStdString(), "assetgame"));
	}
	return result;
}

bool AuthenticationHelper::verifyUserAndAuthenticate(int timeOutTime)
{
	if (verifyUserAuthenticationPending || httpAuthenticationPending)
		return false;
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup>
    <Filter Include="Source Files">
      <UniqueIdentifier>{4FC737F1-C7A5-4376-A066-2A32D752A2FF}</UniqueIdentifier>
      <Extensions>cpp;c;cc;cxx;def;odl;idl;hpj;bat;asm;asmx</Extensions>
    </Filter>
    <Filter Include="Header Files">
      <UniqueIdentifier>{93995380-89BD-4b04-88EB-625FBE52EBFB}</UniqueIdentifier>
      <Extensions>h;hpp;hxx;hm;inl;inc;xsd</Extensions>
    </Filter>
    <Filter Include="Resource Files">
      <UniqueIdentifier>{67DA6AB6-F800-4c08-8B7A-83BB121AAD01}</UniqueIdentifier>
      <Extensions>rc;ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;resx;tiff;tif;png;wav</Extensions>
    </Filter>
    <Filter Include="Libraries">
      <UniqueIdentifier>{323fa198-1a0b-4040-a05b-6094f1b8669f}</UniqueIdentifier>
    </Filter>
  </ItemGroup>
  <ItemGroup>
    <ClCompile Include="App.UnitTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="AutowedgeTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Base64BinaryStreamTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ChatTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterChangeHistoryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterDeprecatedPropertyTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ClusterReplicationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ContentProviderTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="CustomEvents.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\ClientShared\DataModelSerialize.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="FastLogSettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="G3D.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HTTPTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Instance.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaReflection.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaSandbox.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaTokenizer.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaVector3Test.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MD5.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MemoryTests.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="MiscRegression.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="Network.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="NetworkSecurity.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RakNet.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RaycastTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReflectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="RemoteSignal.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SettingsURL.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialHashTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StatsServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ToolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="URLParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebParserTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="WebSerializerTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="XmlElement.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="VoxelCellUtilV1Deprecated.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HeapValueTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HumanoidTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SerializationTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SpatialRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaDebugger.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorGcJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ReplicatorStreamJobTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="StreamRegionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ThreadPoolTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="ModuleScriptTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LuaYieldingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="PathfindingTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="..\App\script\LuaVMDummy.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="HttpCacheEntryTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="SelectionTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
    <ClCompile Include="LogServiceTest.cpp">
      <Filter>Source Files</Filter>
    </ClCompile>
  </ItemGroup>
  <ItemGroup>
    <ClInclude Include="StdAfx.h">
      <Filter>Header Files</Filter>
    </ClInclude>
    <ClInclude Include="VoxelCellUtilV1Deprecated.h">
      <Filter>Header Files</Filter>
    </ClInclude>
  </ItemGroup>
  <ItemGroup>
    <Text Include="TestSettings.txt">
      <Filter>Resource Files</Filter>
    </Text>
  </ItemGroup>
  <ItemGroup>
    <PublishDLLDependency Include="..\VMProtect\VMProtectSDK32.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
    <PublishDLLDependency Include="..\fmod\win32\fmod.dll">
      <Filter>Libraries</Filter>
    </PublishDLLDependency>
  </ItemGroup>
</Project>
	verifyUserAuthenticationPending = true;
	bool result = true;	
	try
	{
		QString	requestUserUrl = getLoggedInUserUrl();
		QUrl url(requestUserUrl);

		QNetworkRequest networkRequest(url);
		networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
		RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
		
		if (!networkReply->waitForFinished(timeOutTime, 100))
		{
				verifyUserAuthenticationPending = false;
			networkReply->deleteLater();
				RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to get current user. Request timed out.");
				networkReply->deleteLater();
				RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);
                if (FFlag::GoogleAnalyticsTrackingEnabled)
					RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
				return false;
			}

		// Get the logged in user Webkit
		QString userIdWebkit(networkReply->readAll());
		int statusCode = networkReply->error();
		networkReply->deleteLater();

        switch (statusCode)
        {
            case QNetworkReply::NoError:
            {
                if(userIdWebkit.toInt() > 0)
                {
                    // Get the logged in user HTTP
					QString currentUser = getLoggedInUserUrl();
                    QString userIdHttp = doHttpGetRequest(currentUser);

                    // If different authenticate the HTTP layer with the webkit user
                    if(userIdHttp != userIdWebkit)
                        result = authenticateHttpLayer();
                }
                else
                {
                    // Sync with HTTP layer: Curl will be using the saved cookie file if any, to login!
					result = authenticateWebKitFromHttp();
					if (!result)
					{
						// Error (probably user not authenticated) time to logout the user from Http
						deAuthenticateHttpLayer();
						result = false;
					}
                }

                break;
            }
            default:
            {
                // Error (probably user not authenticated) time to logout the user from Http
                deAuthenticateHttpLayer();
                result = false;
                break;
            }
        }
	}
	catch (std::exception const& e) 
	{
		result = false;
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());

		RobloxMainWindow::sendCounterEvent("StudioAuthenticationFailure", false);

        if (FFlag::GoogleAnalyticsTrackingEnabled)
		{
			RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_ERROR, "StudioAuthenticationFailure");
		}
	}

	verifyUserAuthenticationPending = false;
	return result;
}


int AuthenticationHelper::getHttpUserId()
{
	QString currentUser = getLoggedInUserUrl();
	QString userIdHttp = doHttpGetRequest(currentUser);
	
	bool ok;
	int result = userIdHttp.toInt(&ok, 10);
	if (!ok)
	{
		return 0;
	}
	return result;
}

/*
* Gets user-id of the user logged into webkit layer
* @Returns: user-id, 0 if no user is logged in
*/
int AuthenticationHelper::getWebKitUserId()
{
	QString	requestUserUrl = getLoggedInUserUrl();
	QUrl url(requestUserUrl);

	int userId = 0;

	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply && networkReply->waitForFinished(5000, 100) && (networkReply->error() == QNetworkReply::NoError))
	{
		QString userIdWebkit(networkReply->readAll());
		userId = userIdWebkit.toInt();
		networkReply->deleteLater();
	}
	return userId;
}

bool AuthenticationHelper::authenticateHttpLayer()
{	
	Q_EMIT authenticationChanged(true);
	Q_EMIT authenticationDone(true);
	return true;
}

void AuthenticationHelper::deAuthenticateHttpLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(),"game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    //
	doHttpGetRequest(logoutUrl);

	Q_EMIT authenticationChanged(false);
}


QString AuthenticationHelper::generateAuthenticationUrl(const QString& authUrl, const QString& ticket)
{	
	QString compoundStr(authUrl);
	if (!ticket.isEmpty()) 
	{
		compoundStr.append("?suggest=");
		compoundStr.append(ticket);
	}
	return compoundStr;
}

int AuthenticationHelper::authenticateWebKitFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		return doWebKitAuthentication(generateAuthenticationUrl(url, ticket));
	}

	return 0;
}

/*
* Authenticate the webkit layer by making a request to this url.  Follows redirects recursively.
* @Returns: status code of response
*/
int AuthenticationHelper::doWebKitAuthentication(const QString& url)
{
	QNetworkRequest networkRequest(url);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", QByteArray(GetBaseURL().c_str(), GetBaseURL().length()));
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply *networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);

	if (!networkReply->waitForFinished(5000, 100)) 
		return 0; // timed out
    
    networkReply->deleteLater();
			
	return networkReply->statusCode();
}

/*
* De-authenticate the webkit layer.
*/
void AuthenticationHelper::deAuthenticateWebKitLayer()
{	
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
	QNetworkRequest networkRequest(logoutUrl);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 
	RobloxNetworkReply* networkReply = RobloxNetworkAccessManager::Instance().get(networkRequest);
	if (networkReply)
	{
		networkReply->waitForFinished(5000, 100);
		networkReply->deleteLater();
	}
}

/*
* Authenticate the WinINet layer by making a request to this url.
* @Returns: userId of authenticated user, empty if failed
*/
QString AuthenticationHelper::authenticateWinINetFromUrlWithTicket(const QString& url, const QString& ticket)
{
	if(!url.isEmpty() && !ticket.isEmpty())
	{
		QString compoundStr = generateAuthenticationUrl(url, ticket);
		return doHttpGetRequest(compoundStr);
	}

	return "";
}
QString AuthenticationHelper::doHttpGetRequest(const QString& str, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	std::string result = "";
	try 
	{
		QByteArray ba = str.toAscii();
		const char *c_str = ba.data();

		RBX::Http http(c_str);
#ifdef Q_WS_MAC
			http.setAuthDomain(::GetBaseURL());
#else
			http.additionalHeaders["RBXAuthenticationNegotiation:"] = ::GetBaseURL();
#endif
		http.additionalHeaders.insert(externalHeaders.begin(), externalHeaders.end());
		http.get(result);
	}
	catch (std::exception& e) 
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, e.what());
		return "";
	}

	return QString::fromStdString(result);
}

AuthenticationHelper::AuthenticationHelper()
: m_CurrentHttpRequestState(-1)
, m_bHttpSessionAuthenticationState(false)
, m_bIgnoreFinishedSignal(false)
{
	userAgentStr = RobloxNetworkAccessManager::Instance().getUserAgent();
	if (FFlag::StudioInSyncWebKitAuthentication)
		qApp->installEventFilter(this);
    
	connect(&RobloxNetworkAccessManager::Instance(), SIGNAL(sslErrors(QNetworkReply*, const QList<QSslError> & )),
			this, SLOT(onSSLErrors(QNetworkReply*, const QList<QSslError> & )));

	connect(&m_HttpAuthenticationFutureWatcher, SIGNAL(finished()), this, SLOT(httpSessionAuthenticationDone()));
}

bool AuthenticationHelper::validateMachine()
{
	return RBX::MachineIdUploader::uploadMachineId(qPrintable(RobloxSettings::getBaseURL()))
		!= RBX::MachineIdUploader::RESULT_MachineBanned;
}

bool AuthenticationHelper::eventFilter(QObject * watched, QEvent * evt)
{
	QEvent::Type eventType = evt->type();

	if (eventType == QEvent::ApplicationDeactivate)
	{
        // save webkit cookies
		savedCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
	}
	else if (eventType == QEvent::ApplicationActivate)
	{
		QString currentCookieKey = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (QString::compare(savedCookieKey, currentCookieKey, Qt::CaseSensitive) != 0)	
		{
			// if we've some cookies saved, then authenticate studio with the saved cookies
			if (!currentCookieKey.isEmpty())
			{
				RobloxNetworkAccessManager::Instance().cookieJar()->reloadCookies(true);
			}
			// if no cookies, just deauthenticate http layer too
			else
			{
				deAuthenticateWebKitLayer();
			}

			// to avoid multiple reload of start page, we must call refresh here
			RobloxWebDoc* startPage = dynamic_cast<RobloxWebDoc*>(RobloxDocManager::Instance().getStartPageDoc());
			if (startPage)
				startPage->refreshPage();

			// http user and webkit user must be in sync
			RBXASSERT(getHttpUserId() == getWebKitUserId());
		}
	}
	
	return QObject::eventFilter(watched, evt);
}

int AuthenticationHelper::authenticateWebKitFromHttp()
{
	// first verify is we've an user id for http, if not then just return
	if (getHttpUserId() <=0 )
		return 0;

	QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
	requestURL.replace("http", "https");
	// need to add user agent, to make sure we get authorization URL
	RBX::HttpAux::AdditionalHeaders externalHeaders;
	externalHeaders["User-Agent"] =  userAgentStr.toStdString();
	// got the URL, now we can authorize webkit
    QString returnURL = doHttpGetRequest(requestURL, externalHeaders);
	if (!returnURL.isEmpty())
		return doWebKitAuthentication(returnURL);

	return 0;
}

void AuthenticationHelper::onSSLErrors(QNetworkReply* networkReply, const QList<QSslError> & errlist)
{
    QString urlString = networkReply->url().toString();
    if (urlString.contains(".robloxlabs.com"))
        networkReply->ignoreSslErrors();
}

void AuthenticationHelper::authenticateUserAsync(const QString& url, const QString& ticket)
{
	if (!url.isEmpty() && !ticket.isEmpty())
	{
        // make sure network manager instance get's created in Main thread
        RobloxNetworkAccessManager::Instance();
        
		QString authenticationUrl = generateAuthenticationUrl(url, ticket);

		m_CurrentHttpRequestState = true;

		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession, authenticationUrl);
		m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);

		m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession, authenticationUrl);
		m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
	}
	else
	{
		// if we do not have security cookie, then try to authentication using Http session
		QString secCookie = RobloxNetworkAccessManager::Instance().cookieJar()->getCookieValue(RobloxSettings::getBaseURL(), ".ROBLOSECURITY");
		if (secCookie.isEmpty())
		{
			m_QtWebkitAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateQtWebkitSession);
			m_QtWebkitAuthenticationFutureWatcher.setFuture(m_QtWebkitAuthenticationFuture);
		}
		else
		{
			m_CurrentHttpRequestState = true;

			m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
			m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
		}
	}
}

void AuthenticationHelper::authenticateHttpSessionAsync(bool state)
{
	// if the authentication state is same as the requested then do nothing
	if (state && m_bHttpSessionAuthenticationState)
		return;

	// if either of the concurrent jobs are running then we will have the authentication done
	if (((int)state == m_CurrentHttpRequestState) && (m_HttpAuthenticationFutureWatcher.isRunning() || m_QtWebkitAuthenticationFuture.isRunning()))
		return;

	// make sure there's no other http authentication request is running
	waitForHttpAuthentication();
	m_CurrentHttpRequestState = state;

	if (state)
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::authenticateHttpSession);
	}
	else
	{
		m_HttpAuthenticationFuture = QtConcurrent::run(this, &AuthenticationHelper::deAuthenticateHttpSession);
	}

	m_HttpAuthenticationFutureWatcher.setFuture(m_HttpAuthenticationFuture);
}

bool AuthenticationHelper::authenticateHttpSession(const QString& authenticationURL)
{
	return getHttpRequest(authenticationURL).isEmpty();
}

bool AuthenticationHelper::authenticateHttpSession()
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QString authRequest = baseURL + "/login/RequestAuth.ashx";
	authRequest.replace("http", "https");

	QNetworkRequest networkRequest(authRequest);
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii()); 

	// we need to create new AccessManager as we are in a different thread, also set cookies loaded from disk to new cookiejar
	QNetworkCookieJar* cookieJar = new QNetworkCookieJar;
	cookieJar->setCookiesFromUrl(RobloxNetworkAccessManager::Instance().cookieJar()->cookiesForUrl(baseURL), baseURL);

	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	accessManager->setCookieJar(cookieJar);

	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();

	RobloxNetworkReply* rbxNetworkReply = new RobloxNetworkReply(networkReply, true);
	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->error() == QNetworkReply::NoError)
		{
			result = getHttpRequest(rbxNetworkReply->readAll()).isEmpty();
		}
		else
		{
			m_CurrentHttpRequestState = false;
			result = deAuthenticateHttpSession();
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::deAuthenticateHttpSession()
{
    QString logoutUrl;
    if (FFlag::UseBuildGenericGameUrl)
    {
        logoutUrl = QString::fromStdString(BuildGenericGameUrl(RobloxSettings::getBaseURL().toStdString(), "game/logout.aspx"));
    }
    else
    {
        logoutUrl = RobloxSettings::getBaseURL() + "/game/logout.aspx";
    }
    getHttpRequest(logoutUrl);
	return true;
}

bool AuthenticationHelper::authenticateQtWebkitSession(const QString& authenticationUrl)
{
	bool result = false;
	QString baseURL = RobloxSettings::getBaseURL();

	QNetworkRequest networkRequest(authenticationUrl);
	networkRequest.setRawHeader("RBXAuthenticationNegotiation:", baseURL.toAscii());
	networkRequest.setRawHeader("User-Agent", userAgentStr.toAscii());

	// we need to create new AccessManager as we are in a different thread
	QNetworkAccessManager* accessManager = new QNetworkAccessManager;
	QNetworkReply* networkReply = accessManager->get(networkRequest);
	if (baseURL.contains(".robloxlabs.com"))
		networkReply->ignoreSslErrors();
	RobloxNetworkReply*  rbxNetworkReply = new RobloxNetworkReply(networkReply, true);

	if (rbxNetworkReply->waitForFinished(10000, 100))
	{
		if (rbxNetworkReply->statusCode() == 200)
		{
			// pass on the cookies from authenticated session to the static network access manager's cookiejar
			RobloxNetworkAccessManager::Instance().cookieJar()->setCookiesFromUrl(accessManager->cookieJar()->cookiesForUrl(baseURL), baseURL);
			result = true;
		}
	}
	else
	{
		RBX::StandardOut::singleton()->print(RBX::MESSAGE_ERROR, "Unable to authenticate user. Request timed out.");
	}

	rbxNetworkReply->deleteLater();
	accessManager->deleteLater();

	return result;
}

bool AuthenticationHelper::authenticateQtWebkitSession()
{
	// check if already authenticated
	QString result = getHttpRequest(getLoggedInUserUrl());
    int httpUserId = result.toInt();
    // if authenticated then authenticate webkit session too
	if (httpUserId > 0)
	{
		QString requestURL = RobloxSettings::getBaseURL() + "/login/RequestAuth.ashx";
		requestURL.replace("http", "https");

		// need to add user agent, to make sure we get authorization URL
		RBX::HttpAux::AdditionalHeaders externalHeaders;
		externalHeaders["User-Agent"] =  userAgentStr.toStdString();

		// get negotiate URL and authenticate QtWebkit using this
		QString negotiateURL = getHttpRequest(requestURL, externalHeaders);
		if (!negotiateURL.isEmpty())
			return authenticateQtWebkitSession(negotiateURL);
	}

	return false;
}

QString AuthenticationHelper::getHttpRequest(const QString& urlString, const RBX::HttpAux::AdditionalHeaders& externalHeaders)
{
	static QMutex httpRequestMutex;
	QMutexLocker lock(&httpRequestMutex);

	RBX::HttpOptions options;
	options.addHeader("RBXAuthenticationNegotiation:", ::GetBaseURL());

	for (RBX::HttpAux::AdditionalHeaders::const_iterator iter = externalHeaders.begin(); iter != externalHeaders.end(); ++iter)
		options.addHeader(iter->first, iter->second);
	
	RBX::HttpFuture request = RBX::HttpAsync::get(urlString.toStdString(), options);
	std::string result;

	try
	{
		result = request.get();
	}
	catch (const RBX::base_exception& e)
	{
		RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Error while authenticating user: %s", e.what());
	}

	return QString::fromStdString(result);
}

void AuthenticationHelper::httpSessionAuthenticationDone()
{
	if (m_bIgnoreFinishedSignal)
	{
		m_bIgnoreFinishedSignal = false;
		return;
	}

	RBXASSERT(m_CurrentHttpRequestState != -1);

	bool requestedState = (bool)m_CurrentHttpRequestState;
	m_CurrentHttpRequestState = -1;

	if (m_HttpAuthenticationFutureWatcher.result())
	{
		m_bHttpSessionAuthenticationState = requestedState;
		Q_EMIT authenticationChanged(requestedState);
	}
	else
	{
		m_bHttpSessionAuthenticationState = false;
	}
}

void AuthenticationHelper::waitForHttpAuthentication() 
{
	if (m_HttpAuthenticationFutureWatcher.isRunning())
	{
		m_HttpAuthenticationFutureWatcher.waitForFinished();
		// if a function is waiting for authentication to complete then call 'httpSessionAuthenticationDone' here itself
		httpSessionAuthenticationDone();
		// make sure we do not calling 'httpSessionAuthenticationDone' again called on 'finished' signal
		m_bIgnoreFinishedSignal = true;
	}
}

void AuthenticationHelper::waitForQtWebkitAuthentication() 
{
	if (m_QtWebkitAuthenticationFutureWatcher.isRunning())
		m_QtWebkitAuthenticationFutureWatcher.waitForFinished();
}
/**
 * AuthoringSettings.cpp
 * Copyright (c) 2013 ROBLOX Corp. All Rights Reserved.
 */

#include "stdafx.h"

// Qt Headers
#include <QDesktopServices>
#include <qmath.h>

// Roblox Headers
#include "v8datamodel/Camera.h"
#include "tool/ToolsArrow.h"
#include "tool/AdvRunDragger.h"
#include "AppDraw/Draw.h"
#include "script/script.h"

// Roblox Studio Headers
#include "AuthoringSettings.h"
#include "RobloxSettings.h"
#include "QFontBoundProp.h"
#include "QDirBoundProp.h"
#include "MobileDevelopmentDeployer.h"

#include "util/RobloxGoogleAnalytics.h"

FASTFLAG(LuaDebugger)
FASTFLAG(LuaDebuggerBreakOnError)

FASTFLAG(StudioSettingsGAEnabled)
FASTFLAG(StudioUseDraggerGrid)

RBX_REGISTER_CLASS(AuthoringSettings);
RBX_REGISTER_ENUM(AuthoringSettings::PermissionLevelShown);
RBX_REGISTER_ENUM(AuthoringSettings::HoverAnimateSpeed);
RBX_REGISTER_ENUM(AuthoringSettings::OutputLayoutMode);
RBX_REGISTER_ENUM(AuthoringSettings::ListDisplayMode);
RBX_REGISTER_ENUM(AuthoringSettings::UIStyle);
RBX_REGISTER_ENUM(AuthoringSettings::TestServerAudioBehavior);

const char* const sAuthoringSettings = "Studio";
const char* const sScriptCategoryName = "Script Editor";
const char* const sScriptColorsCategoryName = "Script Editor Colors";

// AutoSave
RBX::Reflection::BoundProp<QDir> prop_AutoSaveDir("Auto-Save Path", "Auto-Save", &AuthoringSettings::autoSaveDir);
RBX::Reflection::BoundProp<bool> prop_AutoSaveEnable("Auto-Save Enabled", "Auto-Save", &AuthoringSettings::autoSaveEnabled);
RBX::Reflection::BoundProp<int> prop_AutoSaveMinutes("Auto-Save Interval (Minutes)", "Auto-Save", &AuthoringSettings::autoSaveMinutesInterval);

// Browsing
RBX::Reflection::BoundProp<bool> prop_ShowDepricatedItems("DeprecatedObjectsShown", "Browsing", &AuthoringSettings::showDeprecated);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::PermissionLevelShown> prop_PermissionLevelShown("PermissionLevelShown", "Browsing", &AuthoringSettings::getPermissionLevelShown, &AuthoringSettings::setPermissionLevelShown);

// Scripting - all script properties must be in sScriptCategoryName or ScriptTextEditor::onPropertyChange will not update properly
RBX::Reflection::BoundProp<int> prop_EditorTabWidth("Tab Width", sScriptCategoryName, &AuthoringSettings::editorTabWidth);
RBX::Reflection::BoundProp<bool> prop_EditorAutoIndent("Auto Indent", sScriptCategoryName, &AuthoringSettings::editorAutoIndent);
RBX::Reflection::BoundProp<QFont> prop_EditorFont("Font", sScriptCategoryName, &AuthoringSettings::editorFont);
RBX::Reflection::BoundProp<bool> prop_EditorTextWrap("Text Wrapping", sScriptCategoryName, &AuthoringSettings::editorTextWrap);

// Script Colors - all script properties must be in sScriptColorsCategoryName or ScriptSyntaxHighlighter::onPropertyChange will not update properly
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorTextColor("Text Color", sScriptColorsCategoryName, &AuthoringSettings::editorTextColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorBackgroundColor("Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionColor("Selection Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorSelectionBackgroundColor("Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorSelectionBackgroundColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorOperatorColor("Operator Color", sScriptColorsCategoryName, &AuthoringSettings::editorOperatorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorNumberColor("Number Color", sScriptColorsCategoryName, &AuthoringSettings::editorNumberColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorStringColor("String Color", sScriptColorsCategoryName, &AuthoringSettings::editorStringColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorCommentColor("Comment Color", sScriptColorsCategoryName, &AuthoringSettings::editorCommentColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorPreprocessorColor("Preprocessor Color", sScriptColorsCategoryName, &AuthoringSettings::editorPreprocessorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorKeywordColor("Keyword Color", sScriptColorsCategoryName, &AuthoringSettings::editorKeywordColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorErrorColor("Error Color", sScriptColorsCategoryName, &AuthoringSettings::editorErrorColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorWarningColor("Warning Color", sScriptColorsCategoryName, &AuthoringSettings::editorWarningColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_EditorFindSelectionBackgroundColor("Find Selection Background Color", sScriptColorsCategoryName, &AuthoringSettings::editorFindSelectionBackgroundColor);

// General
RBX::Reflection::BoundProp<bool> prop_AlwaysSaveScriptChangesWhileRunning("Always Save Script Changes", "General", &AuthoringSettings::alwaysSaveScriptChangesWhileRunning);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::ListDisplayMode> prop_BasicObjectsDisplayMode("Basic Objects Display Mode","General",&AuthoringSettings::getBasicObjectsDisplayMode,&AuthoringSettings::setBasicObjectsDisplayMode);
RBX::Reflection::BoundProp<int> prop_MaximumOutputLines("Maximum Output Lines", "General", &AuthoringSettings::maximumOutputLines);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::OutputLayoutMode> prop_OutputLayoutMode("Output Layout Mode", "General", &AuthoringSettings::getOutputLayoutMode, &AuthoringSettings::setOutputLayoutMode);
RBX::Reflection::BoundProp<int> prop_RenderThrottlePercentage("Render Throttle Percentage", "General", &AuthoringSettings::renderThrottlePercentage);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, AuthoringSettings::UIStyle> prop_UIStyle("UI Style", "General", &AuthoringSettings::getUIStyle, &AuthoringSettings::setUIStyle);
RBX::Reflection::BoundProp<bool> prop_ClearOuputOnStart("Clear Output On Start", "General", &AuthoringSettings::clearOutputOnStart);

// Directories
RBX::Reflection::BoundProp<QDir> prop_DefaultScriptFileDir("DefaultScriptFileDir", "Directories", &AuthoringSettings::defaultScriptFileDir);
RBX::Reflection::BoundProp<QDir> prop_PluginsDir("PluginsDir", "Directories", &AuthoringSettings::pluginsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, QDir> prop_CoreScriptsDir("OverrideCoreScriptsDir", "Directories", &AuthoringSettings::getCoreScriptsDir, &AuthoringSettings::setCoreScriptsDir);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_useCoreScriptsDir("OverrideCoreScripts", "Directories",  &AuthoringSettings::getOverrideCoreScripts, &AuthoringSettings::setOverrideCoreScripts);
RBX::Reflection::BoundProp<QDir> prop_RecentSavesDir("RecentSavesDir", "Directories", &AuthoringSettings::recentSavesDir);

// Colors
RBX::Reflection::BoundProp<G3D::Color3> prop_SelectColor("Select Color", "Colors", &AuthoringSettings::selectColor);
RBX::Reflection::BoundProp<G3D::Color3> prop_HoverOverColor("Hover Over Color", "Colors", &AuthoringSettings::hoverOverColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, G3D::Color3> prop_PrimaryPartSelectColor("Select/Hover Color", "Primary Part", &AuthoringSettings::getPrimaryPartSelectColor, &AuthoringSettings::setPrimaryPartSelectColor);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_PrimaryPartLineThickness("Line Thickness", "Primary Part", &AuthoringSettings::getPrimaryPartLineThickness, &AuthoringSettings::setPrimaryPartLineThickness);

// Undo
RBX::Reflection::EnumPropDescriptor<AuthoringSettings, RBX::ChangeHistoryService::RuntimeUndoBehavior> prop_RuntimeUndoBehavior("RuntimeUndoBehavior", "Undo", &AuthoringSettings::getRuntimeUndoBehavior, &AuthoringSettings::setRuntimeUndoBehavior);

// Camera
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraKeyMoveSpeed("Camera Speed", "Camera", &AuthoringSettings::getCameraKeyMoveSpeed, &AuthoringSettings::setCameraKeyMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraShiftMoveSpeed("Camera Shift Speed", "Camera", &AuthoringSettings::getCameraShiftMoveSpeed, &AuthoringSettings::setCameraShiftMoveSpeed);
RBX::Reflection::PropDescriptor<AuthoringSettings, float> prop_CameraMouseWheelMoveSpeed("Camera Mouse Wheel Speed", "Camera", &AuthoringSettings::getCameraMouseWheelMoveSpeed, &AuthoringSettings::setCameraMouseWheelMoveSpeed);

// Tools
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showDraggerGrid("Show Dragger Grid", "Tools", &AuthoringSettings::getShowDraggerGrid, &AuthoringSettings::setShowDraggerGrid);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_showHoverOver("Show Hover Over", "Tools", &AuthoringSettings::getShowHoverOver, &AuthoringSettings::setShowHoverOver);
RBX::Reflection::BoundProp<bool> prop_AnimateHoverOver("Animate Hover Over", "Tools", &AuthoringSettings::animateHoverOver);
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::HoverAnimateSpeed> prop_HoverAnimateSpeed("Hover Animate Speed","Tools",&AuthoringSettings::getHoverAnimateSpeed,&AuthoringSettings::setHoverAnimateSpeed);

// Lua Debugger
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_LuaDebuggerEnabled("LuaDebuggerEnabled", "Lua Debugger", &AuthoringSettings::getLuaDebuggerEnableState, &AuthoringSettings::setLuaDebuggerEnableState);

// Mobile Deployment
RBX::Reflection::PropDescriptor<AuthoringSettings, int> prop_DeploymentPairing("Device Pairing Code", "Device Deployment", &AuthoringSettings::getDeviceDeploymentPairingCode, &AuthoringSettings::setDeviceDeploymentPairingCode);

// Advanced
RBX::Reflection::BoundProp<bool> prop_diagnosticsBarEnabled("Show Diagnostics Bar", "Advanced", &AuthoringSettings::diagnosticsBarEnabled);
RBX::Reflection::BoundProp<bool> prop_intellisenseEnabled("Enable Intellisense", "Advanced", &AuthoringSettings::intellisenseEnabled);
RBX::Reflection::PropDescriptor<AuthoringSettings, bool> prop_dragMultiPartsAsSinglePartEnabled("Drag Multiple Parts As Single Part", "Advanced", &AuthoringSettings::getDragMutliplePartsAsSinglePart, &AuthoringSettings::setDragMutliplePartsAsSinglePart);

// Audio
RBX::Reflection::EnumPropDescriptor<AuthoringSettings,AuthoringSettings::TestServerAudioBehavior> prop_testServerAudioBehavior("Server Audio Behavior","Audio",&AuthoringSettings::getTestServerAudioBehavior,&AuthoringSettings::setTestServerAudioBehavior);
RBX::Reflection::BoundProp<bool> prop_onlyPlayAudioInFocus("Only Play Audio from Window in Focus", "Audio", &AuthoringSettings::onlyPlayFocusWindowAudio);

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::PermissionLevelShown>::EnumDesc()
		:EnumDescriptor("PermissionLevelShown")
	{
		addPair(AuthoringSettings::Game,         "Game" );
		addPair(AuthoringSettings::RobloxGame,   "RobloxGame" );
		addPair(AuthoringSettings::RobloxScript, "RobloxScript" );
		addPair(AuthoringSettings::Studio,       "Studio" );
		addPair(AuthoringSettings::Roblox,       "Roblox" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::HoverAnimateSpeed>::EnumDesc()
		:EnumDescriptor("HoverAnimateSpeed")
	{
        addPair(AuthoringSettings::VerySlow,    "VerySlow" );
		addPair(AuthoringSettings::Slow,        "Slow" );
		addPair(AuthoringSettings::Medium,      "Medium" );
		addPair(AuthoringSettings::Fast,        "Fast" );
		addPair(AuthoringSettings::VeryFast,    "VeryFast" );
	}
}}

namespace RBX {
namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::ListDisplayMode>::EnumDesc()
		:EnumDescriptor("ListDisplayMode")
	{
        addPair(AuthoringSettings::Horizontal,  "Horizontal" );
        addPair(AuthoringSettings::Vertical,    "Vertical" );
	}
}}

namespace RBX {
    namespace Reflection {
        template<>
        EnumDesc<AuthoringSettings::OutputLayoutMode>::EnumDesc()
            :EnumDescriptor("OutputLayoutMode")
        {
            addPair(AuthoringSettings::OutputLayoutHorizontal, "Horizontal");
            addPair(AuthoringSettings::OutputLayoutVertical, "Vertical");
        }
    }}

namespace RBX {
    namespace Reflection {
	template<>
	EnumDesc<AuthoringSettings::UIStyle>::EnumDesc()
		:EnumDescriptor("UIStyle")
	{
		addPair(AuthoringSettings::Ribbon, 		"RibbonBar");
		addPair(AuthoringSettings::Menu, 		"SystemMenu");
	}
	}}

namespace RBX {
	namespace Reflection {
		template<>
		EnumDesc<AuthoringSettings::TestServerAudioBehavior>::EnumDesc()
			:EnumDescriptor("ServerAudioBehavior")
		{
			addPair(AuthoringSettings::Enabled,		"Enabled");
			addPair(AuthoringSettings::Muted,		"Muted");
			addPair(AuthoringSettings::OnlineGame,	"OnlineGame");
		}
	}}

AuthoringSettings::AuthoringSettings()
	:showDeprecated(false)
	,permissionLevelShown(Game)
	,defaultScriptFileDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/Scripts")
    ,pluginsDir(AppSettings::instance().tempLocation() + "/Plugins")
	,modelPluginsDir(AppSettings::instance().tempLocation() + "/InstalledPlugins")
	,coreScriptsDir(AppSettings::instance().tempLocation() + "/CoreScriptOverrides")
	,recentSavesDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/RecentSaves")
	,overrideCoreScripts(false)
    ,basicObjectsDisplayMode(Vertical)
    ,maximumOutputLines(5000)
    ,outputLayoutMode(OutputLayoutVertical)
    ,renderThrottlePercentage(75)
	,alwaysSaveScriptChangesWhileRunning(false)
	,clearOutputOnStart(true)
	,doSettingsChangedGAEvents(false)
    // Script Editor
#ifdef Q_WS_WIN32
    ,editorFont("Courier New",10)
#else
    ,editorFont("Courier New",14)
#endif
    ,editorTabWidth(4)
    ,editorAutoIndent(true)
    ,editorTextWrap(false)
    ,editorTextColor(G3D::Color3::black())
    ,editorBackgroundColor(G3D::Color3::white())
    ,editorSelectionColor(G3D::Color3::white())
    ,editorSelectionBackgroundColor(G3D::Color3uint8(0x6E,0xA1,0xF1))
    ,editorOperatorColor(G3D::Color3uint8(0x7F,0x7F,0x00))
    ,editorNumberColor(G3D::Color3uint8(0x00,0x7F,0x7F))
    ,editorStringColor(G3D::Color3uint8(0x7F,0x00,0x7F))
    ,editorCommentColor(G3D::Color3uint8(0x00,0x7F,0x00))
    ,editorPreprocessorColor(G3D::Color3uint8(0x7F,0x00,0x00))
    ,editorKeywordColor(G3D::Color3uint8(0x00,0x00,0x7F))
    ,editorErrorColor(G3D::Color3::red())
    ,editorWarningColor(G3D::Color3::blue())
	,editorFindSelectionBackgroundColor(G3D::Color3uint8(0xF6, 0xB9, 0x3F))
    
    // HoverOver
    ,hoverOverColor(RBX::Draw::hoverOverColor().rgb())
    ,selectColor(RBX::Draw::selectColor().rgb())
    ,animateHoverOver(true)
    ,hoverAnimateSpeed(Slow)

    // AutoSave
    , autoSaveEnabled(true)
    , autoSaveMinutesInterval(5)
    , autoSaveDir(QDesktopServices::storageLocation(QDesktopServices::DocumentsLocation) + "/ROBLOX/AutoSaves")
    // Advanced
    , diagnosticsBarEnabled(false)
	, intellisenseEnabled(true)
	//Lua debugger
	, luaDebuggerEnabled(true)	
	// Ribbon
	,uiStyle(AuthoringSettings::Ribbon)
    // Device Deployment
    ,deploymentPairingCode(0)
	// Audio Settings
	, onlyPlayFocusWindowAudio(true)
	, testServerAudioBehavior(AuthoringSettings::OnlineGame)
	, dragMultiPartsAsSinglePart(false)
{}

/**
 * Configure settings after the fast flags have loaded to do any special adjustments/handling.
 *  Must be called after RBX::GlobalAdvancedSettings::singleton()->loadState() has been called.
 */
void AuthoringSettings::configureBasedOnFastFlags()
{
	FFlag::LuaDebugger = luaDebuggerEnabled;

	// make sure we do not enable break on error if there's no debugger
	if (!FFlag::LuaDebugger)
		FFlag::LuaDebuggerBreakOnError = false;

	if (!FFlag::StudioUseDraggerGrid)
		prop_showDraggerGrid.setEditable(false);

	setDragMutliplePartsAsSinglePart(dragMultiPartsAsSinglePart);
}

void AuthoringSettings::onPropertyChanged(const RBX::Reflection::PropertyDescriptor& pDescriptor)
{
	if (FFlag::StudioSettingsGAEnabled && doSettingsChangedGAEvents)
	{
		std::string description = pDescriptor.name.str;
		description += " On Edit";
		std::string valueString = pDescriptor.getStringValue(this);
		RBX::RobloxGoogleAnalytics::trackEvent(GA_CATEGORY_STUDIO_SETTINGS, description.c_str(), valueString.c_str());
	}

	Instance::onPropertyChanged(pDescriptor);
}

void AuthoringSettings::setDoSettingsChangedGAEvents(bool value)
{
	doSettingsChangedGAEvents = value;
}

void AuthoringSettings::setRuntimeUndoBehavior( RBX::ChangeHistoryService::RuntimeUndoBehavior value )
{
	RBX::ChangeHistoryService::runtimeUndoBehavior =  value;
}

RBX::Security::Permissions AuthoringSettings::getPermissionShown() const
{
	switch (permissionLevelShown)
	{
	default:
		RBXASSERT(false);
	case Game:
		return RBX::Security::None;
	case RobloxGame:
		return RBX::Security::RobloxPlace;
	case RobloxScript:
		return RBX::Security::RobloxScript;
	case Studio:
		return RBX::Security::LocalUser;
	case Roblox:
		return RBX::Security::Roblox;
	}
}

void AuthoringSettings::setPermissionLevelShown( PermissionLevelShown value )
{
	if (value == permissionLevelShown)
		return;
	permissionLevelShown = value;
	raiseChanged(prop_PermissionLevelShown);
}

float AuthoringSettings::getCameraKeyMoveSpeed() const
{
	return RBX::Camera::CameraKeyMoveFactor;
}

void AuthoringSettings::setCameraKeyMoveSpeed(float value)
{
	RBX::Camera::CameraKeyMoveFactor = value;
	raiseChanged(prop_CameraKeyMoveSpeed);
}

float AuthoringSettings::getCameraShiftMoveSpeed() const
{
	return RBX::Camera::CameraShiftKeyMoveFactor;
}

void AuthoringSettings::setCameraShiftMoveSpeed(float value)
{
	RBX::Camera::CameraShiftKeyMoveFactor = value;
	raiseChanged(prop_CameraShiftMoveSpeed);
}

float AuthoringSettings::getCameraMouseWheelMoveSpeed() const
{
	return RBX::Camera::CameraMouseWheelMoveFactor;
}

void AuthoringSettings::setCameraMouseWheelMoveSpeed(float value)
{
	RBX::Camera::CameraMouseWheelMoveFactor = value;
	raiseChanged(prop_CameraMouseWheelMoveSpeed);
}

bool AuthoringSettings::getShowDraggerGrid() const
{
	return RBX::ArrowToolBase::showDraggerGrid;
}

void AuthoringSettings::setShowDraggerGrid(bool value)
{
	RBX::ArrowToolBase::showDraggerGrid = value;
	raiseChanged(prop_showDraggerGrid);
}

bool AuthoringSettings::getShowHoverOver() const
{
    return RBX::Draw::isHoverOver();
}

void AuthoringSettings::setShowHoverOver(bool value)
{
	RBX::Draw::showHoverOver(value);
	raiseChanged(prop_showHoverOver);
}

void AuthoringSettings::setHoverAnimateSpeed(HoverAnimateSpeed speed)
{ 
    hoverAnimateSpeed = speed; 
    raiseChanged(prop_HoverAnimateSpeed);
}

void AuthoringSettings::setBasicObjectsDisplayMode(ListDisplayMode mode)
{
    basicObjectsDisplayMode = mode;
    raiseChanged(prop_BasicObjectsDisplayMode);
}

void AuthoringSettings::setEditorFont(const QFont& font)
{
    editorFont = font;
    raiseChanged(prop_EditorFont);
}

void AuthoringSettings::setOutputLayoutMode(OutputLayoutMode mode)
{
    outputLayoutMode = mode;
    raiseChanged(prop_OutputLayoutMode);
}

bool AuthoringSettings::getLuaDebuggerEnableState() const
{ 
	return luaDebuggerEnabled; 
}

void AuthoringSettings::setLuaDebuggerEnableState(bool state)
{ 
	luaDebuggerEnabled = state; 
}

int AuthoringSettings::getDeviceDeploymentPairingCode() const
{
    return deploymentPairingCode;
}

void AuthoringSettings::setDeviceDeploymentPairingCode(int newCode)
{
	if (newCode <= 0)
	{
		raiseChanged(prop_DeploymentPairing);
	}
    else if (deploymentPairingCode != newCode)
    {
        int sizeInDecimal = MobileDevelopmentDeployer::getNumOfDigits(newCode);

		//forcing deploymentPairingCode to only have 4 digits
		deploymentPairingCode = newCode * qPow(10, MobileDevelopmentDeployer::forcedPairCodeSize() - sizeInDecimal);
        raiseChanged(prop_DeploymentPairing);
    }
}

void AuthoringSettings::setUIStyle( UIStyle value )
{
	if (value == uiStyle)
		return;
	uiStyle = value;
	raiseChanged(prop_UIStyle);
}

AuthoringSettings::UIStyle AuthoringSettings::getUIStyle() const
{
	return uiStyle; 
}

void AuthoringSettings::setOverrideCoreScripts(bool value)
{
	if (value != overrideCoreScripts)
	{
		overrideCoreScripts = value;
		RBX::BaseScript::adminScriptsPath = (overrideCoreScripts) ? coreScriptsDir.absolutePath().toStdString() : "";
		raiseChanged(prop_useCoreScriptsDir);
	}
}

void AuthoringSettings::setCoreScriptsDir(QDir value)
{
	if (value != coreScriptsDir)
	{
		coreScriptsDir = value;
		if (overrideCoreScripts)
		{
			RBX::BaseScript::adminScriptsPath = coreScriptsDir.absolutePath().toStdString();
		}
		raiseChanged(prop_CoreScriptsDir);
	}
}

void AuthoringSettings::setTestServerAudioBehavior(TestServerAudioBehavior value)
{
	if (value == testServerAudioBehavior)
		return;
	testServerAudioBehavior = value;
	raiseChanged(prop_testServerAudioBehavior);
}

G3D::Color3 AuthoringSettings::getPrimaryPartSelectColor() const
{ return RBX::ModelInstance::primaryPartSelectColor().rgb(); }

void AuthoringSettings::setPrimaryPartSelectColor(G3D::Color3 color)
{
	// as of now we are using same color for selection and hover over
	RBX::ModelInstance::setPrimaryPartSelectColor(color);
	RBX::ModelInstance::setPrimaryPartHoverOverColor(color);
}

G3D::Color3 AuthoringSettings::getPrimaryPartHoverOverColor() const
{ return RBX::ModelInstance::primaryPartHoverOverColor().rgb(); }

void AuthoringSettings::setPrimaryPartHoverOverColor(G3D::Color3 color)
{ RBX::ModelInstance::setPrimaryPartHoverOverColor(color); }

float AuthoringSettings::getPrimaryPartLineThickness() const
{ return RBX::ModelInstance::primaryPartLineThickness(); }

void AuthoringSettings::setPrimaryPartLineThickness(float thickness)
{
	if (thickness > 0.0f && thickness < 0.05f)
	{
		RBX::ModelInstance::setPrimaryPartLineThickness(thickness);
		return;
	}

	RBX::StandardOut::singleton()->printf(RBX::MESSAGE_ERROR, "Invalid line thickness. Input value must be less than 0.05");
}

bool AuthoringSettings::getDragMutliplePartsAsSinglePart() const
{ return dragMultiPartsAsSinglePart;}

void AuthoringSettings::setDragMutliplePartsAsSinglePart(bool state)
{ 
	dragMultiPartsAsSinglePart = state;
	RBX::AdvRunDragger::dragMultiPartsAsSinglePart = state; 
}
str-strict[end-prop_ClearOuputOnStart/clearOutputOnStart=const]
d
