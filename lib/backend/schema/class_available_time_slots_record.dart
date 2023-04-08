import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'class_available_time_slots_record.g.dart';

abstract class ClassAvailableTimeSlotsRecord
    implements
        Built<ClassAvailableTimeSlotsRecord,
            ClassAvailableTimeSlotsRecordBuilder> {
  static Serializer<ClassAvailableTimeSlotsRecord> get serializer =>
      _$classAvailableTimeSlotsRecordSerializer;

  DocumentReference? get classRef;

  String? get startTime;

  String? get endTime;

  int? get minHoursBeforeClass;

  int? get maxHoursBeforeClass;

  BuiltList<DocumentReference>? get reservations;

  int? get maxLimit;

  int? get minHoursToCancel;

  int? get creditsRequired;

  BuiltList<int>? get weekdays;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          ClassAvailableTimeSlotsRecordBuilder builder) =>
      builder
        ..startTime = ''
        ..endTime = ''
        ..minHoursBeforeClass = 0
        ..maxHoursBeforeClass = 0
        ..reservations = ListBuilder()
        ..maxLimit = 0
        ..minHoursToCancel = 0
        ..creditsRequired = 0
        ..weekdays = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classAvailableTimeSlots');

  static Stream<ClassAvailableTimeSlotsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClassAvailableTimeSlotsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClassAvailableTimeSlotsRecord._();
  factory ClassAvailableTimeSlotsRecord(
          [void Function(ClassAvailableTimeSlotsRecordBuilder) updates]) =
      _$ClassAvailableTimeSlotsRecord;

  static ClassAvailableTimeSlotsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClassAvailableTimeSlotsRecordData({
  DocumentReference? classRef,
  String? startTime,
  String? endTime,
  int? minHoursBeforeClass,
  int? maxHoursBeforeClass,
  int? maxLimit,
  int? minHoursToCancel,
  int? creditsRequired,
}) {
  final firestoreData = serializers.toFirestore(
    ClassAvailableTimeSlotsRecord.serializer,
    ClassAvailableTimeSlotsRecord(
      (c) => c
        ..classRef = classRef
        ..startTime = startTime
        ..endTime = endTime
        ..minHoursBeforeClass = minHoursBeforeClass
        ..maxHoursBeforeClass = maxHoursBeforeClass
        ..reservations = null
        ..maxLimit = maxLimit
        ..minHoursToCancel = minHoursToCancel
        ..creditsRequired = creditsRequired
        ..weekdays = null,
    ),
  );

  return firestoreData;
}
