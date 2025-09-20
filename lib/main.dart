import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/services/service_locator/app_bloc_providers.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/theme/bloc/bloc/theme_bloc.dart';
import 'package:movie_app/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: ".env"); //Load TMDB API key from .env file
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    return MultiBlocProvider(
      providers: appBlocProviders,
      child: Builder(
        builder: (BuildContext context) => BlocConsumer<LocalizationBloc, LocalizationState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              loaded: (value) {
                if (value.error != null) {
                  rootScaffoldMessengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text(value.error!.title),
                    ),
                  );
                }
              },
            );
          },
          builder: (context, state) {
            return state.map(
              initial: (_) => SizedBox.shrink(),
              loaded: (localeValue) {
                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return state.map(
                      initial: (_) => SizedBox.shrink(),
                      loaded: (themeValue) {
                        return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          scaffoldMessengerKey: rootScaffoldMessengerKey,
                          key: ValueKey(localeValue
                              .locale), //Used ValueKey so that entire widget try gets rebuilt at locale change
                          routerConfig: serviceLocator<AppRouter>().config(),
                          theme: themeValue.themeData,
                          localizationsDelegates: const [
                            S.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          supportedLocales: S.delegate.supportedLocales,
                          locale: localeValue.locale.toSystemLocale(),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
