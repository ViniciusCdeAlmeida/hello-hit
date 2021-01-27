import 'package:mobx/mobx.dart';

import 'package:hellohit/models/usuario_model.dart';
import 'package:hellohit/providers/search_controller.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

enum SearchState {
  inicial,
  carregando,
  carregado,
}

abstract class _SearchStore with Store {
  final SearchController _searchController;
  _SearchStore(
    this._searchController,
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
  SearchState get searchState {
    if ((_profilesFuture == null ||
        _profilesFuture.status == FutureStatus.rejected)) {
      return SearchState.inicial;
    }

    if (_profilesFuture.status == FutureStatus.pending) {
      return SearchState.carregando;
    }

    if (_profilesFuture.status == FutureStatus.fulfilled)
      return SearchState.carregado;
  }

  @action
  Future<void> seed() async {
    // try {
    //   _profilesFuture = ObservableFuture(
    //     _profileController.seed(),
    //   );
    //   _profilesObservable = (await _profilesFuture).asObservable();
    // } catch (e) {
    //   throw e;
    // }
  }

  List<Usuario> loadUsers(List id) {
    // List<Usuario> temp = [];
    // id.forEach((idUsuario) {
    //   // var idTemp = int.parse(idUsuario);
    //   temp.addAll(_profilesObservable
    //       .where((element) => element.id.toString() == idUsuario.toString())
    //       .toList());
    // });
    // return temp;
  }

  @action
  Future<void> loadProfile(int id) async {
    // try {
    //   List<Post> postTemp;
    //   _postStore.seed().whenComplete(() {
    //     postTemp = _postStore.loadUserPosts(id);
    //     _profileObservable =
    //         _profilesObservable.firstWhere((element) => element.id == id);
    //     _profileObservable.posts = postTemp;
    //     _profileObservable.usuarios = loadUsers(_profileObservable.idUsuarios);
    //     _marketplaceStore.carreirasOriginal;
    //     _profileObservable.oportunidades = [];
    //     _marketplaceStore.seed().whenComplete(
    //           () => _profileObservable.idOportunidades.forEach((id) {
    //             List<Oportunidade> oportunidadeTemp = [];

    //             oportunidadeTemp = _marketplaceStore.loadUserCarreiras();
    //             _profileObservable.oportunidades.addAll(
    //               oportunidadeTemp
    //                   .where((carreira) => carreira.id == id)
    //                   .toList(),
    //             );
    //           }),
    //         );
    //   });
    // } catch (e) {
    //   throw e;
    // }
  }
}
