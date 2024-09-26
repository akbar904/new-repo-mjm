
import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalText extends StatelessWidget {
	final Animal animal;

	const AnimalText({required this.animal});

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Icon(animal.icon),
				const SizedBox(width: 8),
				Text(animal.name),
			],
		);
	}
}
