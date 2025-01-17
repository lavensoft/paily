import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:paily/shared/themes/app_padding.theme.dart';
import 'package:paily/shared/themes/app_radius.theme.dart';
import 'package:paily/shared/widgets/view_appbar.widget.dart';

class DepositHubListView extends HookConsumerWidget {
  const DepositHubListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: ViewAppBar(),
          body: Padding(
            padding: AppPaddingTheme.contentPadding,
            child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    HugeIcons.strokeRoundedBank,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'CN Son Tra',
                    style: theme.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    '1011 Ngo Quyen, Phuong An Hai Dong, Quan Son Tra',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  trailing: Text(
                    '1,70 km',
                  ),
                  onTap: () async {
                    await MapsLauncher.launchCoordinates(16.0669674, 108.2327704);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadiusTheme.childRadius,
                  ),
                ),
            ),
          )
        ),
      ),
    );
  }
}