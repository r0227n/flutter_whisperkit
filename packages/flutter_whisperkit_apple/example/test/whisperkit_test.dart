import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_whisperkit_apple/flutter_whisperkit_apple.dart';
import 'package:flutter/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FlutterWhisperkitApple whisperKit;
  late MethodChannel channel;

  setUp(() {
    channel = const MethodChannel('dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'initializeWhisperKit') {
          return true;
        } else if (methodCall.method == 'getAvailableModels') {
          return ['tiny', 'base', 'small', 'medium', 'large'];
        }
        return null;
      },
    );
    whisperKit = FlutterWhisperkitApple();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      null,
    );
  });

  test('initializeWhisperKit should complete successfully', () async {
    try {
      final config = WhisperKitConfig(
        enableVAD: true,
        vadFallbackSilenceThreshold: 600,
        vadTemperature: 0.15,
        enableLanguageIdentification: true,
      );

      final result = await whisperKit.initializeWhisperKit(config: config);
      expect(result, isTrue);
      print('WhisperKit initialized successfully: $result');
    } catch (e) {
      fail('WhisperKit initialization failed with error: $e');
    }
  });
}
