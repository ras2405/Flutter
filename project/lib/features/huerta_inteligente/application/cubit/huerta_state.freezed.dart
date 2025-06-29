// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'huerta_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HuertaState {
  List<Cultivo> get cultivos => throw _privateConstructorUsedError;

  /// Create a copy of HuertaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HuertaStateCopyWith<HuertaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HuertaStateCopyWith<$Res> {
  factory $HuertaStateCopyWith(
    HuertaState value,
    $Res Function(HuertaState) then,
  ) = _$HuertaStateCopyWithImpl<$Res, HuertaState>;
  @useResult
  $Res call({List<Cultivo> cultivos});
}

/// @nodoc
class _$HuertaStateCopyWithImpl<$Res, $Val extends HuertaState>
    implements $HuertaStateCopyWith<$Res> {
  _$HuertaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HuertaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cultivos = null}) {
    return _then(
      _value.copyWith(
            cultivos: null == cultivos
                ? _value.cultivos
                : cultivos // ignore: cast_nullable_to_non_nullable
                      as List<Cultivo>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HuertaStateImplCopyWith<$Res>
    implements $HuertaStateCopyWith<$Res> {
  factory _$$HuertaStateImplCopyWith(
    _$HuertaStateImpl value,
    $Res Function(_$HuertaStateImpl) then,
  ) = __$$HuertaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cultivo> cultivos});
}

/// @nodoc
class __$$HuertaStateImplCopyWithImpl<$Res>
    extends _$HuertaStateCopyWithImpl<$Res, _$HuertaStateImpl>
    implements _$$HuertaStateImplCopyWith<$Res> {
  __$$HuertaStateImplCopyWithImpl(
    _$HuertaStateImpl _value,
    $Res Function(_$HuertaStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HuertaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cultivos = null}) {
    return _then(
      _$HuertaStateImpl(
        cultivos: null == cultivos
            ? _value._cultivos
            : cultivos // ignore: cast_nullable_to_non_nullable
                  as List<Cultivo>,
      ),
    );
  }
}

/// @nodoc

class _$HuertaStateImpl implements _HuertaState {
  const _$HuertaStateImpl({required final List<Cultivo> cultivos})
    : _cultivos = cultivos;

  final List<Cultivo> _cultivos;
  @override
  List<Cultivo> get cultivos {
    if (_cultivos is EqualUnmodifiableListView) return _cultivos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cultivos);
  }

  @override
  String toString() {
    return 'HuertaState(cultivos: $cultivos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HuertaStateImpl &&
            const DeepCollectionEquality().equals(other._cultivos, _cultivos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cultivos));

  /// Create a copy of HuertaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HuertaStateImplCopyWith<_$HuertaStateImpl> get copyWith =>
      __$$HuertaStateImplCopyWithImpl<_$HuertaStateImpl>(this, _$identity);
}

abstract class _HuertaState implements HuertaState {
  const factory _HuertaState({required final List<Cultivo> cultivos}) =
      _$HuertaStateImpl;

  @override
  List<Cultivo> get cultivos;

  /// Create a copy of HuertaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HuertaStateImplCopyWith<_$HuertaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
