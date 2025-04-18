// Autogenerated from Pigeon (v25.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class FWAWhisperKitConfig;
@class FWATranscriptionResult;

@interface FWAWhisperKitConfig : NSObject
+ (instancetype)makeWithModelPath:(nullable NSString *)modelPath
    enableVAD:(nullable NSNumber *)enableVAD
    vadFallbackSilenceThreshold:(nullable NSNumber *)vadFallbackSilenceThreshold
    vadTemperature:(nullable NSNumber *)vadTemperature
    enableLanguageIdentification:(nullable NSNumber *)enableLanguageIdentification;
@property(nonatomic, copy, nullable) NSString * modelPath;
@property(nonatomic, strong, nullable) NSNumber * enableVAD;
@property(nonatomic, strong, nullable) NSNumber * vadFallbackSilenceThreshold;
@property(nonatomic, strong, nullable) NSNumber * vadTemperature;
@property(nonatomic, strong, nullable) NSNumber * enableLanguageIdentification;
@end

@interface FWATranscriptionResult : NSObject
+ (instancetype)makeWithText:(nullable NSString *)text
    duration:(nullable NSNumber *)duration
    segments:(nullable NSArray<NSString *> *)segments
    language:(nullable NSString *)language
    error:(nullable NSString *)error;
@property(nonatomic, copy, nullable) NSString * text;
@property(nonatomic, strong, nullable) NSNumber * duration;
@property(nonatomic, copy, nullable) NSArray<NSString *> * segments;
@property(nonatomic, copy, nullable) NSString * language;
@property(nonatomic, copy, nullable) NSString * error;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *FWAGetWhisperkitMessagesCodec(void);

@protocol FWAWhisperKitApi
/// @return `nil` only when `error != nil`.
- (nullable NSString *)getPlatformVersionWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)initializeWhisperKitConfig:(FWAWhisperKitConfig *)config error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable FWATranscriptionResult *)transcribeAudioFileFilePath:(NSString *)filePath error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)startStreamingTranscriptionWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable FWATranscriptionResult *)stopStreamingTranscriptionWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSArray<NSString *> *)getAvailableModelsWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpFWAWhisperKitApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FWAWhisperKitApi> *_Nullable api);

extern void SetUpFWAWhisperKitApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FWAWhisperKitApi> *_Nullable api, NSString *messageChannelSuffix);


@interface FWAWhisperKitEvents : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger messageChannelSuffix:(nullable NSString *)messageChannelSuffix;
- (void)onTranscriptionProgressProgress:(double)progress completion:(void (^)(FlutterError *_Nullable))completion;
- (void)onInterimTranscriptionResultResult:(FWATranscriptionResult *)result completion:(void (^)(FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
