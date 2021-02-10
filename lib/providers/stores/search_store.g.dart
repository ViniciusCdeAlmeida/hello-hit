// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<List<Profile>> _$talentosComputed;

  @override
  List<Profile> get talentos =>
      (_$talentosComputed ??= Computed<List<Profile>>(() => super.talentos,
              name: '_SearchStore.talentos'))
          .value;
  Computed<List<ProfileTime>> _$timesComputed;

  @override
  List<ProfileTime> get times =>
      (_$timesComputed ??= Computed<List<ProfileTime>>(() => super.times,
              name: '_SearchStore.times'))
          .value;
  Computed<SearchState> _$searchStateComputed;

  @override
  SearchState get searchState =>
      (_$searchStateComputed ??= Computed<SearchState>(() => super.searchState,
              name: '_SearchStore.searchState'))
          .value;

  final _$_timesObservableAtom = Atom(name: '_SearchStore._timesObservable');

  @override
  ObservableList<ProfileTime> get _timesObservable {
    _$_timesObservableAtom.reportRead();
    return super._timesObservable;
  }

  @override
  set _timesObservable(ObservableList<ProfileTime> value) {
    _$_timesObservableAtom.reportWrite(value, super._timesObservable, () {
      super._timesObservable = value;
    });
  }

  final _$_talentosObservableAtom =
      Atom(name: '_SearchStore._talentosObservable');

  @override
  ObservableList<Profile> get _talentosObservable {
    _$_talentosObservableAtom.reportRead();
    return super._talentosObservable;
  }

  @override
  set _talentosObservable(ObservableList<Profile> value) {
    _$_talentosObservableAtom.reportWrite(value, super._talentosObservable, () {
      super._talentosObservable = value;
    });
  }

  final _$_searchFutureAtom = Atom(name: '_SearchStore._searchFuture');

  @override
  ObservableFuture<List<dynamic>> get _searchFuture {
    _$_searchFutureAtom.reportRead();
    return super._searchFuture;
  }

  @override
  set _searchFuture(ObservableFuture<List<dynamic>> value) {
    _$_searchFutureAtom.reportWrite(value, super._searchFuture, () {
      super._searchFuture = value;
    });
  }

  final _$getTalentosAsyncAction = AsyncAction('_SearchStore.getTalentos');

  @override
  Future<void> getTalentos(Search data) {
    return _$getTalentosAsyncAction.run(() => super.getTalentos(data));
  }

  final _$getTimesAsyncAction = AsyncAction('_SearchStore.getTimes');

  @override
  Future<void> getTimes(Search data) {
    return _$getTimesAsyncAction.run(() => super.getTimes(data));
  }

  @override
  String toString() {
    return '''
talentos: ${talentos},
times: ${times},
searchState: ${searchState}
    ''';
  }
}
