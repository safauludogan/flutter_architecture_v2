// example/integration_test/example_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import '../lib/main.dart' as app;

void main() {
  patrolTest(
    'Open home page and press button',
    ($) async {
      await app.main();
      await $.pumpAndSettle(); //Wait for screen loading

      await $(FloatingActionButton).tap();
      await $.pumpAndSettle(); //Wait for screen loading

      await $('1').waitUntilVisible();
      $(Scrollable).containing(Text);

      expect($('rerum'), findsOneWidget);
    },
  );
}
