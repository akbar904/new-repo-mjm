
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/widgets/animal_text.dart';
import 'package:flutter/material.dart';

void main() {
	group('AnimalText Widget Tests', () {
		testWidgets('displays the correct animal name and icon', (WidgetTester tester) async {
			// Arrange
			final animal = Animal(name: 'Cat', icon: Icons.pets);

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: AnimalText(animal: animal),
				),
			));

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('displays updated animal when properties change', (WidgetTester tester) async {
			// Arrange
			final animal = Animal(name: 'Dog', icon: Icons.person);

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: AnimalText(animal: animal),
				),
			));

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
