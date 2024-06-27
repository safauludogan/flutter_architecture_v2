import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weefit/feature/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_weefit/product/init/config/app_environment.dart';
import 'package:flutter_weefit/product/init/language/locale_keys.g.dart';
import 'package:flutter_weefit/product/init/product_localization.dart';
import 'package:flutter_weefit/product/navigation/app_router.dart';
import 'package:flutter_weefit/product/utility/constants/enums/locales.dart';
import 'package:flutter_weefit/product/widget/project_network_image.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProjectNetworkImage(
              url: 'https://picsum.photos/200/300',
              size: Size(100, 100),
            ),
            Assets.icons.icCheck.svg(
              package: 'gen',
            ),
            Assets.images.imgBottle.image(package: 'gen'),
            ElevatedButton(
              onPressed: () {
                final response = context.router.push<bool?>(
                  HomeDetailRoute(id: '1'),
                );
              },
              child: Text(
                AppEnvironmentItems.baseUrl.value,
                style: context.general.textTheme.bodyLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ProductLocalization.updateLanguage(
                  context: context,
                  value: Locales.tr,
                );
              },
              child: Center(
                child: const Text(LocaleKeys.general_button_save).tr(
                  args: ['Safa'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
