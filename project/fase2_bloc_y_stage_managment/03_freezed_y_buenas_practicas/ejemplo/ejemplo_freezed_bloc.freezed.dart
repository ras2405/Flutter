// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FruitEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FruitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FruitEvent()';
}


}

/// @nodoc
class $FruitEventCopyWith<$Res>  {
$FruitEventCopyWith(FruitEvent _, $Res Function(FruitEvent) __);
}


/// @nodoc


class SelectedFruitEvent implements FruitEvent {
  const SelectedFruitEvent(this.addedFruit);
  

 final  String addedFruit;

/// Create a copy of FruitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedFruitEventCopyWith<SelectedFruitEvent> get copyWith => _$SelectedFruitEventCopyWithImpl<SelectedFruitEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedFruitEvent&&(identical(other.addedFruit, addedFruit) || other.addedFruit == addedFruit));
}


@override
int get hashCode => Object.hash(runtimeType,addedFruit);

@override
String toString() {
  return 'FruitEvent.selectedFruit(addedFruit: $addedFruit)';
}


}

/// @nodoc
abstract mixin class $SelectedFruitEventCopyWith<$Res> implements $FruitEventCopyWith<$Res> {
  factory $SelectedFruitEventCopyWith(SelectedFruitEvent value, $Res Function(SelectedFruitEvent) _then) = _$SelectedFruitEventCopyWithImpl;
@useResult
$Res call({
 String addedFruit
});




}
/// @nodoc
class _$SelectedFruitEventCopyWithImpl<$Res>
    implements $SelectedFruitEventCopyWith<$Res> {
  _$SelectedFruitEventCopyWithImpl(this._self, this._then);

  final SelectedFruitEvent _self;
  final $Res Function(SelectedFruitEvent) _then;

/// Create a copy of FruitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? addedFruit = null,}) {
  return _then(SelectedFruitEvent(
null == addedFruit ? _self.addedFruit : addedFruit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoveFruitEvent implements FruitEvent {
  const RemoveFruitEvent(this.removedFruit);
  

 final  String removedFruit;

/// Create a copy of FruitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFruitEventCopyWith<RemoveFruitEvent> get copyWith => _$RemoveFruitEventCopyWithImpl<RemoveFruitEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFruitEvent&&(identical(other.removedFruit, removedFruit) || other.removedFruit == removedFruit));
}


@override
int get hashCode => Object.hash(runtimeType,removedFruit);

@override
String toString() {
  return 'FruitEvent.removeFruit(removedFruit: $removedFruit)';
}


}

/// @nodoc
abstract mixin class $RemoveFruitEventCopyWith<$Res> implements $FruitEventCopyWith<$Res> {
  factory $RemoveFruitEventCopyWith(RemoveFruitEvent value, $Res Function(RemoveFruitEvent) _then) = _$RemoveFruitEventCopyWithImpl;
@useResult
$Res call({
 String removedFruit
});




}
/// @nodoc
class _$RemoveFruitEventCopyWithImpl<$Res>
    implements $RemoveFruitEventCopyWith<$Res> {
  _$RemoveFruitEventCopyWithImpl(this._self, this._then);

  final RemoveFruitEvent _self;
  final $Res Function(RemoveFruitEvent) _then;

/// Create a copy of FruitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? removedFruit = null,}) {
  return _then(RemoveFruitEvent(
null == removedFruit ? _self.removedFruit : removedFruit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FruitState {

 String get selectedFruit; List<String> get availableFruits;
/// Create a copy of FruitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FruitStateCopyWith<FruitState> get copyWith => _$FruitStateCopyWithImpl<FruitState>(this as FruitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FruitState&&(identical(other.selectedFruit, selectedFruit) || other.selectedFruit == selectedFruit)&&const DeepCollectionEquality().equals(other.availableFruits, availableFruits));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFruit,const DeepCollectionEquality().hash(availableFruits));

@override
String toString() {
  return 'FruitState(selectedFruit: $selectedFruit, availableFruits: $availableFruits)';
}


}

/// @nodoc
abstract mixin class $FruitStateCopyWith<$Res>  {
  factory $FruitStateCopyWith(FruitState value, $Res Function(FruitState) _then) = _$FruitStateCopyWithImpl;
@useResult
$Res call({
 String selectedFruit, List<String> availableFruits
});




}
/// @nodoc
class _$FruitStateCopyWithImpl<$Res>
    implements $FruitStateCopyWith<$Res> {
  _$FruitStateCopyWithImpl(this._self, this._then);

  final FruitState _self;
  final $Res Function(FruitState) _then;

/// Create a copy of FruitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFruit = null,Object? availableFruits = null,}) {
  return _then(_self.copyWith(
selectedFruit: null == selectedFruit ? _self.selectedFruit : selectedFruit // ignore: cast_nullable_to_non_nullable
as String,availableFruits: null == availableFruits ? _self.availableFruits : availableFruits // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _FruitState implements FruitState {
  const _FruitState({required this.selectedFruit, required final  List<String> availableFruits}): _availableFruits = availableFruits;
  

@override final  String selectedFruit;
 final  List<String> _availableFruits;
@override List<String> get availableFruits {
  if (_availableFruits is EqualUnmodifiableListView) return _availableFruits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableFruits);
}


/// Create a copy of FruitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FruitStateCopyWith<_FruitState> get copyWith => __$FruitStateCopyWithImpl<_FruitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FruitState&&(identical(other.selectedFruit, selectedFruit) || other.selectedFruit == selectedFruit)&&const DeepCollectionEquality().equals(other._availableFruits, _availableFruits));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFruit,const DeepCollectionEquality().hash(_availableFruits));

@override
String toString() {
  return 'FruitState(selectedFruit: $selectedFruit, availableFruits: $availableFruits)';
}


}

/// @nodoc
abstract mixin class _$FruitStateCopyWith<$Res> implements $FruitStateCopyWith<$Res> {
  factory _$FruitStateCopyWith(_FruitState value, $Res Function(_FruitState) _then) = __$FruitStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedFruit, List<String> availableFruits
});




}
/// @nodoc
class __$FruitStateCopyWithImpl<$Res>
    implements _$FruitStateCopyWith<$Res> {
  __$FruitStateCopyWithImpl(this._self, this._then);

  final _FruitState _self;
  final $Res Function(_FruitState) _then;

/// Create a copy of FruitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFruit = null,Object? availableFruits = null,}) {
  return _then(_FruitState(
selectedFruit: null == selectedFruit ? _self.selectedFruit : selectedFruit // ignore: cast_nullable_to_non_nullable
as String,availableFruits: null == availableFruits ? _self._availableFruits : availableFruits // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
