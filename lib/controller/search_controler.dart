import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telephony/telephony.dart';
import 'package:sms/util/extensions.dart';
import '../repo/sms_repo.dart';
import 'dart:convert';
import 'package:sms/util/constant.dart';
final searchController =
    ChangeNotifierProvider.autoDispose<SearchController>((ref) {
  return SearchController(ref.read);
});

class SearchController extends ChangeNotifier {
  final Reader read;
  late final SMSRepoController _repoController;

  List<SmsMessage> _sms = [];

  String _searchText = '';

  SearchController(this.read) {
    _repoController = SMSRepoController();
    _init();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future _init() async {
    isLoading = true;
    await searchSMS();
    isLoading = false;
  }

  Future searchSMS() async {
    // search smss
    final smss = await _repoController.searchSms(_searchText);
    // update smss list
    _sms = smss;
    sumAmountOfMassages();
    notifyListeners();
  }

  List<SmsMessage> get sms => _sms;
  double smsAmount = 0.0;

  sumAmountOfMassages() {
    List<int> numInMessage = [];
    smsAmount = 0.0;
    _sms.forEach((e) => numInMessage.add(e.body!.getAmountFromStrEX));


    if (numInMessage.isNotEmpty)
      smsAmount =
          numInMessage.reduce((value, current) => value + current).toDouble();
    notifyListeners();
  }

  Future refresh() async {
    isLoading = true;
    await searchSMS();
    isLoading = false;
  }

  bool get searchTextIsEmpty => _searchText.trim().isEmpty;

  bool get searchTextIsNotEmpty => _searchText.trim().isNotEmpty;

  String get searchText => _searchText;

  void search(String value) async {
    if (value.trim() == _searchText) {
      return;
    }

    _searchText = value;

    refresh();
  }

  void clearSearch() {
    if (searchTextIsEmpty) {
      notifyListeners();
      return;
    }
    search('');
  }

  void showSearchField() {
    notifyListeners();
  }
}
