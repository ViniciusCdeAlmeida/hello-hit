// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimeStore on _TimeStore, Store {
  Computed<List<ProfileTime>> _$timesComputed;

  @override
  List<ProfileTime> get times =>
      (_$timesComputed ??= Computed<List<ProfileTime>>(() => super.times,
              name: '_TimeStore.times'))
          .value;
  Computed<TimeState> _$timeStateComputed;

  @override
  TimeState get timeState =>
      (_$timeStateComputed ??= Computed<TimeState>(() => super.timeState,
              name: '_TimeStore.timeState'))
          .value;

  final _$_timesObservableAtom = Atom(name: '_TimeStore._timesObservable');

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

  final _$_timesFutureAtom = Atom(name: '_TimeStore._timesFuture');

  @override
  ObservableFuture<List<ProfileTime>> get _timesFuture {
    _$_timesFutureAtom.reportRead();
    return super._timesFuture;
  }

  @override
  set _timesFuture(ObservableFuture<List<ProfileTime>> value) {
    _$_timesFutureAtom.reportWrite(value, super._timesFuture, () {
      super._timesFuture = value;
    });
  }

  final _$buscandoAtom = Atom(name: '_TimeStore.buscando');

  @override
  bool get buscando {
    _$buscandoAtom.reportRead();
    return super.buscando;
  }

  @override
  set buscando(bool value) {
    _$buscandoAtom.reportWrite(value, super.buscando, () {
      super.buscando = value;
    });
  }

  final _$getTeamsAsyncAction = AsyncAction('_TimeStore.getTeams');

  @override
  Future<void> getTeams() {
    return _$getTeamsAsyncAction.run(() => super.getTeams());
  }

  final _$getTeamsPaginationAsyncAction =
      AsyncAction('_TimeStore.getTeamsPagination');

  @override
  Future<dynamic> getTeamsPagination() {
    return _$getTeamsPaginationAsyncAction
        .run(() => super.getTeamsPagination());
  }

  @override
  String toString() {
    return '''
buscando: ${buscando},
times: ${times},
timeState: ${timeState}
    ''';
  }
}
