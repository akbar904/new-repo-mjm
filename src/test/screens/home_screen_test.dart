
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/screens/home_screen.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('initial state is Cat with clock icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(name: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: animalCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('tapping text switches to Dog with person icon', (WidgetTester tester) async {
			whenListen(
				animalCubit,
				Stream.fromIterable([
					Animal(name: 'Cat', icon: Icons.access_time),
					Animal(name: 'Dog', icon: Icons.person),
				]),
			);
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: animalCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);
			await tester.tap(find.text('Cat'));
			await tester.pump();
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
