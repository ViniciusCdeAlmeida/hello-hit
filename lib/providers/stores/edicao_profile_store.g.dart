// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edicao_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EdicaoProfileStore on _EdicaoProfileStore, Store {
  Computed<List<Skill>> _$skillsComputed;

  @override
  List<Skill> get skills =>
      (_$skillsComputed ??= Computed<List<Skill>>(() => super.skills,
              name: '_EdicaoProfileStore.skills'))
          .value;

  final _$_skillsObservableAtom =
      Atom(name: '_EdicaoProfileStore._skillsObservable');

  @override
  ObservableList<Skill> get _skillsObservable {
    _$_skillsObservableAtom.reportRead();
    return super._skillsObservable;
  }

  @override
  set _skillsObservable(ObservableList<Skill> value) {
    _$_skillsObservableAtom.reportWrite(value, super._skillsObservable, () {
      super._skillsObservable = value;
    });
  }

  final _$_EdicaoProfileStoreActionController =
      ActionController(name: '_EdicaoProfileStore');

  @override
  void adicionaListaSkill(Skill skill) {
    final _$actionInfo = _$_EdicaoProfileStoreActionController.startAction(
        name: '_EdicaoProfileStore.adicionaListaSkill');
    try {
      return super.adicionaListaSkill(skill);
    } finally {
      _$_EdicaoProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeListaSkill(Skill skill) {
    final _$actionInfo = _$_EdicaoProfileStoreActionController.startAction(
        name: '_EdicaoProfileStore.removeListaSkill');
    try {
      return super.removeListaSkill(skill);
    } finally {
      _$_EdicaoProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
skills: ${skills}
    ''';
  }
}
