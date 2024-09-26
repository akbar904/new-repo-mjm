
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal.dart';

class AnimalState {
	final String name;
	final IconData icon;

	AnimalState({required this.name, required this.icon});

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (runtimeType != other.runtimeType) return false;
		final AnimalState otherState = other as AnimalState;
		return name == otherState.name && icon == otherState.icon;
	}

	@override
	int get hashCode => name.hashCode ^ icon.hashCode;
}

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(name: 'Cat', icon: Icons.pets));

	void toggleAnimal() {
		if (state.name == 'Cat') {
			emit(AnimalState(name: 'Dog', icon: Icons.person));
		} else {
			emit(AnimalState(name: 'Cat', icon: Icons.pets));
		}
	}
}
