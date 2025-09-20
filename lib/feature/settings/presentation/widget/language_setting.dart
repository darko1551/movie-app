import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => SizedBox.shrink(),
          loaded: (value) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value.locale.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    ),
                  )
                ],
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 0,
                  end: isExpanded ? 1 : 0,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: value, // animates from 0 → 1 smoothly
                      child: child,
                    ),
                  );
                },
                child: Column(
                  spacing: 8,
                  children: [
                    ...LocaleEnum.values.map(
                      (locale) => GestureDetector(
                        onTap: () {
                          serviceLocator<LocalizationBloc>().add(LocalizationEvent.localeChanged(locale));
                        },
                        child: Text(
                          locale.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: value.locale == locale ? FontWeight.bold : null,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
