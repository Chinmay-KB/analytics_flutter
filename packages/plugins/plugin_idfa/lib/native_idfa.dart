// Autogenerated from Pigeon (v7.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

enum TrackingStatus {
  authorized,
  denied,
  notDetermined,
  restricted,
  unknown,
}

class NativeIdfaData {
  NativeIdfaData({
    this.adTrackingEnabled,
    this.advertisingId,
    this.trackingStatus,
  });

  bool? adTrackingEnabled;

  String? advertisingId;

  TrackingStatus? trackingStatus;

  Object encode() {
    return <Object?>[
      adTrackingEnabled,
      advertisingId,
      trackingStatus?.index,
    ];
  }

  static NativeIdfaData decode(Object result) {
    result as List<Object?>;
    return NativeIdfaData(
      adTrackingEnabled: result[0] as bool?,
      advertisingId: result[1] as String?,
      trackingStatus: result[2] != null
          ? TrackingStatus.values[result[2]! as int]
          : null,
    );
  }
}

class _NativeIdfaApiCodec extends StandardMessageCodec {
  const _NativeIdfaApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NativeIdfaData) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return NativeIdfaData.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class NativeIdfaApi {
  /// Constructor for [NativeIdfaApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NativeIdfaApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _NativeIdfaApiCodec();

  Future<NativeIdfaData> getTrackingAuthorizationStatus() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.NativeIdfaApi.getTrackingAuthorizationStatus', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as NativeIdfaData?)!;
    }
  }
}