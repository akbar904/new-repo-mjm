
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/main.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('Main', () {
		testWidgets('renders HomeScreen', (tester) async {
			await tester.pumpWidget(MyApp());
			
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
