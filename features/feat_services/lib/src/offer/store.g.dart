// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceOfferStore on _ServiceOfferStore, Store {
  final _$servicesAtom = Atom(name: '_ServiceOfferStore.services');

  @override
  List<Service> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(List<Service> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_ServiceOfferStore.fetch');

  @override
  Future<dynamic> fetch(String tagKey) {
    return _$fetchAsyncAction.run(() => super.fetch(tagKey));
  }

  @override
  String toString() {
    return '''
services: ${services}
    ''';
  }
}