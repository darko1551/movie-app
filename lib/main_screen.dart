import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';
import 'package:movie_app/core/navigation/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/generated/l10n.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _tabs = [
    MoviesRoute(),
    MovieSearchRoute(),
    SettingsRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return AutoTabsScaffold(
          routes: _tabs,
          animationDuration: const Duration(milliseconds: 300),
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) {
                serviceLocator<BottomNavigationBloc>().add(BottomNavigationEvent.changeTab(index));
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(Icons.movie),
                    ),
                    label: S.current.movies),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.search),
                    ),
                    label: S.current.search),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.settings),
                    ),
                    label: S.current.settings),
              ],
            );
          },
        );
      },
    );
  }
}
