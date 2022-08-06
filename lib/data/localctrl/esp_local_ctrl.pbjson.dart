///
//  Generated code. Do not modify.
//  source: esp_local_ctrl.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use localCtrlMsgTypeDescriptor instead')
const LocalCtrlMsgType$json = const {
  '1': 'LocalCtrlMsgType',
  '2': const [
    const {'1': 'TypeCmdGetPropertyCount', '2': 0},
    const {'1': 'TypeRespGetPropertyCount', '2': 1},
    const {'1': 'TypeCmdGetPropertyValues', '2': 4},
    const {'1': 'TypeRespGetPropertyValues', '2': 5},
    const {'1': 'TypeCmdSetPropertyValues', '2': 6},
    const {'1': 'TypeRespSetPropertyValues', '2': 7},
  ],
};

/// Descriptor for `LocalCtrlMsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List localCtrlMsgTypeDescriptor = $convert.base64Decode('ChBMb2NhbEN0cmxNc2dUeXBlEhsKF1R5cGVDbWRHZXRQcm9wZXJ0eUNvdW50EAASHAoYVHlwZVJlc3BHZXRQcm9wZXJ0eUNvdW50EAESHAoYVHlwZUNtZEdldFByb3BlcnR5VmFsdWVzEAQSHQoZVHlwZVJlc3BHZXRQcm9wZXJ0eVZhbHVlcxAFEhwKGFR5cGVDbWRTZXRQcm9wZXJ0eVZhbHVlcxAGEh0KGVR5cGVSZXNwU2V0UHJvcGVydHlWYWx1ZXMQBw==');
@$core.Deprecated('Use cmdGetPropertyCountDescriptor instead')
const CmdGetPropertyCount$json = const {
  '1': 'CmdGetPropertyCount',
};

/// Descriptor for `CmdGetPropertyCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdGetPropertyCountDescriptor = $convert.base64Decode('ChNDbWRHZXRQcm9wZXJ0eUNvdW50');
@$core.Deprecated('Use respGetPropertyCountDescriptor instead')
const RespGetPropertyCount$json = const {
  '1': 'RespGetPropertyCount',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `RespGetPropertyCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respGetPropertyCountDescriptor = $convert.base64Decode('ChRSZXNwR2V0UHJvcGVydHlDb3VudBIfCgZzdGF0dXMYASABKA4yBy5TdGF0dXNSBnN0YXR1cxIUCgVjb3VudBgCIAEoDVIFY291bnQ=');
@$core.Deprecated('Use propertyInfoDescriptor instead')
const PropertyInfo$json = const {
  '1': 'PropertyInfo',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 13, '10': 'type'},
    const {'1': 'flags', '3': 4, '4': 1, '5': 13, '10': 'flags'},
    const {'1': 'value', '3': 5, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `PropertyInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyInfoDescriptor = $convert.base64Decode('CgxQcm9wZXJ0eUluZm8SHwoGc3RhdHVzGAEgASgOMgcuU3RhdHVzUgZzdGF0dXMSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgR0eXBlGAMgASgNUgR0eXBlEhQKBWZsYWdzGAQgASgNUgVmbGFncxIUCgV2YWx1ZRgFIAEoDFIFdmFsdWU=');
@$core.Deprecated('Use cmdGetPropertyValuesDescriptor instead')
const CmdGetPropertyValues$json = const {
  '1': 'CmdGetPropertyValues',
  '2': const [
    const {'1': 'indices', '3': 1, '4': 3, '5': 13, '10': 'indices'},
  ],
};

/// Descriptor for `CmdGetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdGetPropertyValuesDescriptor = $convert.base64Decode('ChRDbWRHZXRQcm9wZXJ0eVZhbHVlcxIYCgdpbmRpY2VzGAEgAygNUgdpbmRpY2Vz');
@$core.Deprecated('Use respGetPropertyValuesDescriptor instead')
const RespGetPropertyValues$json = const {
  '1': 'RespGetPropertyValues',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
    const {'1': 'props', '3': 2, '4': 3, '5': 11, '6': '.PropertyInfo', '10': 'props'},
  ],
};

