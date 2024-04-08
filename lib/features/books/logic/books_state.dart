import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_state.freezed.dart';

@freezed
class BooksState<T> with _$BooksState<T> {
  const factory BooksState.initial() = _Initial;

  const factory BooksState.loading() = Loading;
  const factory BooksState.success(T data) = Success<T>;
  const factory BooksState.searchSuccess(T data) = SearchSuccess<T>;

  const factory BooksState.error({required String error}) = Error;
}
