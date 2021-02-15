import 'package:mobx/mobx.dart';

import 'package:hellohit/models/index_models.dart';

part 'edicao_profile_store.g.dart';

class EdicaoProfileStore = _EdicaoProfileStore with _$EdicaoProfileStore;

abstract class _EdicaoProfileStore with Store {
  @observable
  ObservableList<Skill> _skillsObservable = ObservableList<Skill>();

  @computed
  List<Skill> get skills {
    return [..._skillsObservable];
  }

  @action
  void adicionaListaSkill(Skill skill) {
    _skillsObservable.add(skill);
  }

  @action
  void removeListaSkill(Skill skill) {
    _skillsObservable.remove(skill);
  }
}
