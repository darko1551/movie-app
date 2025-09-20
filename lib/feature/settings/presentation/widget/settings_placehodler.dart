import 'package:flutter/material.dart';

class SettingsPlaceholder extends StatelessWidget {
  final String title;
  final List<Widget> settings;
  const SettingsPlaceholder({
    super.key,
    required this.title,
    required this.settings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ...settings.map(
          (setting) => Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: setting,
          ),
        ),
      ],
    );
  }
}
