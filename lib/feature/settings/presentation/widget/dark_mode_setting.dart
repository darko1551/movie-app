import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/theme/bloc/bloc/theme_bloc.dart';
import 'package:movie_app/generated/l10n.dart';

class DarkModeSetting extends StatelessWidget {
  const DarkModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.current.dark_mode,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return state.map(
              initial: (value) => Center(child: CircularProgressIndicator()),
              loaded: (value) => Switch(
                value: value.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  serviceLocator<ThemeBloc>().add(ThemeEvent.toggleThemeMode());
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
