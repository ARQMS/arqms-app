import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ARQMS/data/localctrl/constants.pbenum.dart';
import 'package:ARQMS/data/localctrl/esp_local_ctrl.pb.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LocalCtrlProperty {
  String name;
  int type;
  int flags;
  Uint8List value;
  int index;

  LocalCtrlProperty({
    required this.index,
    required this.name,
    required this.type,
    required this.flags,
    required this.value,
  });

  bool get isReadOnly => (flags & 0x01) != 0;
}

abstract class LocalCtrlDataSource {
  Future reloadProperties();

  Future<LocalCtrlProperty?> getProperty(String name, {bool reload = false});
  Future setProperty(String name, Uint8List data);

  Future initialize();
}

class LocalCtrlDataSourceImpl implements LocalCtrlDataSource {
  static const String SERVICE_NAME = "192.168.4.1";
  static const String SERVICE_HOST = "https://$SERVICE_NAME";

  @override
  Future initialize() async {
    // load CA certificate into trusted zone. Must be equal with device HTTPS
    // certificate
    ByteData cert = await PlatformAssetBundle().load("assets/certs/rootCA.pem");
    SecurityContext.defaultContext.setTrustedCertificatesBytes(
      cert.buffer.asUint8List(),
    );
    client = http.Client();
  }

  @override
  Future<LocalCtrlProperty?> getProperty(String name,
      {bool reload = false}) async {
    if (reload) {
      var oldIndex = propertyMap[name]?.index;
      if (oldIndex != null) {
        var properties = await _getProperties([oldIndex]);
        var property = properties.single;

        propertyMap.remove(property.name);
        propertyMap.putIfAbsent(property.name, () => property);
      }
    }

    if (!propertyMap.containsKey(name)) {
      return null;
    }

    return propertyMap[name];
  }

  @override
  Future reloadProperties() async {
    var count = await _getPropertyLength();
    var indices = [for (var i = 0; i < count; i++) i];

    var properties = await _getProperties(indices);
    for (var property in properties) {
      propertyMap.remove(property.name);
      propertyMap.putIfAbsent(property.name, () => property);
    }
  }

  @override
  Future setProperty(String name, Uint8List data) async {
    if (!propertyMap.containsKey(name) || propertyMap.isEmpty) {
      throw Exception(
          "Property $name is not supported. Call reloadProperties()!");
    }

    var prop = propertyMap[name]!;
    if (prop.isReadOnly) {
      throw Exception("Property $name is readonly");
    }

    await _setProperties([prop.index], [data]);
  }

  Future<List<LocalCtrlProperty>> _getProperties(List<int> indices) async {
    var req = LocalCtrlMessage();
    req.msg = LocalCtrlMsgType.TypeCmdGetPropertyValues;
    req.cmdGetPropVals = CmdGetPropertyValues(indices: indices);

    var response = await send("esp_local_ctrl/control", req.writeToBuffer());
    var resp = LocalCtrlMessage.fromBuffer(response.bodyBytes);
    var result = <LocalCtrlProperty>[];
    if (resp.respGetPropCount.status == Status.Success) {
      int idx = 0;
      for (var prop in resp.respGetPropVals.props) {
        result.add(LocalCtrlProperty(
          index: idx++,
          name: prop.name,
          type: prop.type,
          flags: prop.flags,
          value: Uint8List.fromList(prop.value),
        ));
      }
    }

    return result;
  }

  Future _setProperties(List<int> indices, List<Uint8List> values) async {
    var req = LocalCtrlMessage();
    req.msg = LocalCtrlMsgType.TypeCmdSetPropertyValues;
    req.cmdSetPropVals = CmdSetPropertyValues();

    for (int i = 0; i < indices.length; i++) {
      req.cmdSetPropVals.props.add(PropertyValue(
        index: indices[i],
        value: values[i],
      ));
    }

    var response = await send("esp_local_ctrl/control", req.writeToBuffer());
    var resp = LocalCtrlMessage.fromBuffer(response.bodyBytes);
    if (resp.respSetPropVals.status == Status.Success) {}
  }

  Future<int> _getPropertyLength() async {
    var request = LocalCtrlMessage();
    request.msg = LocalCtrlMsgType.TypeCmdGetPropertyCount;
    request.cmdGetPropCount = CmdGetPropertyCount();

    var response =
        await send("esp_local_ctrl/control", request.writeToBuffer());
    var resp = LocalCtrlMessage.fromBuffer(response.bodyBytes);
    return resp.respGetPropCount.count;
  }

  Future<http.Response> send(String endpoint, Uint8List data) async {
    var response = await client.post(
      Uri.parse("$SERVICE_HOST/$endpoint"),
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'text/plain'
      },
      encoding: latin1,
      body: data,
    );

    return response;
  }

  late http.Client client;
  final propertyMap = <String, LocalCtrlProperty>{};
}
