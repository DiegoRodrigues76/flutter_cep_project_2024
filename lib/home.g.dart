// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CepStore on _CepStore, Store {
  late final _$resultAtom = Atom(name: '_CepStore.result', context: context);

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$consultarCEPAsyncAction =
      AsyncAction('_CepStore.consultarCEP', context: context);

  @override
  Future<void> consultarCEP(String cep) {
    return _$consultarCEPAsyncAction.run(() => super.consultarCEP(cep));
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
