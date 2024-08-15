// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cidade_estado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CidadeEstadoStore on _CidadeEstadoStore, Store {
  late final _$estadoSelecionadoAtom =
      Atom(name: '_CidadeEstadoStore.estadoSelecionado', context: context);

  @override
  String? get estadoSelecionado {
    _$estadoSelecionadoAtom.reportRead();
    return super.estadoSelecionado;
  }

  @override
  set estadoSelecionado(String? value) {
    _$estadoSelecionadoAtom.reportWrite(value, super.estadoSelecionado, () {
      super.estadoSelecionado = value;
    });
  }

  late final _$cidadeSelecionadaAtom =
      Atom(name: '_CidadeEstadoStore.cidadeSelecionada', context: context);

  @override
  String? get cidadeSelecionada {
    _$cidadeSelecionadaAtom.reportRead();
    return super.cidadeSelecionada;
  }

  @override
  set cidadeSelecionada(String? value) {
    _$cidadeSelecionadaAtom.reportWrite(value, super.cidadeSelecionada, () {
      super.cidadeSelecionada = value;
    });
  }

  late final _$cidadesAtom =
      Atom(name: '_CidadeEstadoStore.cidades', context: context);

  @override
  List<String> get cidades {
    _$cidadesAtom.reportRead();
    return super.cidades;
  }

  @override
  set cidades(List<String> value) {
    _$cidadesAtom.reportWrite(value, super.cidades, () {
      super.cidades = value;
    });
  }

  late final _$_CidadeEstadoStoreActionController =
      ActionController(name: '_CidadeEstadoStore', context: context);

  @override
  void setEstadoSelecionado(String? novoEstado) {
    final _$actionInfo = _$_CidadeEstadoStoreActionController.startAction(
        name: '_CidadeEstadoStore.setEstadoSelecionado');
    try {
      return super.setEstadoSelecionado(novoEstado);
    } finally {
      _$_CidadeEstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCidadeSelecionada(String? novaCidade) {
    final _$actionInfo = _$_CidadeEstadoStoreActionController.startAction(
        name: '_CidadeEstadoStore.setCidadeSelecionada');
    try {
      return super.setCidadeSelecionada(novaCidade);
    } finally {
      _$_CidadeEstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCidades(List<String> novasCidades) {
    final _$actionInfo = _$_CidadeEstadoStoreActionController.startAction(
        name: '_CidadeEstadoStore.setCidades');
    try {
      return super.setCidades(novasCidades);
    } finally {
      _$_CidadeEstadoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estadoSelecionado: ${estadoSelecionado},
cidadeSelecionada: ${cidadeSelecionada},
cidades: ${cidades}
    ''';
  }
}
