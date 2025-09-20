import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/feature/settings/presentation/widget/dark_mode_setting.dart';
import 'package:movie_app/feature/settings/presentation/widget/language_setting.dart';
import 'package:movie_app/feature/settings/presentation/widget/settings_placehodler.dart';
import 'package:movie_app/generated/l10n.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 24,
          children: [
            SettingsPlaceholder(
              title: S.current.appearence,
              settings: [
                DarkModeSetting(),
              ],
            ),
            SettingsPlaceholder(
              title: S.current.language,
              settings: [
                LanguageSetting(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
