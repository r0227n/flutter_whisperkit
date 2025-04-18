// Autogenerated from Pigeon (v25.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "whisperkit_messages.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray<id> *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static FlutterError *createConnectionError(NSString *channelName) {
  return [FlutterError errorWithCode:@"channel-error" message:[NSString stringWithFormat:@"%@/%@/%@", @"Unable to establish connection on channel: '", channelName, @"'."] details:@""];
}

static id GetNullableObjectAtIndex(NSArray<id> *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface FWAWhisperKitConfig ()
+ (FWAWhisperKitConfig *)fromList:(NSArray<id> *)list;
+ (nullable FWAWhisperKitConfig *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface FWATranscriptionResult ()
+ (FWATranscriptionResult *)fromList:(NSArray<id> *)list;
+ (nullable FWATranscriptionResult *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@implementation FWAWhisperKitConfig
+ (instancetype)makeWithModelPath:(nullable NSString *)modelPath
    enableVAD:(nullable NSNumber *)enableVAD
    vadFallbackSilenceThreshold:(nullable NSNumber *)vadFallbackSilenceThreshold
    vadTemperature:(nullable NSNumber *)vadTemperature
    enableLanguageIdentification:(nullable NSNumber *)enableLanguageIdentification {
  FWAWhisperKitConfig* pigeonResult = [[FWAWhisperKitConfig alloc] init];
  pigeonResult.modelPath = modelPath;
  pigeonResult.enableVAD = enableVAD;
  pigeonResult.vadFallbackSilenceThreshold = vadFallbackSilenceThreshold;
  pigeonResult.vadTemperature = vadTemperature;
  pigeonResult.enableLanguageIdentification = enableLanguageIdentification;
  return pigeonResult;
}
+ (FWAWhisperKitConfig *)fromList:(NSArray<id> *)list {
  FWAWhisperKitConfig *pigeonResult = [[FWAWhisperKitConfig alloc] init];
  pigeonResult.modelPath = GetNullableObjectAtIndex(list, 0);
  pigeonResult.enableVAD = GetNullableObjectAtIndex(list, 1);
  pigeonResult.vadFallbackSilenceThreshold = GetNullableObjectAtIndex(list, 2);
  pigeonResult.vadTemperature = GetNullableObjectAtIndex(list, 3);
  pigeonResult.enableLanguageIdentification = GetNullableObjectAtIndex(list, 4);
  return pigeonResult;
}
+ (nullable FWAWhisperKitConfig *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [FWAWhisperKitConfig fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.modelPath ?: [NSNull null],
    self.enableVAD ?: [NSNull null],
    self.vadFallbackSilenceThreshold ?: [NSNull null],
    self.vadTemperature ?: [NSNull null],
    self.enableLanguageIdentification ?: [NSNull null],
  ];
}
@end

@implementation FWATranscriptionResult
+ (instancetype)makeWithText:(nullable NSString *)text
    duration:(nullable NSNumber *)duration
    segments:(nullable NSArray<NSString *> *)segments
    language:(nullable NSString *)language
    error:(nullable NSString *)error {
  FWATranscriptionResult* pigeonResult = [[FWATranscriptionResult alloc] init];
  pigeonResult.text = text;
  pigeonResult.duration = duration;
  pigeonResult.segments = segments;
  pigeonResult.language = language;
  pigeonResult.error = error;
  return pigeonResult;
}
+ (FWATranscriptionResult *)fromList:(NSArray<id> *)list {
  FWATranscriptionResult *pigeonResult = [[FWATranscriptionResult alloc] init];
  pigeonResult.text = GetNullableObjectAtIndex(list, 0);
  pigeonResult.duration = GetNullableObjectAtIndex(list, 1);
  pigeonResult.segments = GetNullableObjectAtIndex(list, 2);
  pigeonResult.language = GetNullableObjectAtIndex(list, 3);
  pigeonResult.error = GetNullableObjectAtIndex(list, 4);
  return pigeonResult;
}
+ (nullable FWATranscriptionResult *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [FWATranscriptionResult fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.text ?: [NSNull null],
    self.duration ?: [NSNull null],
    self.segments ?: [NSNull null],
    self.language ?: [NSNull null],
    self.error ?: [NSNull null],
  ];
}
@end

@interface FWAWhisperkitMessagesPigeonCodecReader : FlutterStandardReader
@end
@implementation FWAWhisperkitMessagesPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 129: 
      return [FWAWhisperKitConfig fromList:[self readValue]];
    case 130: 
      return [FWATranscriptionResult fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FWAWhisperkitMessagesPigeonCodecWriter : FlutterStandardWriter
@end
@implementation FWAWhisperkitMessagesPigeonCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FWAWhisperKitConfig class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FWATranscriptionResult class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FWAWhisperkitMessagesPigeonCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FWAWhisperkitMessagesPigeonCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FWAWhisperkitMessagesPigeonCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FWAWhisperkitMessagesPigeonCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FWAGetWhisperkitMessagesCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FWAWhisperkitMessagesPigeonCodecReaderWriter *readerWriter = [[FWAWhisperkitMessagesPigeonCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}
void SetUpFWAWhisperKitApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FWAWhisperKitApi> *api) {
  SetUpFWAWhisperKitApiWithSuffix(binaryMessenger, api, @"");
}

void SetUpFWAWhisperKitApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FWAWhisperKitApi> *api, NSString *messageChannelSuffix) {
  messageChannelSuffix = messageChannelSuffix.length > 0 ? [NSString stringWithFormat: @".%@", messageChannelSuffix] : @"";
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.getPlatformVersion", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getPlatformVersionWithError:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(getPlatformVersionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api getPlatformVersionWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.initializeWhisperKit", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initializeWhisperKitConfig:error:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(initializeWhisperKitConfig:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        FWAWhisperKitConfig *arg_config = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSNumber *output = [api initializeWhisperKitConfig:arg_config error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.transcribeAudioFile", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(transcribeAudioFileFilePath:error:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(transcribeAudioFileFilePath:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_filePath = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        FWATranscriptionResult *output = [api transcribeAudioFileFilePath:arg_filePath error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.startStreamingTranscription", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startStreamingTranscriptionWithError:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(startStreamingTranscriptionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api startStreamingTranscriptionWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.stopStreamingTranscription", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopStreamingTranscriptionWithError:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(stopStreamingTranscriptionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FWATranscriptionResult *output = [api stopStreamingTranscriptionWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitApi.getAvailableModels", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:FWAGetWhisperkitMessagesCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getAvailableModelsWithError:)], @"FWAWhisperKitApi api (%@) doesn't respond to @selector(getAvailableModelsWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSArray<NSString *> *output = [api getAvailableModelsWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FWAWhisperKitEvents ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@property(nonatomic, strong) NSString *messageChannelSuffix;
@end

@implementation FWAWhisperKitEvents

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  return [self initWithBinaryMessenger:binaryMessenger messageChannelSuffix:@""];
}
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger messageChannelSuffix:(nullable NSString*)messageChannelSuffix{
  self = [self init];
  if (self) {
    _binaryMessenger = binaryMessenger;
    _messageChannelSuffix = [messageChannelSuffix length] == 0 ? @"" : [NSString stringWithFormat: @".%@", messageChannelSuffix];
  }
  return self;
}
- (void)onTranscriptionProgressProgress:(double)arg_progress completion:(void (^)(FlutterError *_Nullable))completion {
  NSString *channelName = [NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onTranscriptionProgress", _messageChannelSuffix];
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:channelName
      binaryMessenger:self.binaryMessenger
      codec:FWAGetWhisperkitMessagesCodec()];
  [channel sendMessage:@[@(arg_progress)] reply:^(NSArray<id> *reply) {
    if (reply != nil) {
      if (reply.count > 1) {
        completion([FlutterError errorWithCode:reply[0] message:reply[1] details:reply[2]]);
      } else {
        completion(nil);
      }
    } else {
      completion(createConnectionError(channelName));
    } 
  }];
}
- (void)onInterimTranscriptionResultResult:(FWATranscriptionResult *)arg_result completion:(void (^)(FlutterError *_Nullable))completion {
  NSString *channelName = [NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.flutter_whisperkit_apple.WhisperKitEvents.onInterimTranscriptionResult", _messageChannelSuffix];
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:channelName
      binaryMessenger:self.binaryMessenger
      codec:FWAGetWhisperkitMessagesCodec()];
  [channel sendMessage:@[arg_result ?: [NSNull null]] reply:^(NSArray<id> *reply) {
    if (reply != nil) {
      if (reply.count > 1) {
        completion([FlutterError errorWithCode:reply[0] message:reply[1] details:reply[2]]);
      } else {
        completion(nil);
      }
    } else {
      completion(createConnectionError(channelName));
    } 
  }];
}
@end

