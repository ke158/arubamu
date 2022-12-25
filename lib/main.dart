import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:arubamu/common/device_preview_screenshot_helper.dart';
// import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

import 'app.dart';

void main() async {
  initializeTimeZones();
  setLocalLocation(getLocation("Asia/Tokyo"));
  await initializeDateFormatting('ja_JP');
  runApp(const ProviderScope(child: App()));
}

// void main() async {
//   runApp(ProviderScope(
//       child: DevicePreview(
//           enabled: !kReleaseMode,
//           tools: const [
//             ...DevicePreview.defaultTools,
//             DevicePreviewScreenshot(
//               onScreenshot: onScreenshot,
//             ),
//           ],
//           builder: (context) => const App())));
// }