/// Descriptor for `RespGetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respGetPropertyValuesDescriptor = $convert.base64Decode('ChVSZXNwR2V0UHJvcGVydHlWYWx1ZXMSHwoGc3RhdHVzGAEgASgOMgcuU3RhdHVzUgZzdGF0dXMSIwoFcHJvcHMYAiADKAsyDS5Qcm9wZXJ0eUluZm9SBXByb3Bz');
@$core.Deprecated('Use propertyValueDescriptor instead')
const PropertyValue$json = const {
  '1': 'PropertyValue',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `PropertyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyValueDescriptor = $convert.base64Decode('Cg1Qcm9wZXJ0eVZhbHVlEhQKBWluZGV4GAEgASgNUgVpbmRleBIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU=');
@$core.Deprecated('Use cmdSetPropertyValuesDescriptor instead')
const CmdSetPropertyValues$json = const {
  '1': 'CmdSetPropertyValues',
  '2': const [
    const {'1': 'props', '3': 1, '4': 3, '5': 11, '6': '.PropertyValue', '10': 'props'},
  ],
};

/// Descriptor for `CmdSetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cmdSetPropertyValuesDescriptor = $convert.base64Decode('ChRDbWRTZXRQcm9wZXJ0eVZhbHVlcxIkCgVwcm9wcxgBIAMoCzIOLlByb3BlcnR5VmFsdWVSBXByb3Bz');
@$core.Deprecated('Use respSetPropertyValuesDescriptor instead')
const RespSetPropertyValues$json = const {
  '1': 'RespSetPropertyValues',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.Status', '10': 'status'},
  ],
};

/// Descriptor for `RespSetPropertyValues`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respSetPropertyValuesDescriptor = $convert.base64Decode('ChVSZXNwU2V0UHJvcGVydHlWYWx1ZXMSHwoGc3RhdHVzGAEgASgOMgcuU3RhdHVzUgZzdGF0dXM=');
@$core.Deprecated('Use localCtrlMessageDescriptor instead')
const LocalCtrlMessage$json = const {
  '1': 'LocalCtrlMessage',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 14, '6': '.LocalCtrlMsgType', '10': 'msg'},
    const {'1': 'cmd_get_prop_count', '3': 10, '4': 1, '5': 11, '6': '.CmdGetPropertyCount', '9': 0, '10': 'cmdGetPropCount'},
    const {'1': 'resp_get_prop_count', '3': 11, '4': 1, '5': 11, '6': '.RespGetPropertyCount', '9': 0, '10': 'respGetPropCount'},
    const {'1': 'cmd_get_prop_vals', '3': 12, '4': 1, '5': 11, '6': '.CmdGetPropertyValues', '9': 0, '10': 'cmdGetPropVals'},
    const {'1': 'resp_get_prop_vals', '3': 13, '4': 1, '5': 11, '6': '.RespGetPropertyValues', '9': 0, '10': 'respGetPropVals'},
    const {'1': 'cmd_set_prop_vals', '3': 14, '4': 1, '5': 11, '6': '.CmdSetPropertyValues', '9': 0, '10': 'cmdSetPropVals'},
    const {'1': 'resp_set_prop_vals', '3': 15, '4': 1, '5': 11, '6': '.RespSetPropertyValues', '9': 0, '10': 'respSetPropVals'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `LocalCtrlMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localCtrlMessageDescriptor = $convert.base64Decode('ChBMb2NhbEN0cmxNZXNzYWdlEiMKA21zZxgBIAEoDjIRLkxvY2FsQ3RybE1zZ1R5cGVSA21zZxJDChJjbWRfZ2V0X3Byb3BfY291bnQYCiABKAsyFC5DbWRHZXRQcm9wZXJ0eUNvdW50SABSD2NtZEdldFByb3BDb3VudBJGChNyZXNwX2dldF9wcm9wX2NvdW50GAsgASgLMhUuUmVzcEdldFByb3BlcnR5Q291bnRIAFIQcmVzcEdldFByb3BDb3VudBJCChFjbWRfZ2V0X3Byb3BfdmFscxgMIAEoCzIVLkNtZEdldFByb3BlcnR5VmFsdWVzSABSDmNtZEdldFByb3BWYWxzEkUKEnJlc3BfZ2V0X3Byb3BfdmFscxgNIAEoCzIWLlJlc3BHZXRQcm9wZXJ0eVZhbHVlc0gAUg9yZXNwR2V0UHJvcFZhbHMSQgoRY21kX3NldF9wcm9wX3ZhbHMYDiABKAsyFS5DbWRTZXRQcm9wZXJ0eVZhbHVlc0gAUg5jbWRTZXRQcm9wVmFscxJFChJyZXNwX3NldF9wcm9wX3ZhbHMYDyABKAsyFi5SZXNwU2V0UHJvcGVydHlWYWx1ZXNIAFIPcmVzcFNldFByb3BWYWxzQgkKB3BheWxvYWQ=');
