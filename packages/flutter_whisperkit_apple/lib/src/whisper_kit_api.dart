// Autogenerated from Pigeon (v22.7.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

class WhisperKitConfig {
  WhisperKitConfig({
    this.modelPath,
    this.enableVAD,
    this.vadFallbackSilenceThreshold,
    this.vadTemperature,
    this.enableLanguageIdentification,
  });

  String? modelPath;

  bool? enableVAD;

  int? vadFallbackSilenceThreshold;

  double? vadTemperature;

  bool? enableLanguageIdentification;

  Object encode() {
    return <Object?>[
      modelPath,
      enableVAD,
      vadFallbackSilenceThreshold,
      vadTemperature,
      enableLanguageIdentification,
    ];
  }

  static WhisperKitConfig decode(Object result) {
    result as List<Object?>;
    return WhisperKitConfig(
      modelPath: result[0] as String?,
      enableVAD: result[1] as bool?,
      vadFallbackSilenceThreshold: result[2] as int?,
      vadTemperature: result[3] as double?,
      enableLanguageIdentification: result[4] as bool?,
    );
  }
}

class TranscriptionSegment {
  TranscriptionSegment({
    required this.text,
    required this.startTime,
    required this.endTime,
  });

  String text;

  double startTime;

  double endTime;

  Object encode() {
    return <Object?>[
      text,
      startTime,
      endTime,
    ];
  }

  static TranscriptionSegment decode(Object result) {
    result as List<Object?>;
    return TranscriptionSegment(
      text: result[0]! as String,
      startTime: result[1]! as double,
      endTime: result[2]! as double,
    );
  }
}

class TranscriptionResult {
  TranscriptionResult({
    required this.text,
    required this.segments,
    this.language,
  });

  String text;

  List<TranscriptionSegment> segments;

  String? language;

  Object encode() {
    return <Object?>[
      text,
      segments,
      language,
    ];
  }

  static TranscriptionResult decode(Object result) {
    result as List<Object?>;
    return TranscriptionResult(
      text: result[0]! as String,
      segments: (result[1] as List<Object?>?)!.cast<TranscriptionSegment>(),
      language: result[2] as String?,
    );
  }
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is WhisperKitConfig) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    }    else if (value is TranscriptionSegment) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    }    else if (value is TranscriptionResult) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        return WhisperKitConfig.decode(readValue(buffer)!);
      case 130: 
        return TranscriptionSegment.decode(readValue(buffer)!);
      case 131: 
        return TranscriptionResult.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class WhisperKitApi {
  /// Constructor for [WhisperKitApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  WhisperKitApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<String> getPlatformVersion() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.getPlatformVersion$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  Future<bool> initializeWhisperKit(WhisperKitConfig config) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.initializeWhisperKit$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[config]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<TranscriptionResult> transcribeAudioFile(String filePath) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.transcribeAudioFile$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[filePath]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as TranscriptionResult?)!;
    }
  }

  Future<bool> startStreamingTranscription() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.startStreamingTranscription$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<TranscriptionResult> stopStreamingTranscription() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.stopStreamingTranscription$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as TranscriptionResult?)!;
    }
  }

  Future<List<String>> getAvailableModels() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.getAvailableModels$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<String>();
    }
  }
}

abstract class WhisperKitEvents {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void onTranscriptionProgress(double progress);

  void onInterimTranscriptionResult(TranscriptionResult result);

  static void setUp(WhisperKitEvents? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onTranscriptionProgress$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onTranscriptionProgress was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final double? arg_progress = (args[0] as double?);
          assert(arg_progress != null,
              'Argument for dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onTranscriptionProgress was null, expected non-null double.');
          try {
            api.onTranscriptionProgress(arg_progress!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onInterimTranscriptionResult$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onInterimTranscriptionResult was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final TranscriptionResult? arg_result = (args[0] as TranscriptionResult?);
          assert(arg_result != null,
              'Argument for dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onInterimTranscriptionResult was null, expected non-null TranscriptionResult.');
          try {
            api.onInterimTranscriptionResult(arg_result!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
