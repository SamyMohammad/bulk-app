// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_audience_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageAudiancesState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageAudiancesStateCopyWith<T, $Res> {
  factory $ManageAudiancesStateCopyWith(ManageAudiancesState<T> value,
          $Res Function(ManageAudiancesState<T>) then) =
      _$ManageAudiancesStateCopyWithImpl<T, $Res, ManageAudiancesState<T>>;
}

/// @nodoc
class _$ManageAudiancesStateCopyWithImpl<T, $Res,
        $Val extends ManageAudiancesState<T>>
    implements $ManageAudiancesStateCopyWith<T, $Res> {
  _$ManageAudiancesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ManageAudiancesStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ManageAudiancesState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ManageAudiancesState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$AudienceLoadingStateImplCopyWith<T, $Res> {
  factory _$$AudienceLoadingStateImplCopyWith(
          _$AudienceLoadingStateImpl<T> value,
          $Res Function(_$AudienceLoadingStateImpl<T>) then) =
      __$$AudienceLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AudienceLoadingStateImplCopyWithImpl<T, $Res>
    extends _$ManageAudiancesStateCopyWithImpl<T, $Res,
        _$AudienceLoadingStateImpl<T>>
    implements _$$AudienceLoadingStateImplCopyWith<T, $Res> {
  __$$AudienceLoadingStateImplCopyWithImpl(_$AudienceLoadingStateImpl<T> _value,
      $Res Function(_$AudienceLoadingStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AudienceLoadingStateImpl<T> implements AudienceLoadingState<T> {
  const _$AudienceLoadingStateImpl();

  @override
  String toString() {
    return 'ManageAudiancesState<$T>.audienceLoadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudienceLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) {
    return audienceLoadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) {
    return audienceLoadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceLoadingState != null) {
      return audienceLoadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) {
    return audienceLoadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) {
    return audienceLoadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceLoadingState != null) {
      return audienceLoadingState(this);
    }
    return orElse();
  }
}

abstract class AudienceLoadingState<T> implements ManageAudiancesState<T> {
  const factory AudienceLoadingState() = _$AudienceLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$AudienceEmptyStateImplCopyWith<T, $Res> {
  factory _$$AudienceEmptyStateImplCopyWith(_$AudienceEmptyStateImpl<T> value,
          $Res Function(_$AudienceEmptyStateImpl<T>) then) =
      __$$AudienceEmptyStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AudienceEmptyStateImplCopyWithImpl<T, $Res>
    extends _$ManageAudiancesStateCopyWithImpl<T, $Res,
        _$AudienceEmptyStateImpl<T>>
    implements _$$AudienceEmptyStateImplCopyWith<T, $Res> {
  __$$AudienceEmptyStateImplCopyWithImpl(_$AudienceEmptyStateImpl<T> _value,
      $Res Function(_$AudienceEmptyStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AudienceEmptyStateImpl<T> implements AudienceEmptyState<T> {
  const _$AudienceEmptyStateImpl();

  @override
  String toString() {
    return 'ManageAudiancesState<$T>.audienceEmptyState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudienceEmptyStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) {
    return audienceEmptyState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) {
    return audienceEmptyState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceEmptyState != null) {
      return audienceEmptyState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) {
    return audienceEmptyState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) {
    return audienceEmptyState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceEmptyState != null) {
      return audienceEmptyState(this);
    }
    return orElse();
  }
}

abstract class AudienceEmptyState<T> implements ManageAudiancesState<T> {
  const factory AudienceEmptyState() = _$AudienceEmptyStateImpl<T>;
}

/// @nodoc
abstract class _$$AudienceSuccessStateImplCopyWith<T, $Res> {
  factory _$$AudienceSuccessStateImplCopyWith(
          _$AudienceSuccessStateImpl<T> value,
          $Res Function(_$AudienceSuccessStateImpl<T>) then) =
      __$$AudienceSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<Audiences>? audiences});
}

/// @nodoc
class __$$AudienceSuccessStateImplCopyWithImpl<T, $Res>
    extends _$ManageAudiancesStateCopyWithImpl<T, $Res,
        _$AudienceSuccessStateImpl<T>>
    implements _$$AudienceSuccessStateImplCopyWith<T, $Res> {
  __$$AudienceSuccessStateImplCopyWithImpl(_$AudienceSuccessStateImpl<T> _value,
      $Res Function(_$AudienceSuccessStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audiences = freezed,
  }) {
    return _then(_$AudienceSuccessStateImpl<T>(
      freezed == audiences
          ? _value._audiences
          : audiences // ignore: cast_nullable_to_non_nullable
              as List<Audiences>?,
    ));
  }
}

/// @nodoc

class _$AudienceSuccessStateImpl<T> implements AudienceSuccessState<T> {
  const _$AudienceSuccessStateImpl(final List<Audiences>? audiences)
      : _audiences = audiences;

  final List<Audiences>? _audiences;
  @override
  List<Audiences>? get audiences {
    final value = _audiences;
    if (value == null) return null;
    if (_audiences is EqualUnmodifiableListView) return _audiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ManageAudiancesState<$T>.audienceSuccessState(audiences: $audiences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudienceSuccessStateImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._audiences, _audiences));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_audiences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudienceSuccessStateImplCopyWith<T, _$AudienceSuccessStateImpl<T>>
      get copyWith => __$$AudienceSuccessStateImplCopyWithImpl<T,
          _$AudienceSuccessStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) {
    return audienceSuccessState(audiences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) {
    return audienceSuccessState?.call(audiences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceSuccessState != null) {
      return audienceSuccessState(audiences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) {
    return audienceSuccessState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) {
    return audienceSuccessState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceSuccessState != null) {
      return audienceSuccessState(this);
    }
    return orElse();
  }
}

abstract class AudienceSuccessState<T> implements ManageAudiancesState<T> {
  const factory AudienceSuccessState(final List<Audiences>? audiences) =
      _$AudienceSuccessStateImpl<T>;

  List<Audiences>? get audiences;
  @JsonKey(ignore: true)
  _$$AudienceSuccessStateImplCopyWith<T, _$AudienceSuccessStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AudienceErrorStateImplCopyWith<T, $Res> {
  factory _$$AudienceErrorStateImplCopyWith(_$AudienceErrorStateImpl<T> value,
          $Res Function(_$AudienceErrorStateImpl<T>) then) =
      __$$AudienceErrorStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$AudienceErrorStateImplCopyWithImpl<T, $Res>
    extends _$ManageAudiancesStateCopyWithImpl<T, $Res,
        _$AudienceErrorStateImpl<T>>
    implements _$$AudienceErrorStateImplCopyWith<T, $Res> {
  __$$AudienceErrorStateImplCopyWithImpl(_$AudienceErrorStateImpl<T> _value,
      $Res Function(_$AudienceErrorStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$AudienceErrorStateImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$AudienceErrorStateImpl<T> implements AudienceErrorState<T> {
  const _$AudienceErrorStateImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'ManageAudiancesState<$T>.audienceErrorState(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudienceErrorStateImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudienceErrorStateImplCopyWith<T, _$AudienceErrorStateImpl<T>>
      get copyWith => __$$AudienceErrorStateImplCopyWithImpl<T,
          _$AudienceErrorStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() audienceLoadingState,
    required TResult Function() audienceEmptyState,
    required TResult Function(List<Audiences>? audiences) audienceSuccessState,
    required TResult Function(ApiErrorModel apiErrorModel) audienceErrorState,
  }) {
    return audienceErrorState(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? audienceLoadingState,
    TResult? Function()? audienceEmptyState,
    TResult? Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult? Function(ApiErrorModel apiErrorModel)? audienceErrorState,
  }) {
    return audienceErrorState?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? audienceLoadingState,
    TResult Function()? audienceEmptyState,
    TResult Function(List<Audiences>? audiences)? audienceSuccessState,
    TResult Function(ApiErrorModel apiErrorModel)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceErrorState != null) {
      return audienceErrorState(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(AudienceLoadingState<T> value)
        audienceLoadingState,
    required TResult Function(AudienceEmptyState<T> value) audienceEmptyState,
    required TResult Function(AudienceSuccessState<T> value)
        audienceSuccessState,
    required TResult Function(AudienceErrorState<T> value) audienceErrorState,
  }) {
    return audienceErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult? Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult? Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult? Function(AudienceErrorState<T> value)? audienceErrorState,
  }) {
    return audienceErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(AudienceLoadingState<T> value)? audienceLoadingState,
    TResult Function(AudienceEmptyState<T> value)? audienceEmptyState,
    TResult Function(AudienceSuccessState<T> value)? audienceSuccessState,
    TResult Function(AudienceErrorState<T> value)? audienceErrorState,
    required TResult orElse(),
  }) {
    if (audienceErrorState != null) {
      return audienceErrorState(this);
    }
    return orElse();
  }
}

abstract class AudienceErrorState<T> implements ManageAudiancesState<T> {
  const factory AudienceErrorState(final ApiErrorModel apiErrorModel) =
      _$AudienceErrorStateImpl<T>;

  ApiErrorModel get apiErrorModel;
  @JsonKey(ignore: true)
  _$$AudienceErrorStateImplCopyWith<T, _$AudienceErrorStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
