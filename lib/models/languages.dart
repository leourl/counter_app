import 'dart:ui';
import 'package:flutter/material.dart';

String languageCode = 'pt';

class _AppText {
  String listTitle;
  String counterDefaultName;
  String editNameText;
  String editNameErrorName;
  String editNameErrorText;
  String languageCode;
  String save;
  String cancel;
  String delete;
  String undo;
  String deleteMsg;
  _AppText({
    @required this.counterDefaultName,
    @required this.editNameErrorName,
    @required this.editNameErrorText,
    @required this.editNameText,
    @required this.listTitle,
    @required this.languageCode,
    @required this.save,
    @required this.cancel,
    @required this.delete,
    @required this.undo,
    @required this.deleteMsg,
  });
}

_AppText appText = _AppText(
    languageCode: 'pt',
    listTitle: 'Contadores',
    counterDefaultName: 'Novo Contador',
    editNameText: 'Por favor digite um nome para o contador:',
    editNameErrorName: 'Atenção!',
    editNameErrorText: 'Por favor digite um nome para o contador!',
    save: 'Salvar',
    cancel: 'Cancelar',
    undo: 'Desfazer',
    delete: 'Apagar',
    deleteMsg: 'apagado');

List<_AppText> _appTexts = [
  _AppText(
      languageCode: 'en',
      listTitle: 'Counters',
      counterDefaultName: 'New Counter',
      editNameText: 'Please name your counter:',
      editNameErrorName: 'Warning!',
      editNameErrorText: 'Please name your counter!',
      save: 'Save',
      cancel: 'Cancel',
      undo: 'Undo',
      delete: 'Delete',
      deleteMsg: 'deleted'),
  _AppText(
      languageCode: 'es',
      listTitle: 'Contadores',
      counterDefaultName: 'Novo Contador',
      editNameText: 'Por favor digite um nome para o contador:',
      editNameErrorName: 'Atenção!',
      editNameErrorText: 'Por favor digite um nome para o contador!',
      save: 'Salvar',
      cancel: 'Cancelar',
      undo: 'Desfazer',
      delete: 'Apagar',
      deleteMsg: 'apagado'),
];

void getLanguage(BuildContext context) {
  Locale language = Localizations.localeOf(context);
  languageCode = language.languageCode;
  print('languageCode $languageCode');
  _AppText _appText = _appTexts.singleWhere(
      (i) => i.languageCode == languageCode,
      orElse: () => appText);
  appText = _appText;
}
