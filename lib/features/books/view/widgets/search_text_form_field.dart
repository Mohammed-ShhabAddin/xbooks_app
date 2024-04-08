import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/books_cubit.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController =
        context.watch<BooksCubit>().searchTextEditingController;
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          //borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.teal),
        ),
      ),
      onChanged: (value) {
        context.read<BooksCubit>().emitGetByNameSearchedBooksV3(value);
        if (value.isEmpty) {
          context.read<BooksCubit>().emitGetAllBooksProducts();
        }
      },
    );
  }
}
