import 'package:hellohit/models/oportunidade_model.dart';
import 'package:hellohit/models/post_model.dart';
import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/marketplace_controller.dart';
import 'package:hellohit/providers/post_controller.dart';
import 'package:hellohit/providers/profile_controller.dart';
import 'package:hellohit/providers/stores/post_store.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

enum ProfileState {
  inicial,
  carregando,
  carregado,
}

abstract class _ProfileStore with Store {
  final ProfileController _profileController;
  final PostStore _postStore;
  _ProfileStore(
    this._profileController,
    this._postStore,
  );

  @observable
  ObservableList<Usuario> _profilesObservable = ObservableList<Usuario>();

  @observable
  Usuario _profileObservable;

  @observable
  ObservableFuture<Usuario> _profileFuture;

  @observable
  ObservableFuture<List<Usuario>> _profilesFuture;

  @computed
  List<Usuario> get usuarios {
    return [..._profilesObservable];
  }

  @computed
  Usuario get usuario {
    return _profileObservable;
  }

  @computed
  // ignore: missing_return
  ProfileState get profilesState {
    if ((_profilesFuture == null ||
        _profilesFuture.status == FutureStatus.rejected)) {
      return ProfileState.inicial;
    }

    if (_profilesFuture.status == FutureStatus.pending) {
      return ProfileState.carregando;
    }

    if (_profilesFuture.status == FutureStatus.fulfilled)
      return ProfileState.carregado;
  }

  @computed
  // ignore: missing_return
  ProfileState get profileState {
    if ((_profileFuture == null ||
        _profileFuture.status == FutureStatus.rejected)) {
      return ProfileState.inicial;
    }

    if (_profileFuture.status == FutureStatus.pending) {
      return ProfileState.carregando;
    }

    if (_profileFuture.status == FutureStatus.fulfilled)
      return ProfileState.carregado;
  }

  @action
  Future<void> seed() async {
    try {
      _profilesFuture = ObservableFuture(
        _profileController.seed(),
      );
      _profilesObservable = (await _profilesFuture).asObservable();
    } catch (e) {
      throw e;
    }
  }

  List<Usuario> loadUsers(List id) {
    List<Usuario> temp = [];
    id.forEach((idUsuario) {
      // var idTemp = int.parse(idUsuario);
      temp.addAll(_profilesObservable
          .where((element) => element.id.toString() == idUsuario.toString())
          .toList());
    });
    return temp;
  }

  @action
  Future<void> loadProfile(int id) async {
    try {
      List<Post> postTemp;
      _postStore.seed().whenComplete(() {
        postTemp = _postStore.loadUserPosts(id);
        _profileObservable =
            _profilesObservable.firstWhere((element) => element.id == id);
        _profileObservable.posts = postTemp;
        _profileObservable.usuarios = loadUsers(_profileObservable.idUsuarios);
      });
    } catch (e) {
      throw e;
    }
  }
}
