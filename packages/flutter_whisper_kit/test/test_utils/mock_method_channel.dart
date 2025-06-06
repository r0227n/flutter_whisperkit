import 'package:flutter_whisper_kit/flutter_whisper_kit.dart';
import 'package:flutter_whisper_kit/src/platform_specifics/flutter_whisper_kit_method_channel.dart';

class MockMethodChannelFlutterWhisperkit
    extends MethodChannelFlutterWhisperKit {
  String? mockLoadModelResponse;
  TranscriptionResult? mockTranscribeResponse;
  String? mockStartRecordingResponse;
  String? mockStopRecordingResponse;

  @override
  Future<String?> loadModel(
    String? modelName, {
    String? modelRepo,
    bool redownload = false,
  }) async {
    return mockLoadModelResponse;
  }

  @override
  Future<TranscriptionResult?> transcribeFromFile(
    String filePath, {
    DecodingOptions? options,
  }) async {
    return mockTranscribeResponse;
  }

  @override
  Future<String?> startRecording({bool? loop, DecodingOptions? options}) async {
    return mockStartRecordingResponse;
  }

  @override
  Future<String?> stopRecording({bool? loop}) async {
    return mockStopRecordingResponse;
  }
}
