// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceSessionBizListStore on _ServiceSessionBizListStore, Store {
  final _$sessionsAtom = Atom(name: '_ServiceSessionBizListStore.sessions');

  @override
  List<ServiceSession> get sessions {
    _$sessionsAtom.reportRead();
    return super.sessions;
  }

  @override
  set sessions(List<ServiceSession> value) {
    _$sessionsAtom.reportWrite(value, super.sessions, () {
      super.sessions = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_ServiceSessionBizListStore.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
sessions: ${sessions}
    ''';
  }
}
