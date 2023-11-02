import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resq_guide/view/emergencyContact/contact_screen.dart';

void main() {
  testWidgets('Testing ContactScreen widgets', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      await tester.pumpAndSettle();

      // Testing Scaffold, Stack, FloatingActionButton, IconButton, ListView.builder, ListTile
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2));
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(3));

      // Testing Dialog, Form, TextFormField, TextButton
      expect(find.byType(Dialog), findsNothing);
      await tester.pumpAndSettle();
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(TextButton), findsNWidgets(3));
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add'), findsOneWidget);
      expect(find.text('Update'), findsOneWidget);

      // Testing user interactions and form validation
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      await tester.enterText(find.byType(TextFormField).first, '');
      await tester.enterText(find.byType(TextFormField).last, '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('Please enter a name'), findsOneWidget);
      expect(find.text('Please enter a phone number'), findsOneWidget);
    });
  });
}
