
// test/models/animal_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/models/animal.dart';

void main() {
	group('Animal Model', () {
		test('Animal should have correct properties', () {
			final cat = Animal(name: 'Cat', icon: Icons.pets);
			final dog = Animal(name: 'Dog', icon: Icons.person);

			expect(cat.name, 'Cat');
			expect(cat.icon, Icons.pets);

			expect(dog.name, 'Dog');
			expect(dog.icon, Icons.person);
		});

		// Assuming there are methods for serialization/deserialization
		test('should serialize and deserialize correctly', () {
			final animal = Animal(name: 'Cat', icon: Icons.pets);
			final json = animal.toJson();
			final deserializedAnimal = Animal.fromJson(json);

			expect(deserializedAnimal.name, animal.name);
			expect(deserializedAnimal.icon, animal.icon);
		});
	});
}
