import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../base.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'code.dart';
import 'expression.dart';
import 'reference.dart';

part 'type_reference.g.dart';

@immutable
abstract class TypeReference extends Expression
    with HasGenerics
    implements Built<TypeReference, TypeReferenceBuilder>, Reference, Spec {
  factory TypeReference([
    void Function(TypeReferenceBuilder) updates,
  ]) = _$TypeReference;

  TypeReference._();

  @override
  String get symbol;

  @override
  String? get url;

  /// Optional bound generic.
  Reference? get bound;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecordType extends RecordType {
  @override
  final BuiltList<Reference> positionalFieldTypes;
  @override
  final BuiltMap<String, Reference> namedFieldTypes;
  @override
  final bool? isNullable;

  factory _$RecordType([void Function(RecordTypeBuilder)? updates]) =>
      (new RecordTypeBuilder()..update(updates)).build() as _$RecordType;

  _$RecordType._(
      {required this.positionalFieldTypes,
      required this.namedFieldTypes,
      this.isNullable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        positionalFieldTypes, r'RecordType', 'positionalFieldTypes');
    BuiltValueNullFieldError.checkNotNull(
        namedFieldTypes, r'RecordType', 'namedFieldTypes');
  }

  @override
  RecordType rebuild(void Function(RecordTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$RecordTypeBuilder toBuilder() => new _$RecordTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecordType &&
        positionalFieldTypes == other.positionalFieldTypes &&
        namedFieldTypes == other.namedFieldTypes &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, positionalFieldTypes.hashCode);
    _$hash = $jc(_$hash, namedFieldTypes.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecordType')
          ..add('positionalFieldTypes', positionalFieldTypes)
          ..add('namedFieldTypes', namedFieldTypes)
          ..add('isNullable', isNullable))
        .toString();
  }
}
