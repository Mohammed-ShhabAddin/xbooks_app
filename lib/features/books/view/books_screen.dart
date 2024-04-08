import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/features/books/logic/books_cubit.dart';
import 'package:xbooks_store/features/books/logic/books_state.dart';
import 'package:xbooks_store/features/books/view/widgets/search_text_form_field.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/widgets/custom_book_card_widget.dart';
import '../../../core/widgets/shimmer_loading.dart';
import '../data/model/products.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    List<Product> books = [];

    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<BooksCubit>()..emitGetAllBooksProducts(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),

              //  ** SEARCH ** for a book
              child: SearchTextFormField(),
              // // // //
            ),

            // list of all **BOOKS** in the sotre
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: BlocBuilder<BooksCubit, BooksState<Products>>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const ShimmerBookLoading(),
                      success: (response) {
                        books.addAll(response.data!.products!);
                        for (var product in books) {
                          print(" books list of page one $product");
                        }
                        scrollController.addListener(() {
                          if (scrollController.position.pixels ==
                              scrollController.position.maxScrollExtent) {
                            context.read<BooksCubit>().emitGetAllBooksProducts(
                                  page: response.data!.meta!.currentPage! + 1,
                                );
                            books.addAll(response.data!.products!);
                            for (var product in books) {
                              print(" books list of page tow $product");
                            }
                          }
                        });

                        if (response.data!.meta!.total == 0) {
                          return const Center(
                            child: Text('No books found.'),
                          );
                        }
                        if (response.data?.links!.next == null) {
                          //This implementation is illogical
                          //  context.read<BooksCubit>().emitGetAllBooksProducts(
                          //       page: 1,
                          //     );
                          Fluttertoast.showToast(
                            msg: 'no more books ',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }

                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            var item = books[index];
                            return InkWell(
                              onTap: () {
                                //TODO:navigate to related category screen
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBooksCardWidget(
                                  name: item.name!,
                                  category: item.category!,
                                  discount: item.discount!,
                                  imageUrl: item.image!,
                                  price: item.price!,
                                  priceAfterDiscount: item.priceAfterDiscount!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      searchSuccess: (respones) {
                        books.clear();
                        books.addAll(respones.data!.products!);
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            var item = books[index];
                            return InkWell(
                              onTap: () {
                                //TODO:navigate to related category screen
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBooksCardWidget(
                                  name: item.name!,
                                  category: item.category!,
                                  discount: item.discount!,
                                  imageUrl: item.image!,
                                  price: item.price!,
                                  priceAfterDiscount: item.priceAfterDiscount!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error) {
                        return Text('Error: $error');
                      },
                      orElse: () {
                        return const Text('Something went wrong');
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/**class BooksScreen extends StatelessWidget {
  const BooksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    List<Product> books = [];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),

            //  ** SEARCH ** for a book
            child: SearchTextFormField(),
            // // // //
          ),

          // list of all **BOOKS** in the sotre
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
              child: BlocProvider(
                create: (context) =>
                    getIt<BooksCubit>()..emitGetAllBooksProducts(),
                child: BlocBuilder<BooksCubit, BooksState<Products>>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const ShimmerBookLoading(),
                      success: (response) {
                        books.addAll(response.data!.products!);
                        for (var product in books) {
                          print(" books list of page one $product");
                        }
                        scrollController.addListener(() {
                          if (scrollController.position.pixels ==
                              scrollController.position.maxScrollExtent) {
                            context.read<BooksCubit>().emitGetAllBooksProducts(
                                  page: response.data!.meta!.currentPage! + 1,
                                );
                            books.addAll(response.data!.products!);
                            for (var product in books) {
                              print(" books list of page tow $product");
                            }
                          }
                        });

                        if (response.data!.meta!.total == 0) {
                          return const Center(
                            child: Text('No books found.'),
                          );
                        }
                        if (response.data?.links!.next == null) {
                          //This implementation is illogical
                          //  context.read<BooksCubit>().emitGetAllBooksProducts(
                          //       page: 1,
                          //     );
                          Fluttertoast.showToast(
                            msg: 'no more books ',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }

                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            var item = books[index];
                            return InkWell(
                              onTap: () {
                                //TODO:navigate to related category screen
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBooksCardWidget(
                                  name: item.name!,
                                  category: item.category!,
                                  discount: item.discount!,
                                  imageUrl: item.image!,
                                  price: item.price!,
                                  priceAfterDiscount: item.priceAfterDiscount!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      searchSuccess: (respones) {
                        books.clear();
                        books.addAll(respones.data!.products!);
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            var item = books[index];
                            return InkWell(
                              onTap: () {
                                //TODO:navigate to related category screen
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBooksCardWidget(
                                  name: item.name!,
                                  category: item.category!,
                                  discount: item.discount!,
                                  imageUrl: item.image!,
                                  price: item.price!,
                                  priceAfterDiscount: item.priceAfterDiscount!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error) {
                        return Text('Error: $error');
                      },
                      orElse: () {
                        return const Text('Something went wrong');
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */

/**import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xbooks_store/features/books/logic/books_cubit.dart';
import 'package:xbooks_store/features/books/logic/books_state.dart';
import 'package:xbooks_store/features/books/view/widgets/search_text_form_field.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/widgets/custom_book_card_widget.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),

            //  ** SEARCH ** for a book
            child: SearchTextFormField(),
            // // // //
          ),

          // list of all **BOOKS** in the sotre
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
              child: BlocProvider(
                create: (context) =>
                    getIt<BooksCubit>()..emitGetAllBooksProducts(),
                child: BlocBuilder<BooksCubit, BooksState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (response) {
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: response.data?.products.length,
                          itemBuilder: (context, index) {
                            var item = response.data?.products?[index];
                            return InkWell(
                              onTap: () {
                                //TODO:navigate to related category screen
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBooksCardWidget(
                                  name: item.name,
                                  category: item.category,
                                  discount: item.discount,
                                  imageUrl: item.image,
                                  price: item.price,
                                  priceAfterDiscount: item.priceAfterDiscount,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error) {
                        return Text('Error: $error');
                      },
                      orElse: () {
                        return const Text('Something went wrong');
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */