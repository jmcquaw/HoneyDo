//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<at_backupkey_flutter/AtBackupkeyFlutterPlugin.h>)
#import <at_backupkey_flutter/AtBackupkeyFlutterPlugin.h>
#else
@import at_backupkey_flutter;
#endif

#if __has_include(<at_onboarding_flutter/AtOnboardingFlutterPlugin.h>)
#import <at_onboarding_flutter/AtOnboardingFlutterPlugin.h>
#else
@import at_onboarding_flutter;
#endif

#if __has_include(<biometric_storage/BiometricStoragePlugin.h>)
#import <biometric_storage/BiometricStoragePlugin.h>
#else
@import biometric_storage;
#endif

#if __has_include(<file_picker/FilePickerPlugin.h>)
#import <file_picker/FilePickerPlugin.h>
#else
@import file_picker;
#endif

#if __has_include(<file_saver/FileSaverPlugin.h>)
#import <file_saver/FileSaverPlugin.h>
#else
@import file_saver;
#endif

#if __has_include(<flutter_keychain/FlutterKeychainPlugin.h>)
#import <flutter_keychain/FlutterKeychainPlugin.h>
#else
@import flutter_keychain;
#endif

#if __has_include(<flutter_qr_reader/FlutterQrReaderPlugin.h>)
#import <flutter_qr_reader/FlutterQrReaderPlugin.h>
#else
@import flutter_qr_reader;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<share_plus/FLTSharePlusPlugin.h>)
#import <share_plus/FLTSharePlusPlugin.h>
#else
@import share_plus;
#endif

#if __has_include(<url_launcher_ios/FLTURLLauncherPlugin.h>)
#import <url_launcher_ios/FLTURLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

#if __has_include(<webview_flutter_wkwebview/FLTWebViewFlutterPlugin.h>)
#import <webview_flutter_wkwebview/FLTWebViewFlutterPlugin.h>
#else
@import webview_flutter_wkwebview;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AtBackupkeyFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"AtBackupkeyFlutterPlugin"]];
  [AtOnboardingFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"AtOnboardingFlutterPlugin"]];
  [BiometricStoragePlugin registerWithRegistrar:[registry registrarForPlugin:@"BiometricStoragePlugin"]];
  [FilePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FilePickerPlugin"]];
  [FileSaverPlugin registerWithRegistrar:[registry registrarForPlugin:@"FileSaverPlugin"]];
  [FlutterKeychainPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterKeychainPlugin"]];
  [FlutterQrReaderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterQrReaderPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTSharePlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlusPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
  [FLTWebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTWebViewFlutterPlugin"]];
}

@end
