import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String _value) {
    _selectedTime = _value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  DocumentReference? _markerClassRef;
  DocumentReference? get markerClassRef => _markerClassRef;
  set markerClassRef(DocumentReference? _value) {
    _markerClassRef = _value;
  }

  bool _didPressReferralVerification = false;
  bool get didPressReferralVerification => _didPressReferralVerification;
  set didPressReferralVerification(bool _value) {
    _didPressReferralVerification = _value;
  }

  DateTime? _classDate;
  DateTime? get classDate => _classDate;
  set classDate(DateTime? _value) {
    _classDate = _value;
  }

  int _selectedDay = 0;
  int get selectedDay => _selectedDay;
  set selectedDay(int _value) {
    _selectedDay = _value;
  }

  List<dynamic> _myReservations = [];
  List<dynamic> get myReservations => _myReservations;
  set myReservations(List<dynamic> _value) {
    _myReservations = _value;
  }

  void addToMyReservations(dynamic _value) {
    _myReservations.add(_value);
  }

  void removeFromMyReservations(dynamic _value) {
    _myReservations.remove(_value);
  }

  void removeAtIndexFromMyReservations(int _index) {
    _myReservations.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
