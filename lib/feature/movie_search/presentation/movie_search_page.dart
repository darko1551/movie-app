import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/custom_text_field.dart';
import 'package:movie_app/feature/movie_search/domain/bloc/movie_search_bloc.dart';
import 'package:movie_app/feature/movie_search/presentation/widget/filters.dart';
import 'package:movie_app/feature/movie_search/presentation/widget/movie_list.dart';
import 'package:movie_app/generated/l10n.dart';

@RoutePage()
class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  late TextEditingController _searchTextEditingController;
  late TextEditingController _yearTextEditingController;
  final ScrollController _scrollController = ScrollController();
  Timer? _searchDebounceTimer;
  Timer? _yearDebounceTimer;

  @override
  void initState() {
    _searchTextEditingController = TextEditingController()..addListener(_onSearchChanged);
    _yearTextEditingController = TextEditingController()..addListener(_onYearChanged);
    _scrollController.addListener(_addMoreItems);
    super.initState();
  }

  void _onYearChanged() {
    // Cancel previous timer to prevent multiple API calls while user is typing
    if (_yearDebounceTimer?.isActive ?? false) _yearDebounceTimer!.cancel();
    _yearDebounceTimer = Timer(Duration(seconds: 1), () {
      final year = _yearTextEditingController.text;
      final query = _searchTextEditingController.text;
      search(query, year);
    });
  }

  void _onSearchChanged() {
    // Debounce search: wait 1 second after user stops typing before searching
    if (_searchDebounceTimer?.isActive ?? false) _searchDebounceTimer!.cancel();
    _searchDebounceTimer = Timer(Duration(seconds: 1), () {
      final query = _searchTextEditingController.text;
      final year = _yearTextEditingController.text;
      search(query, year);
    });
  }

  void search(String query, String year) async {
    // Reset pagination when search query changes
    serviceLocator<MovieSearchBloc>().add(MovieSearchEvent.reset());
    if (query.isNotEmpty) {
      serviceLocator<MovieSearchBloc>().add(MovieSearchEvent.search(query, year));
    }
  }

  @override
  void dispose() {
    serviceLocator<MovieSearchBloc>().add(MovieSearchEvent.reset());
    _searchDebounceTimer?.cancel();
    _yearDebounceTimer?.cancel();
    _searchTextEditingController.dispose();
    _yearTextEditingController.dispose();
    super.dispose();
  }

  void _addMoreItems() {
    final state = serviceLocator<MovieSearchBloc>().state;
    // Load next page when user scrolls to the bottom
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      state.maybeWhen(
        error: (_, __, ___) {},
        loading: (_, __) {},
        orElse: () {
          serviceLocator<MovieSearchBloc>().add(
            MovieSearchEvent.search(
              _searchTextEditingController.text,
              _yearTextEditingController.text,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.search_movies),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                controller: _searchTextEditingController,
                hint: S.current.search,
                icon: Icons.search,
                suffixIcon: Icons.clear_rounded,
                onSufixTaped: () {
                  _searchTextEditingController.clear();
                },
              ),
              Filters(
                yearTextEditingController: _yearTextEditingController,
              ),
              MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}
