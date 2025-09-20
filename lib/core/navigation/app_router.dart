import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: MoviesRoute.page, initial: true),
            AutoRoute(page: MovieSearchRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: MovieDetailsRoute.page),
        AutoRoute(page: SeeMoreRoute.page),
      ];
}
