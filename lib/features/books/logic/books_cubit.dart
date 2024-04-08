import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/features/books/data/repo/books_repo.dart';

import '../data/model/products.dart';
import 'books_state.dart';

class BooksCubit extends Cubit<BooksState<Products>> {
  final BooksRepo _booksRepo;

  BooksCubit(this._booksRepo) : super(const BooksState.initial());

//****************************************/
  int currentPage = 1;
  bool isFirstLoadRunning = false;
  bool isLoadmoreRunnung = false;
  bool hasNextpage = true;
  int limit = 15; //not nedded

  final searchTextEditingController = TextEditingController();
  List<Product> searchedbooks = [];

//****************************************/

  // -------------- All Books products V2 -------------- //
  void emitGetAllBooksProducts({int page = 1}) async {
    emit(const BooksState.loading());
    final response = await _booksRepo.getAllBooksProducts(page: page);
    response.when(
      success: (allBooksResponse) {
        emit(BooksState.success(allBooksResponse));
      },
      failure: (error) {
        emit(BooksState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }

// // -------------- All Books products -------------- //
//   void emitGetAllBooksProducts( ) async {
//     emit(const BooksState.loading());
//     final response = await _booksRepo.getAllBooksProducts();
//     response.when(success: (allBooksResponse) {
//       emit(BooksState.success(allBooksResponse));
//     }, failure: (error) {
//       emit(BooksState.error(error: error.apiErrorModel.message ?? ""));
//     });
//   }

  // -------------- Searched Books products -------------- //
  void emitGetByNameSearchedBooks(String name) async {
    emit(const BooksState.loading());
    final response = await _booksRepo.getByNameSearchedBooks(name);
    response.when(success: (searchResponse) {
      emit(BooksState.success(searchResponse));
    }, failure: (error) {
      emit(BooksState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  // -------------- Searched Books products V3 -------------- //
  void emitGetByNameSearchedBooksV3(String name) async {
    emit(const BooksState.loading());
    final response = await _booksRepo.getByNameSearchedBooks(name);
    response.when(success: (searchResponse) {
      emit(BooksState.searchSuccess(searchResponse));
    }, failure: (error) {
      emit(BooksState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
  // -------------- Searched Books products V2-------------- //

  Future<List<Product>> emitGetByNameSearchedBooksV2(String name) async {
    emit(const BooksState.loading());

    final response = await _booksRepo.getByNameSearchedBooks(name);
    response.when(success: (searchResponse) {
      emit(BooksState.success(searchResponse));

      return searchedbooks = searchResponse.data!.products!;
    }, failure: (error) {
      emit(BooksState.error(error: error.apiErrorModel.message ?? ""));
      return [];
    });
    return [];
  }

  // getSearchedList(String name) {
  //   emitGetByNameSearchedBooksV2(name);
  // }
}
