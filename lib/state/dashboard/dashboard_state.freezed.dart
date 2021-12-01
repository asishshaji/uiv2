// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

  _DashboardStateInitial initial() {
    return const _DashboardStateInitial();
  }

  _DashboardStateLoading loading() {
    return const _DashboardStateLoading();
  }

  _DashboardStateData data(
      {required Dashboard dashboard,
      required SalesProfit salesGraphData,
      required List<RecentOrder> recentOrders}) {
    return _DashboardStateData(
      dashboard: dashboard,
      salesGraphData: salesGraphData,
      recentOrders: recentOrders,
    );
  }

  _DashboardStateError error([String? error]) {
    return _DashboardStateError(
      error,
    );
  }
}

/// @nodoc
const $DashboardState = _$DashboardStateTearOff();

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)
        data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateData value) data,
    required TResult Function(_DashboardStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;
}

/// @nodoc
abstract class _$DashboardStateInitialCopyWith<$Res> {
  factory _$DashboardStateInitialCopyWith(_DashboardStateInitial value,
          $Res Function(_DashboardStateInitial) then) =
      __$DashboardStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$DashboardStateInitialCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateInitialCopyWith<$Res> {
  __$DashboardStateInitialCopyWithImpl(_DashboardStateInitial _value,
      $Res Function(_DashboardStateInitial) _then)
      : super(_value, (v) => _then(v as _DashboardStateInitial));

  @override
  _DashboardStateInitial get _value => super._value as _DashboardStateInitial;
}

/// @nodoc

class _$_DashboardStateInitial implements _DashboardStateInitial {
  const _$_DashboardStateInitial();

  @override
  String toString() {
    return 'DashboardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DashboardStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)
        data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
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
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateData value) data,
    required TResult Function(_DashboardStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DashboardStateInitial implements DashboardState {
  const factory _DashboardStateInitial() = _$_DashboardStateInitial;
}

/// @nodoc
abstract class _$DashboardStateLoadingCopyWith<$Res> {
  factory _$DashboardStateLoadingCopyWith(_DashboardStateLoading value,
          $Res Function(_DashboardStateLoading) then) =
      __$DashboardStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$DashboardStateLoadingCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateLoadingCopyWith<$Res> {
  __$DashboardStateLoadingCopyWithImpl(_DashboardStateLoading _value,
      $Res Function(_DashboardStateLoading) _then)
      : super(_value, (v) => _then(v as _DashboardStateLoading));

  @override
  _DashboardStateLoading get _value => super._value as _DashboardStateLoading;
}

/// @nodoc

class _$_DashboardStateLoading implements _DashboardStateLoading {
  const _$_DashboardStateLoading();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DashboardStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)
        data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateData value) data,
    required TResult Function(_DashboardStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DashboardStateLoading implements DashboardState {
  const factory _DashboardStateLoading() = _$_DashboardStateLoading;
}

/// @nodoc
abstract class _$DashboardStateDataCopyWith<$Res> {
  factory _$DashboardStateDataCopyWith(
          _DashboardStateData value, $Res Function(_DashboardStateData) then) =
      __$DashboardStateDataCopyWithImpl<$Res>;
  $Res call(
      {Dashboard dashboard,
      SalesProfit salesGraphData,
      List<RecentOrder> recentOrders});
}

/// @nodoc
class __$DashboardStateDataCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateDataCopyWith<$Res> {
  __$DashboardStateDataCopyWithImpl(
      _DashboardStateData _value, $Res Function(_DashboardStateData) _then)
      : super(_value, (v) => _then(v as _DashboardStateData));

  @override
  _DashboardStateData get _value => super._value as _DashboardStateData;

  @override
  $Res call({
    Object? dashboard = freezed,
    Object? salesGraphData = freezed,
    Object? recentOrders = freezed,
  }) {
    return _then(_DashboardStateData(
      dashboard: dashboard == freezed
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Dashboard,
      salesGraphData: salesGraphData == freezed
          ? _value.salesGraphData
          : salesGraphData // ignore: cast_nullable_to_non_nullable
              as SalesProfit,
      recentOrders: recentOrders == freezed
          ? _value.recentOrders
          : recentOrders // ignore: cast_nullable_to_non_nullable
              as List<RecentOrder>,
    ));
  }
}

/// @nodoc

class _$_DashboardStateData implements _DashboardStateData {
  const _$_DashboardStateData(
      {required this.dashboard,
      required this.salesGraphData,
      required this.recentOrders});

  @override
  final Dashboard dashboard;
  @override
  final SalesProfit salesGraphData;
  @override
  final List<RecentOrder> recentOrders;

  @override
  String toString() {
    return 'DashboardState.data(dashboard: $dashboard, salesGraphData: $salesGraphData, recentOrders: $recentOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardStateData &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard) &&
            (identical(other.salesGraphData, salesGraphData) ||
                other.salesGraphData == salesGraphData) &&
            const DeepCollectionEquality()
                .equals(other.recentOrders, recentOrders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboard, salesGraphData,
      const DeepCollectionEquality().hash(recentOrders));

  @JsonKey(ignore: true)
  @override
  _$DashboardStateDataCopyWith<_DashboardStateData> get copyWith =>
      __$DashboardStateDataCopyWithImpl<_DashboardStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)
        data,
    required TResult Function(String? error) error,
  }) {
    return data(dashboard, salesGraphData, recentOrders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
  }) {
    return data?.call(dashboard, salesGraphData, recentOrders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(dashboard, salesGraphData, recentOrders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateData value) data,
    required TResult Function(_DashboardStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _DashboardStateData implements DashboardState {
  const factory _DashboardStateData(
      {required Dashboard dashboard,
      required SalesProfit salesGraphData,
      required List<RecentOrder> recentOrders}) = _$_DashboardStateData;

  Dashboard get dashboard;
  SalesProfit get salesGraphData;
  List<RecentOrder> get recentOrders;
  @JsonKey(ignore: true)
  _$DashboardStateDataCopyWith<_DashboardStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DashboardStateErrorCopyWith<$Res> {
  factory _$DashboardStateErrorCopyWith(_DashboardStateError value,
          $Res Function(_DashboardStateError) then) =
      __$DashboardStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$DashboardStateErrorCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateErrorCopyWith<$Res> {
  __$DashboardStateErrorCopyWithImpl(
      _DashboardStateError _value, $Res Function(_DashboardStateError) _then)
      : super(_value, (v) => _then(v as _DashboardStateError));

  @override
  _DashboardStateError get _value => super._value as _DashboardStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_DashboardStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DashboardStateError implements _DashboardStateError {
  const _$_DashboardStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'DashboardState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  _$DashboardStateErrorCopyWith<_DashboardStateError> get copyWith =>
      __$DashboardStateErrorCopyWithImpl<_DashboardStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)
        data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Dashboard dashboard, SalesProfit salesGraphData,
            List<RecentOrder> recentOrders)?
        data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DashboardStateInitial value) initial,
    required TResult Function(_DashboardStateLoading value) loading,
    required TResult Function(_DashboardStateData value) data,
    required TResult Function(_DashboardStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DashboardStateInitial value)? initial,
    TResult Function(_DashboardStateLoading value)? loading,
    TResult Function(_DashboardStateData value)? data,
    TResult Function(_DashboardStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DashboardStateError implements DashboardState {
  const factory _DashboardStateError([String? error]) = _$_DashboardStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$DashboardStateErrorCopyWith<_DashboardStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
