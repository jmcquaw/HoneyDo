//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:biometric_storage/biometric_storage_web.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:file_selector_web/file_selector_web.dart';
import 'package:share_plus_web/share_plus_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  BiometricStoragePluginWeb.registerWith(registrar);
  FilePickerWeb.registerWith(registrar);
  FileSaverWeb.registerWith(registrar);
  FileSelectorWeb.registerWith(registrar);
  SharePlusPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}