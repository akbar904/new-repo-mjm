
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

// Mock class for AnimalCubit
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is Cat', () {
			expect(animalCubit.state, AnimalState(name: 'Cat', icon: Icons.pets));
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [Dog] when toggleAnimal is called while current state is Cat',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(name: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [Cat] when toggleAnimal is called while current state is Dog',
			build: () {
				animalCubit.emit(AnimalState(name: 'Dog', icon: Icons.person));
				return animalCubit;
			},
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(name: 'Cat', icon: Icons.pets)],
		);
	});
}
