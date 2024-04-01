import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/resources/constants/constants.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/base_screen/base_consumer_widget.dart';
import 'package:test_flutter/routes/route_const.dart';
import 'package:test_flutter/services/app_setting_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends BaseConsumerWidget {
  HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSetting = ref.read(appSettingServiceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.HOME_PAGE_TITLE),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.go("/jokes");
                pushedName(context, RouteConstants.jokeRouteName);
              },
              child: Text(
                // "Get joke list",
                AppLocalizations.of(context)!.getJokeList,
                // style: Theme.of(context).textTheme.bodySmall,
                style: TextStyle(
                  color: AppTheme.darkerText,
                  fontSize: appSetting.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
