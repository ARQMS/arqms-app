///
//  Generated code. Do not modify.
//  source: esp_local_ctrl.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'constants.pbenum.dart' as $0;
import 'esp_local_ctrl.pbenum.dart';

export 'esp_local_ctrl.pbenum.dart';

class CmdGetPropertyCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdGetPropertyCount', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CmdGetPropertyCount._() : super();
  factory CmdGetPropertyCount() => create();
  factory CmdGetPropertyCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdGetPropertyCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdGetPropertyCount clone() => CmdGetPropertyCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdGetPropertyCount copyWith(void Function(CmdGetPropertyCount) updates) => super.copyWith((message) => updates(message as CmdGetPropertyCount)) as CmdGetPropertyCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdGetPropertyCount create() => CmdGetPropertyCount._();
  CmdGetPropertyCount createEmptyInstance() => create();
  static $pb.PbList<CmdGetPropertyCount> createRepeated() => $pb.PbList<CmdGetPropertyCount>();
  @$core.pragma('dart2js:noInline')
  static CmdGetPropertyCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdGetPropertyCount>(create);
  static CmdGetPropertyCount? _defaultInstance;
}

class RespGetPropertyCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespGetPropertyCount', createEmptyInstance: create)
    ..e<$0.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  RespGetPropertyCount._() : super();
  factory RespGetPropertyCount({
    $0.Status? status,
    $core.int? count,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory RespGetPropertyCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespGetPropertyCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespGetPropertyCount clone() => RespGetPropertyCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespGetPropertyCount copyWith(void Function(RespGetPropertyCount) updates) => super.copyWith((message) => updates(message as RespGetPropertyCount)) as RespGetPropertyCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetPropertyCount create() => RespGetPropertyCount._();
  RespGetPropertyCount createEmptyInstance() => create();
  static $pb.PbList<RespGetPropertyCount> createRepeated() => $pb.PbList<RespGetPropertyCount>();
  @$core.pragma('dart2js:noInline')
  static RespGetPropertyCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespGetPropertyCount>(create);
  static RespGetPropertyCount? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class PropertyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PropertyInfo', createEmptyInstance: create)
    ..e<$0.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flags', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PropertyInfo._() : super();
  factory PropertyInfo({
    $0.Status? status,
    $core.String? name,
    $core.int? type,
    $core.int? flags,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (flags != null) {
      _result.flags = flags;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory PropertyInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PropertyInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PropertyInfo clone() => PropertyInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PropertyInfo copyWith(void Function(PropertyInfo) updates) => super.copyWith((message) => updates(message as PropertyInfo)) as PropertyInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PropertyInfo create() => PropertyInfo._();
  PropertyInfo createEmptyInstance() => create();
  static $pb.PbList<PropertyInfo> createRepeated() => $pb.PbList<PropertyInfo>();
  @$core.pragma('dart2js:noInline')
  static PropertyInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PropertyInfo>(create);
  static PropertyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get flags => $_getIZ(3);
  @$pb.TagNumber(4)
  set flags($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFlags() => $_has(3);
  @$pb.TagNumber(4)
  void clearFlags() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get value => $_getN(4);
  @$pb.TagNumber(5)
  set value($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);
}

class CmdGetPropertyValues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdGetPropertyValues', createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indices', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  CmdGetPropertyValues._() : super();
  factory CmdGetPropertyValues({
    $core.Iterable<$core.int>? indices,
  }) {
    final _result = create();
    if (indices != null) {
      _result.indices.addAll(indices);
    }
    return _result;
  }
  factory CmdGetPropertyValues.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdGetPropertyValues.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdGetPropertyValues clone() => CmdGetPropertyValues()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdGetPropertyValues copyWith(void Function(CmdGetPropertyValues) updates) => super.copyWith((message) => updates(message as CmdGetPropertyValues)) as CmdGetPropertyValues; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdGetPropertyValues create() => CmdGetPropertyValues._();
  CmdGetPropertyValues createEmptyInstance() => create();
  static $pb.PbList<CmdGetPropertyValues> createRepeated() => $pb.PbList<CmdGetPropertyValues>();
  @$core.pragma('dart2js:noInline')
  static CmdGetPropertyValues getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdGetPropertyValues>(create);
  static CmdGetPropertyValues? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get indices => $_getList(0);
}

class RespGetPropertyValues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespGetPropertyValues', createEmptyInstance: create)
    ..e<$0.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..pc<PropertyInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'props', $pb.PbFieldType.PM, subBuilder: PropertyInfo.create)
    ..hasRequiredFields = false
  ;

  RespGetPropertyValues._() : super();
  factory RespGetPropertyValues({
    $0.Status? status,
    $core.Iterable<PropertyInfo>? props,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (props != null) {
      _result.props.addAll(props);
    }
    return _result;
  }
  factory RespGetPropertyValues.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespGetPropertyValues.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespGetPropertyValues clone() => RespGetPropertyValues()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespGetPropertyValues copyWith(void Function(RespGetPropertyValues) updates) => super.copyWith((message) => updates(message as RespGetPropertyValues)) as RespGetPropertyValues; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetPropertyValues create() => RespGetPropertyValues._();
  RespGetPropertyValues createEmptyInstance() => create();
  static $pb.PbList<RespGetPropertyValues> createRepeated() => $pb.PbList<RespGetPropertyValues>();
  @$core.pragma('dart2js:noInline')
  static RespGetPropertyValues getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespGetPropertyValues>(create);
  static RespGetPropertyValues? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PropertyInfo> get props => $_getList(1);
}

class PropertyValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PropertyValue', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PropertyValue._() : super();
  factory PropertyValue({
    $core.int? index,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (index != null) {
      _result.index = index;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory PropertyValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PropertyValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PropertyValue clone() => PropertyValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PropertyValue copyWith(void Function(PropertyValue) updates) => super.copyWith((message) => updates(message as PropertyValue)) as PropertyValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PropertyValue create() => PropertyValue._();
  PropertyValue createEmptyInstance() => create();
  static $pb.PbList<PropertyValue> createRepeated() => $pb.PbList<PropertyValue>();
  @$core.pragma('dart2js:noInline')
  static PropertyValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PropertyValue>(create);
  static PropertyValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class CmdSetPropertyValues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CmdSetPropertyValues', createEmptyInstance: create)
    ..pc<PropertyValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'props', $pb.PbFieldType.PM, subBuilder: PropertyValue.create)
    ..hasRequiredFields = false
  ;

  CmdSetPropertyValues._() : super();
  factory CmdSetPropertyValues({
    $core.Iterable<PropertyValue>? props,
  }) {
    final _result = create();
    if (props != null) {
      _result.props.addAll(props);
    }
    return _result;
  }
  factory CmdSetPropertyValues.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CmdSetPropertyValues.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CmdSetPropertyValues clone() => CmdSetPropertyValues()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CmdSetPropertyValues copyWith(void Function(CmdSetPropertyValues) updates) => super.copyWith((message) => updates(message as CmdSetPropertyValues)) as CmdSetPropertyValues; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CmdSetPropertyValues create() => CmdSetPropertyValues._();
  CmdSetPropertyValues createEmptyInstance() => create();
  static $pb.PbList<CmdSetPropertyValues> createRepeated() => $pb.PbList<CmdSetPropertyValues>();
  @$core.pragma('dart2js:noInline')
  static CmdSetPropertyValues getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CmdSetPropertyValues>(create);
  static CmdSetPropertyValues? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PropertyValue> get props => $_getList(0);
}

class RespSetPropertyValues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RespSetPropertyValues', createEmptyInstance: create)
    ..e<$0.Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: $0.Status.Success, valueOf: $0.Status.valueOf, enumValues: $0.Status.values)
    ..hasRequiredFields = false
  ;

  RespSetPropertyValues._() : super();
  factory RespSetPropertyValues({
    $0.Status? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RespSetPropertyValues.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RespSetPropertyValues.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RespSetPropertyValues clone() => RespSetPropertyValues()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RespSetPropertyValues copyWith(void Function(RespSetPropertyValues) updates) => super.copyWith((message) => updates(message as RespSetPropertyValues)) as RespSetPropertyValues; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespSetPropertyValues create() => RespSetPropertyValues._();
  RespSetPropertyValues createEmptyInstance() => create();
  static $pb.PbList<RespSetPropertyValues> createRepeated() => $pb.PbList<RespSetPropertyValues>();
  @$core.pragma('dart2js:noInline')
  static RespSetPropertyValues getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespSetPropertyValues>(create);
  static RespSetPropertyValues? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($0.Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

enum LocalCtrlMessage_Payload {
  cmdGetPropCount, 
  respGetPropCount, 
  cmdGetPropVals, 
  respGetPropVals, 
  cmdSetPropVals, 
  respSetPropVals, 
  notSet
}

class LocalCtrlMessage extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LocalCtrlMessage_Payload> _LocalCtrlMessage_PayloadByTag = {
    10 : LocalCtrlMessage_Payload.cmdGetPropCount,
    11 : LocalCtrlMessage_Payload.respGetPropCount,
    12 : LocalCtrlMessage_Payload.cmdGetPropVals,
    13 : LocalCtrlMessage_Payload.respGetPropVals,
    14 : LocalCtrlMessage_Payload.cmdSetPropVals,
    15 : LocalCtrlMessage_Payload.respSetPropVals,
    0 : LocalCtrlMessage_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocalCtrlMessage', createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15])
    ..e<LocalCtrlMsgType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', $pb.PbFieldType.OE, defaultOrMaker: LocalCtrlMsgType.TypeCmdGetPropertyCount, valueOf: LocalCtrlMsgType.valueOf, enumValues: LocalCtrlMsgType.values)
    ..aOM<CmdGetPropertyCount>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdGetPropCount', subBuilder: CmdGetPropertyCount.create)
    ..aOM<RespGetPropertyCount>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respGetPropCount', subBuilder: RespGetPropertyCount.create)
    ..aOM<CmdGetPropertyValues>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdGetPropVals', subBuilder: CmdGetPropertyValues.create)
    ..aOM<RespGetPropertyValues>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respGetPropVals', subBuilder: RespGetPropertyValues.create)
    ..aOM<CmdSetPropertyValues>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cmdSetPropVals', subBuilder: CmdSetPropertyValues.create)
    ..aOM<RespSetPropertyValues>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'respSetPropVals', subBuilder: RespSetPropertyValues.create)
    ..hasRequiredFields = false
  ;

  LocalCtrlMessage._() : super();
  factory LocalCtrlMessage({
    LocalCtrlMsgType? msg,
    CmdGetPropertyCount? cmdGetPropCount,
    RespGetPropertyCount? respGetPropCount,
    CmdGetPropertyValues? cmdGetPropVals,
    RespGetPropertyValues? respGetPropVals,
    CmdSetPropertyValues? cmdSetPropVals,
    RespSetPropertyValues? respSetPropVals,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (cmdGetPropCount != null) {
      _result.cmdGetPropCount = cmdGetPropCount;
    }
    if (respGetPropCount != null) {
      _result.respGetPropCount = respGetPropCount;
    }
    if (cmdGetPropVals != null) {
      _result.cmdGetPropVals = cmdGetPropVals;
    }
    if (respGetPropVals != null) {
      _result.respGetPropVals = respGetPropVals;
    }
    if (cmdSetPropVals != null) {
      _result.cmdSetPropVals = cmdSetPropVals;
    }
    if (respSetPropVals != null) {
      _result.respSetPropVals = respSetPropVals;
    }
    return _result;
  }
  factory LocalCtrlMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalCtrlMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalCtrlMessage clone() => LocalCtrlMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalCtrlMessage copyWith(void Function(LocalCtrlMessage) updates) => super.copyWith((message) => updates(message as LocalCtrlMessage)) as LocalCtrlMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LocalCtrlMessage create() => LocalCtrlMessage._();
  LocalCtrlMessage createEmptyInstance() => create();
  static $pb.PbList<LocalCtrlMessage> createRepeated() => $pb.PbList<LocalCtrlMessage>();
  @$core.pragma('dart2js:noInline')
  static LocalCtrlMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalCtrlMessage>(create);
  static LocalCtrlMessage? _defaultInstance;

  LocalCtrlMessage_Payload whichPayload() => _LocalCtrlMessage_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LocalCtrlMsgType get msg => $_getN(0);
  @$pb.TagNumber(1)
  set msg(LocalCtrlMsgType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(10)
  CmdGetPropertyCount get cmdGetPropCount => $_getN(1);
  @$pb.TagNumber(10)
  set cmdGetPropCount(CmdGetPropertyCount v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCmdGetPropCount() => $_has(1);
  @$pb.TagNumber(10)
  void clearCmdGetPropCount() => clearField(10);
  @$pb.TagNumber(10)
  CmdGetPropertyCount ensureCmdGetPropCount() => $_ensure(1);

  @$pb.TagNumber(11)
  RespGetPropertyCount get respGetPropCount => $_getN(2);
  @$pb.TagNumber(11)
  set respGetPropCount(RespGetPropertyCount v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRespGetPropCount() => $_has(2);
  @$pb.TagNumber(11)
  void clearRespGetPropCount() => clearField(11);
  @$pb.TagNumber(11)
  RespGetPropertyCount ensureRespGetPropCount() => $_ensure(2);

  @$pb.TagNumber(12)
  CmdGetPropertyValues get cmdGetPropVals => $_getN(3);
  @$pb.TagNumber(12)
  set cmdGetPropVals(CmdGetPropertyValues v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCmdGetPropVals() => $_has(3);
  @$pb.TagNumber(12)
  void clearCmdGetPropVals() => clearField(12);
  @$pb.TagNumber(12)
  CmdGetPropertyValues ensureCmdGetPropVals() => $_ensure(3);

  @$pb.TagNumber(13)
  RespGetPropertyValues get respGetPropVals => $_getN(4);
  @$pb.TagNumber(13)
  set respGetPropVals(RespGetPropertyValues v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasRespGetPropVals() => $_has(4);
  @$pb.TagNumber(13)
  void clearRespGetPropVals() => clearField(13);
  @$pb.TagNumber(13)
  RespGetPropertyValues ensureRespGetPropVals() => $_ensure(4);

  @$pb.TagNumber(14)
  CmdSetPropertyValues get cmdSetPropVals => $_getN(5);
  @$pb.TagNumber(14)
  set cmdSetPropVals(CmdSetPropertyValues v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCmdSetPropVals() => $_has(5);
  @$pb.TagNumber(14)
  void clearCmdSetPropVals() => clearField(14);
  @$pb.TagNumber(14)
  CmdSetPropertyValues ensureCmdSetPropVals() => $_ensure(5);

  @$pb.TagNumber(15)
  RespSetPropertyValues get respSetPropVals => $_getN(6);
  @$pb.TagNumber(15)
  set respSetPropVals(RespSetPropertyValues v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRespSetPropVals() => $_has(6);
  @$pb.TagNumber(15)
  void clearRespSetPropVals() => clearField(15);
  @$pb.TagNumber(15)
  RespSetPropertyValues ensureRespSetPropVals() => $_ensure(6);
}

